package com.example.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dao.BlogDao;
import com.example.dao.MemberDao;
import com.example.service.MemberService;
import com.example.vo.BlogVO;
import com.example.vo.MemberVO;

@Controller
@RequestMapping("/")
public class mainController {

	@Autowired
	private BlogDao blogDao;

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private MemberService memberService;

	@RequestMapping("main")
	public String main(Model model) {

		BlogVO blogVO = blogDao.selectLikeBoard();
		MemberVO memberVO = memberDao.selectLikeMember();
		
		model.addAttribute("blogVO", blogVO);
		model.addAttribute("memberVO", memberVO);
		return "index";
	}

	@RequestMapping("searchIdPwd")
	public String searchIdPwd() {

		return "member/searchIdPasswdForm";
	}

	@RequestMapping(value = "emailChk", method = RequestMethod.POST)
	public String emailChk(@ModelAttribute MemberVO memberVO, HttpServletResponse response) // Model 메서드를써야 el식 쓸수있음 폼에서
			throws Exception {

		String id = memberService.emailCheck(memberVO.getEmail());

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('회원님의 아이디는 " + id + "입니다.');");
		out.println("location.href='/main'");
		out.println("</script>");
		out.close();
		return null;

	}

	@RequestMapping("model&book")
	public String model(HttpSession session, HttpServletResponse response) throws Exception {
		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");
		if (id == null) {
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='/member/login'");
			out.println("</script>");

			return null;
		} else {
			return "redirect:/model/main";

		}
	}

}
