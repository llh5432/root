package com.example.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.AdminDao;
import com.example.dao.BlogDao;
import com.example.dao.BookDao;
import com.example.dao.MemberDao;

import com.example.dao.SubmitDao;
import com.example.vo.BlogVO;
import com.example.vo.CarouselVO;
import com.example.vo.MemberVO;

import com.example.vo.SubmitVO;

import com.example.vo.BookVO;

@Controller
@RequestMapping("model")
public class modelController {

	@Autowired
	private AdminDao adminDao;

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private BlogDao blogDao;

	@Autowired
	private BookDao bookDao;

	@Autowired
	private SubmitDao submitDao;

	@RequestMapping("main")
	public String main(Model model, HttpSession session) {

		String id = (String) session.getAttribute("id");

		if (id == null) {
			return "redirect:/member/login";

		} else {
			List<MemberVO> mList = adminDao.oppaMainList();
			MemberVO memberVO = memberDao.get(id);

			model.addAttribute("list", mList);
			model.addAttribute("name", memberVO.getName());

			return "model/main";
		}
	}

	@RequestMapping("oppa")
	public String oppa(HttpSession session, @RequestParam String modelNum, Model model) throws Exception {
		String id = (String) session.getAttribute("id");

		if (id == null) {
			return "redirect:/member/login";
		} else {
			MemberVO memberVO = memberDao.getModel(modelNum);
			List<BlogVO> blogVO = blogDao.getLikeBlog(modelNum);
			int count = blogDao.getSelectCount(modelNum);
			count = 5 - count;
			System.out.println("모델번호 :" + modelNum + "공백게시글 수 : " + count);

			if (count == 0) { // 상위 5개 게시글의 count 가 5개를 넘어갈시
				System.out.println("게시글 수가 꽉 차있습니다!");
				count = 6;
				model.addAttribute("count", count);
			} else if (count < 0) {
				System.out.println("게시글 수가 넘 처 흐르네요!");
				count = 6;
				model.addAttribute("count", count);
			} else {
				System.out.println("공백 게시글 수가" + count + "개 필요합니다!");
				model.addAttribute("count", count);
			}

			int imgNum = blogDao.imgNumSelect(modelNum);
			List<CarouselVO> imgSelVO = blogDao.carouselImg(modelNum);

			model.addAttribute("selImg", imgSelVO);
			model.addAttribute("imgNum", imgNum);
			model.addAttribute("member", memberVO);
			model.addAttribute("blog", blogVO);

			return "model/oppa";
		}
	}

	@RequestMapping("bookAdd")
	public @ResponseBody int bookAdd(@ModelAttribute BookVO bookVO, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");

		System.out.println(bookVO.toString());

		bookDao.delete(id); // 가예약 삭제
		bookDao.add(id, bookVO); // 찐예약 삽입
		int select = bookDao.select(bookVO.getModel(), bookVO.getBook_date());
		System.out.println("select 값 : " + select);
		if (select == 1) {
			return 1;
		} else {
			return 0;
		}

	}

	@RequestMapping(value = "bookCheck", method = RequestMethod.POST)
	public @ResponseBody int bookCheck(HttpSession session, @RequestParam("model") String model,
			@RequestParam("book_date") String date) {

		System.out.println("model :" + model);
		System.out.println("date : " + date);
		String id = (String) session.getAttribute("id");

		int select = bookDao.select(model, date);

		if (select == 0) {
			bookDao.dummyBook(id, model, date);
			return 0;
		} else {
			return 1;
		}
	}

	@RequestMapping(value = "bookDelete", method = RequestMethod.POST)
	public @ResponseBody int bookDelete(HttpSession session) {
	
		String id = (String) session.getAttribute("id");
		
		int select = bookDao.selectNull(id);
	
		if (select == 0) {
			
			return 0;
		}else {
			
			bookDao.delete(id);

			return 0;
		}
	}

	@RequestMapping("submit")
	public String submit(@ModelAttribute SubmitVO submitVO, HttpSession session, HttpServletResponse response)
			throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");
		System.out.println(submitVO.toString());

		try {
			submitDao.add(id, submitVO);
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('admin 관리자 페이지에서 확인할 수 있습니다.');");
			out.println("location.href='/model/main';");
			out.println("</script>");
			out.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		return null;
	}

}
