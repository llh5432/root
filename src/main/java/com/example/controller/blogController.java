package com.example.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
//import java.util.HashMap;
import java.util.List;
//import java.util.Map;

//import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.IOUtils;
//import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
//import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.dao.AdminDao;
import com.example.dao.BlogDao;
//import com.example.dao.MemberDao;
import com.example.dao.ReplyDao;
import com.example.service.BlogService;
import com.example.vo.BlogVO;
//import com.example.vo.LikeBtnVO;
import com.example.vo.MemberVO;
import com.example.vo.PageVO;
import com.example.vo.ReplyVO;

@Controller
@RequestMapping("blog")
public class blogController {

	@Autowired
	private BlogDao blogDao;

	@Autowired
	private AdminDao adminDao;

//	@Autowired
//	private MemberDao memberDao;

	@Autowired
	private ReplyDao replyDao;

	@Autowired
	private BlogService blogService;

	@RequestMapping("main")
	public String BlogMain(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
			@RequestParam(value = "replyCount", required = false, defaultValue = "0") int likeCount, Model model) {

		int count = adminDao.getCountBlog();

		int pageSize = 7;

		int startRow = (pageNum - 1) * pageSize + 1;

		List<BlogVO> bList = blogDao.blogList(startRow, pageSize);

		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

		int pageBlock = 10;

		int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;

		int endPage = startPage + pageBlock - 1;

		if (endPage > pageCount) {
			endPage = pageCount;
		}

		PageVO pageVO = new PageVO();

		pageVO.setCount(count);
		pageVO.setPageNum(pageNum);
		pageVO.setPageCount(pageCount);
		pageVO.setPageBlock(pageBlock);
		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);

		List<MemberVO> oList = adminDao.oppaMainList();
		System.out.println("olist" + oList.toString());
		System.out.println("blist" + bList.toString());
		model.addAttribute("replyCount", likeCount);
		model.addAttribute("oList", oList);
		model.addAttribute("bList", bList);
		model.addAttribute("pageVO", pageVO);
		
		
		return "blog/board";
	}

	@RequestMapping("blogAdd")
	public String blogAdd(@RequestParam("b_img") MultipartFile multi, @ModelAttribute BlogVO blogVO,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		String id = (String) session.getAttribute("id");

		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("/img");
		String fileName = multi.getOriginalFilename();

		if (fileName.length() == 0) {

			try {

				blogDao.add(id, blogVO);
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('글쓰기 완료');");
				out.print("location.href='main';");
				out.print("</script>");
				out.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			}

		} else {

			try {
				String directory = id;
				File dic = new File(realPath + "/" + directory);

				if (!dic.exists()) {
					dic.mkdirs();
				}

				File file = new File(realPath + "/" + directory + "/" + fileName);
				IOUtils.copy(multi.getInputStream(), new FileOutputStream(file));

				blogVO.setB_image(fileName);
				System.out.println("blogvo에는뭐가담겼나? " + blogVO.toString());

				blogDao.add(id, blogVO);

				PrintWriter out = response.getWriter();

				out.print("<script>");
				out.print("alert('글쓰기 완료!');");
				out.print("location.href='main';");
				out.println("</script>");
				out.close();
				return null;

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			}

		}
		return null;
	}

	@RequestMapping("detail")
	public String detail(@RequestParam("b_num") int b_num, @RequestParam(value="pageNum", required= false, defaultValue ="1") int pageNum, HttpSession session,
			Model model, @RequestParam(value = "replyCount", required = false, defaultValue = "0") int count) {

		String id = (String) session.getAttribute("id");
		
		if (id == null) {
			return "redirect:/member/login";
		}else {
		BlogVO blogVO = blogDao.getBlog(b_num);
		blogDao.readCountUpdate(blogVO); // 조회수증가

		List<ReplyVO> list = replyDao.replyList(b_num);
		count = replyDao.replyCount(b_num);

		int like = blogDao.detailLikeMember(b_num, id);
		System.out.println(like);
		List<MemberVO> oList = adminDao.oppaMainList();

		model.addAttribute("pageNum", pageNum);
		model.addAttribute("oList", oList);
		model.addAttribute("LIKE", like);
		model.addAttribute("replyCount", count);
		model.addAttribute("replyVO", list);
		model.addAttribute("blogVO", blogVO);

		return "blog/detail";
		}
	}

	@RequestMapping(value = "replyWrite", method = RequestMethod.POST)
	public String replyWrite(@RequestParam("b_num") int b_num, @RequestParam("pageNum") int pageNum,
			@ModelAttribute ReplyVO replyVO, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");

		blogService.updateReply(b_num, id, replyVO);

		return "redirect:/blog/detail?b_num=" + b_num + "&pageNum=" + pageNum;

	}

	@RequestMapping(value = "likeBtn", method = RequestMethod.POST)
	public @ResponseBody int likeMethod(@RequestParam("b_num") int b_num, 
			HttpSession session) {

//		System.out.println("model :" + b_model);
		String id = (String) session.getAttribute("id");
		System.out.println("b num : " + b_num + " id : " + id);

		int select = blogDao.detailLikeMember(b_num, id);
		System.out.println("select : " + select);

		int btnUpdate = blogDao.btnLikeMember(b_num, id, select);
		System.out.println("btnUpdate : " + btnUpdate);
		
		
		return btnUpdate;
	}

	@RequestMapping("deleteBoard")
	public String deleteBoard(@RequestParam("b_num") int b_num, HttpSession session, HttpServletResponse response)
			throws Exception {

		response.setContentType("text/html; charset=UTF-8");

		try {

			blogDao.deleteBoard(b_num);
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('해당 게시 글이 삭제되었습니다.');");
			out.println("location.href='/blog/main';");
			out.println("</script>");

			out.close();

			return null;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}

	}

	@RequestMapping("deleteReply")
	public void deleteReply(@RequestParam("r_num") int r_num, @RequestParam("pageNum") int pageNum,
			HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset=UTF-8");

		try {
			int num = replyDao.selectBlogNum(r_num);
			replyDao.deleteReply(r_num);
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('댓글이 삭제되었습니다.');");
			out.println("location.href='/blog/detail?b_num=" + num + "&pageNum=" + pageNum + "';");
			out.println("</script>");

			out.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@RequestMapping("updateBoard")
	public String updateBoard(@ModelAttribute BlogVO blogVO, HttpServletRequest request, HttpSession session,
			@RequestParam("b_img") MultipartFile multi, HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("/img");
		String fileName = multi.getOriginalFilename();
		String id = (String) session.getAttribute("id");

		if (fileName.length() == 0) {

			try {
				blogVO.setB_reg_date(new Timestamp(System.currentTimeMillis()).toString());
				blogService.updateBlogNonImg(blogVO);
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('수정 완료');");
				out.print("location.href='main';");
				out.print("</script>");
				out.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			}

		} else {

			try {
				String directory = id;
				File dic = new File(realPath + "/" + directory);

				if (!dic.exists()) {
					dic.mkdirs();
				}

				File file = new File(realPath + "/" + directory + "/" + fileName);
				IOUtils.copy(multi.getInputStream(), new FileOutputStream(file));

				blogVO.setB_image(fileName);
				System.out.println("blogvo에는뭐가담겼나? " + blogVO.toString());
				blogVO.setB_reg_date(new Timestamp(System.currentTimeMillis()).toString());
				blogService.updateBlogImg(blogVO);

				PrintWriter out = response.getWriter();

				out.print("<script>");
				out.print("alert('수정 완료!');");
				out.print("location.href='main';");
				out.println("</script>");
				out.close();
				return null;

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			}
		}
		return null;

	}
	


}
