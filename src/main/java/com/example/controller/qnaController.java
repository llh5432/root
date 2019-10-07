package com.example.controller;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.example.service.QnaService;
import com.example.vo.QnaVO;

@Controller
@RequestMapping("qna")
public class qnaController {

	@Autowired
	private QnaService qnaService;

	@RequestMapping("main")
	public String qna() {

		return "qna/qnaForm";
	}

	@RequestMapping(value = "qadd", method = RequestMethod.POST)
	public String board(HttpSession session, HttpServletResponse response, @ModelAttribute QnaVO qnaVO)
			throws Exception {

		String id = (String) session.getAttribute("id");

		response.setContentType("text/html; charset=UTF-8");

		if (id == null) {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('로그인이 필요한 기능입니다.');");
				out.print("location.href='login'");
				out.print("</script>"); 
				out.close();
				return null;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			}
		}

		qnaVO.setQ_id(id);
		qnaVO.setReply("F");
		qnaVO.setReg_date(new Timestamp(System.currentTimeMillis()).toString());
		qnaService.add(qnaVO);

		try {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('답변은 MyPage의 문의내역에서 확인할 수 있습니다.');");
			out.print("location.href='/qna/main'");
			out.print("</script>");
			out.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

}
