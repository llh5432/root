package com.example.controller;

import java.io.PrintWriter;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dao.AdminDao;
import com.example.dao.BlogDao;
import com.example.dao.BookDao;
import com.example.dao.MemberDao;
import com.example.dao.OppaDao;
import com.example.dao.QnaDAO;
import com.example.dao.ReplyDao;
import com.example.dao.SubmitDao;
import com.example.dao.VisitorDao;
import com.example.vo.BlogVO;
import com.example.vo.BookVO;
import com.example.vo.MemberVO;
import com.example.vo.OppaListVO;
import com.example.vo.PageVO;
import com.example.vo.SubmitVO;
import com.example.vo.QnaVO;

@Controller
@RequestMapping("admin") // 정리끝
public class adminController {

	@Autowired
	private AdminDao adminDao;

	@Autowired
	private QnaDAO qnaDao;

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private SubmitDao submitDao;

	@Autowired
	private BlogDao blogDao;

	@Autowired
	private ReplyDao replyDao;

	@Autowired
	private BookDao bookDao;

	@Autowired
	private OppaDao oppaDao;

	@Autowired
	private VisitorDao visitorDao;

	@RequestMapping("dashBoard")
	public String Dashboard(Model model, HttpSession session, HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {

			int countMember = adminDao.getCountMember();
			int sumVisitor = visitorDao.sum();
			int countVisitor = visitorDao.count();
			int countPlayer = adminDao.getOppaCount();
			int countQna = adminDao.getCountQna();
			int countTotal = adminDao.allTotal();
			int countBlog = adminDao.getCountBlog();
			String maxLikeModel = adminDao.maxLikeModel();
			String maxLikeBlog = adminDao.maxLikeBlog();
			int countBook = adminDao.countBook();
			int countMaxModelLike = adminDao.countMaxLikeModel();
			int countMaxBlogLike = adminDao.countMaxLikeBlog();
			int countSumTodayTotal = adminDao.countNowSumTotal();

			model.addAttribute("countMember", countMember);
			model.addAttribute("sumVisitor", sumVisitor);
			model.addAttribute("countVisitor", countVisitor);
			model.addAttribute("countPlayer", countPlayer);
			model.addAttribute("countQna", countQna);
			model.addAttribute("countTotal", countTotal);
			model.addAttribute("countBlog", countBlog);
			model.addAttribute("maxLikeModel", maxLikeModel);
			model.addAttribute("maxLikeBlog", maxLikeBlog);
			model.addAttribute("countBook", countBook);
			model.addAttribute("countMaxModelLike", countMaxModelLike);
			model.addAttribute("countMaxBlogLike", countMaxBlogLike);
			model.addAttribute("countSumTodayTotal", countSumTodayTotal);

			return "admin/dashBoard";
		} else if (id != null && !id.equals("admin")) {
			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;
		} else {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('다시 로그인해주세요'); " + "location.href='/member/login';</script>");
			out.close();
			return null;

		}
	}

	@RequestMapping("customers") // 관리자페이지 전체회원 뿌려주기
	public String Customers(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
			Model model, HttpSession session, HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");
		// 전체 총 글갯수 메서드를 호출해서 인트값에 넣음
		if (id != null && id.equals("admin")) {
			int count = adminDao.getCountMember();

			// 보여줄 글 갯수
			int pageSize = 15;

			// 보여줄 페이지 첫 번째 글번호
			int startRow = (pageNum - 1) * pageSize + 1;

			// 제네릭 보드bean 객체타입에 담을 DAO의 getMember 메서드호출
			List<MemberVO> list = adminDao.getAllMembers(startRow, pageSize);

			// 밑에 나오는 페이지 블록수 정하기 연산 총 글갯수 나누기 한 페이지에 보여줄 글 갯수
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

			model.addAttribute("list", list); // 객체만 들어감
			model.addAttribute("pageVO", pageVO);
			model.addAttribute("count", count);
			return "admin/customers";

		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;
		} else {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('다시 로그인해주세요'); " + "location.href='/member/login';</script>");
			out.close();
			return null;

		}
	}

	@RequestMapping(value = "memberUpgrade", method = RequestMethod.POST)
	public String MemberUpgrade(@RequestParam(value = "id", required = false) String m_id[],
			@RequestParam(value = "check", required = false) int num[], HttpSession session,
			HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
//		System.out.println("왜? " + num);
//		System.out.println("아이디 :" + m_id.toString());
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {

			if (num == null) {

				PrintWriter out = response.getWriter();
				out.println("<script>alert('등업시킬 회원을 선택하지 않았습니다.'); " + "location.href=history.back();</script>");
				out.close();
				return null;
			} else {
				for (int i = 0; i < num.length; i++) {
					adminDao.upgradeMember(m_id[i], num[i]);
					oppaDao.add(m_id[i], num[i]);
				}
				PrintWriter out = response.getWriter();
				out.println("<script>alert('해당회원을 등업시켰습니다.'); " + "location.href='customers';</script>");
				out.close();
				return null;
			}
		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;
		} else {

			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 로그인해주세요.');");
			out.print("location.href='/member/login'");
			out.print("</script>");
			out.close();
			return null;
		}
	}

	@RequestMapping(value = "memberDelete", method = { RequestMethod.POST, RequestMethod.GET })
	public String MemberDelete(@RequestParam(value = "check", required = false) int num[], HttpSession session,
			HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
//		System.out.println("왜? " +id);
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {

			if (num == null) {

				PrintWriter out = response.getWriter();
				out.println("<script>alert('삭제할 회원이 선택되지 않았습니다.'); " + "location.href=history.back();</script>");
				out.close();
				return null;
			} else {
				for (int i = 0; i < num.length; i++) {
					adminDao.deleteMember(num[i]);
				}
				PrintWriter out = response.getWriter();
				out.println("<script>alert('해당회원이 삭제되었습니다.'); " + "location.href='customers';</script>");
				out.close();
				return null;
			}

		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;
		} else {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 로그인해주세요.');");
			out.print("location.href='/member/login'");
			out.print("</script>");
			out.close();
			return null;
		}
	}

	@RequestMapping("qna")
	public String Qna(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum, Model model,
			HttpSession session, HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {
			int count = qnaDao.getQnaCount();

			int pageSize = 15;

			int startRow = (pageNum - 1) * pageSize + 1;

			List<QnaVO> list = qnaDao.getAllQna(startRow, pageSize);

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
			int countQna = adminDao.getCountQna();

			model.addAttribute("count", countQna);
			model.addAttribute("pageVO", pageVO);
			model.addAttribute("list", list);

			return "admin/qnaList";

		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;
		} else {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 로그인해주세요.');");
			out.print("location.href='/member/login'");
			out.print("</script>");
			out.close();
			return null;
		}
	}

	// 문의글 삭제 메소드
	@RequestMapping(value = "qnaDelete")
	public String QnaDelete(@RequestParam(value = "check", required = false) int num[], HttpSession session,
			HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {

			if (num == null) {
				System.out.println("num 값 : " + num);
				PrintWriter out = response.getWriter();
				out.println("<script>alert('삭제할 문의글이 선택되지 않았습니다.'); " + "location.href=history.back();</script>");
				out.close();
				return null;
			} else {
				for (int i = 0; i < num.length; i++) {
					qnaDao.deleteQb(num[i]);
				}
				PrintWriter out = response.getWriter();
				out.println("<script>alert('해당 문의글이 삭제되었습니다.'); " + "location.href='qna';</script>");
				out.close();
				return null;
			}

		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;
		} else {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 로그인해주세요.');");
			out.print("location.href='/member/login'");
			out.print("</script>");
			out.close();
			return null;
		}

	}

	@RequestMapping("qnaDetail")
	public String QnaDetail(@RequestParam int num, Model model, HttpSession session, HttpServletResponse response)
			throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {
			QnaVO qboardVO = qnaDao.getQnaDetail(num);

			model.addAttribute("qnaVO", qboardVO);

			return "admin/qnaDetail";

		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;
		} else {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 로그인해주세요.');");
			out.print("location.href='/member/login'");
			out.print("</script>");
			out.close();
			return null;
		}
	}

	@RequestMapping("reply")
	public String Reply(@RequestParam int num, @RequestParam String re_content, HttpSession session,
			HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {
			qnaDao.updateReply(num, re_content);

			return "redirect:/admin/qna";
		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;
		} else {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 로그인해주세요.');");
			out.print("location.href='/member/login'");
			out.print("</script>");
			out.close();
			return null;
		}
	}

	@RequestMapping(value = "submitListUpgrade", method = RequestMethod.POST)
	public String SubmitListUpgrade(@RequestParam(value = "s_id", required = false) String s_id[],
			@RequestParam(value = "check", required = false) int num[], HttpSession session,
			HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
//		System.out.println("왜? " + num);
//		System.out.println("아이디 :" + s_id.toString());
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {

			if (num == null) {

				PrintWriter out = response.getWriter();
				out.println("<script>alert('등업시킬 회원을 선택하지 않았습니다.'); " + "location.href=history.back();</script>");
				out.close();
				return null;
			} else {
				for (int i = 0; i < num.length; i++) {
					System.out.println("s_id:" + s_id[i]+","+"num:"+num[i]);
					adminDao.upgradeMember(s_id[i], num[i]);
					oppaDao.add(s_id[i], num[i]);
				}
				PrintWriter out = response.getWriter();
				out.println("<script>alert('해당회원을 등업시켰습니다.'); " + "location.href='submit';</script>");
				out.close();
				return null;
			}
		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;
		} else {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 로그인해주세요.');");
			out.print("location.href='/member/login'");
			out.print("</script>");
			out.close();
			return null;
		}
	}

	@RequestMapping("oppaList")
	public String OppaList(Model model, HttpSession session, HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {
			int count = adminDao.getOppaCount();

			List<OppaListVO> list = adminDao.oppaList();

			model.addAttribute("count", count);
			model.addAttribute("list", list);

			return "/admin/oppaList";

		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;
		} else {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 로그인 해주세요.');");
			out.print("location.href='/member/login'");
			out.print("</script>");
			out.close();
			return null;
		}

	}

	@RequestMapping(value = "oppaDelete")
	public String OppaDelete(@RequestParam(value = "check", required = false) int num[],
			@RequestParam(value = "check2", required = false) int num2[], HttpSession session,
			HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");
//		System.out.println("num1 :" + num + "," + "num2 : " + num2);
		if (id != null && id.equals("admin")) {

			if (num == null) {
				System.out.println("num 값 : " + num);
				PrintWriter out = response.getWriter();
				out.println("<script>alert('삭제할 모델이 선택되지 않았습니다.'); " + "location.href=history.back();</script>");
				out.close();
				return null;
			} else {
				for (int i = 0; i < num.length; i++) {
					adminDao.deleteOppa(num[i], num2[i]);
				}
				PrintWriter out = response.getWriter();
				out.println("<script>alert('해당 모델이 삭제되었습니다.'); " + "location.href='oppaList';</script>");
				out.close();
				return null;
			}
		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;
		} else {

			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 로그인 해주세요.');");
			out.print("location.href='/member/login'");
			out.print("</script>");
			out.close();
			return null;
		}
	}

	@RequestMapping(value = "oppaNumUp", method = RequestMethod.POST)
	public String OppaNumUp(@RequestParam(value = "number1", required = false) int num1[],
			@RequestParam(value = "number2", required = false) int num2[], HttpSession session,
			HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {

			if (num2 == null) {
				System.out.println("num 값 : " + num2);

				PrintWriter out = response.getWriter();
				out.println("<script>alert('번호를 선택해주세요'); " + "location.href=history.back();</script>");
				out.close();
				return null;
			} else {
				for (int i = 0; i < num1.length; i++) {
					adminDao.numUp(num2[i], num1[i]);
				}
				PrintWriter out = response.getWriter();
				out.println("<script>alert('오빠번호가 지정되었습니다'); " + "location.href='oppaList';</script>");
				out.close();
				return null;
			}
		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;

		} else {

			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 로그인 해주세요.');");
			out.print("location.href='/member/login'");
			out.print("</script>");
			out.close();
			return null;
		}
	}

	@RequestMapping("submit")
	public String Submit(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
			Model model, HttpSession session, HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
		System.out.println("id : " + id);
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {

			// 전체 총 글갯수 메서드를 호출해서 인트값에 넣음
			int count = submitDao.getSubmitCount();

			// 보여줄 글 갯수
			int pageSize = 15;

			// 보여줄 페이지 첫 번째 글번호
			int startRow = (pageNum - 1) * pageSize + 1;

			// 제네릭 보드bean 객체타입에 담을 DAO의 getMember 메서드호출
			List<SubmitVO> sList = submitDao.submitList(startRow, pageSize);

			// 밑에 나오는 페이지 블록수 정하기 연산 총 글갯수 나누기 한 페이지에 보여줄 글 갯수
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

			model.addAttribute("pageVO", pageVO);
			model.addAttribute("count", count);
			model.addAttribute("sList", sList);

			return "admin/submitList";

		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;

		} else {
			System.out.println("else 쪽");

			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 로그인해주세요.');");
			out.print("location.href='/member/login'");
			out.print("</script>");
			out.close();
			return null;
		}
	}

	@RequestMapping("submitDetail")
	public String submitDetail(@RequestParam int num, Model model, HttpSession session, HttpServletResponse response)
			throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {
			SubmitVO submitVO = submitDao.get(num);
			MemberVO memberVO = memberDao.get(submitVO.getS_id());
			System.out.println("submit : " + submitVO.toString());
			System.out.println("member : " + memberVO.toString());

			model.addAttribute("submitVO", submitVO);
			model.addAttribute("memberVO", memberVO);

			return "admin/submitDetail";
		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;

		} else {

			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 로그인해주세요.');");
			out.print("location.href='/member/login'");
			out.print("</script>");
			out.close();
			return null;
		}

	}

	@RequestMapping("submitListDelete")
	public String SubmitListDelete(@RequestParam(value = "check", required = false) int num[], HttpSession session,
			HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {

			if (num == null) {
				System.out.println("num 값 : " + num);
				PrintWriter out = response.getWriter();
				out.println("<script>alert('삭제 할 글이 선택되지 않았습니다.'); " + "location.href=history.back();</script>");
				out.close();
				return null;
			} else {
				for (int i = 0; i < num.length; i++) {
					submitDao.deleteSubmit(num[i]);
				}
				PrintWriter out = response.getWriter();
				out.println("<script>alert('해당 글이 삭제되었습니다.'); " + "location.href='submit';</script>");
				out.close();
				return null;
			}

		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;
		} else {

			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 로그인해주세요.');");
			out.print("location.href='/member/login'");
			out.print("</script>");
			out.close();

			return null;
		}
	}

	@RequestMapping("submitDetailUpgrade")
	public String SubmitDetailUpgrade(@RequestParam(value = "num", required = false) int num,
			@RequestParam(value = "id", required = false) String s_id,
			@RequestParam(value = "name", required = false) String name, HttpSession session,
			HttpServletResponse response) throws Exception {
			
		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {
			System.out.println("id:"+s_id+","+"name:"+name+","+"num:"+num);
			submitDao.upgradeSubmit(s_id, name, num);
			oppaDao.add(s_id, num);
			PrintWriter out = response.getWriter();
			out.println("<script>alert('등업되었습니다.'); " + "location.href='submit';</script>");
			out.close();
			return null;

		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;
		} else {

			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 로그인해주세요.');");
			out.print("location.href='/member/login'");
			out.print("</script>");
			out.close();

			return null;

		}
	}

	@RequestMapping("submitDetailDelete")
	public String SubmitDetailDelete(@RequestParam(value = "num", required = false) int num, HttpSession session,
			HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {

			submitDao.deleteSubmit(num);

			PrintWriter out = response.getWriter();
			out.println("<script>alert('해당 글이 삭제되었습니다.'); " + "location.href='submit';</script>");
			out.close();
			return null;

		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;
		} else {

			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 로그인 해주세요.');");
			out.print("location.href='/member/login'");
			out.print("</script>");
			out.close();
			return null;

		}
	}

	@RequestMapping("blog")
	public String Blog(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum, Model model,
			HttpSession session, HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {

			// 전체 총 글갯수 메서드를 호출해서 인트값에 넣음
			int count = blogDao.getBoardCount();

			// 보여줄 글 갯수
			int pageSize = 15;

			// 보여줄 페이지 첫 번째 글번호
			int startRow = (pageNum - 1) * pageSize + 1;

			// 제네릭 보드bean 객체타입에 담을 DAO의 getMember 메서드호출
			List<BlogVO> bList = blogDao.adminBlogList(startRow, pageSize);

			// 밑에 나오는 페이지 블록수 정하기 연산 총 글갯수 나누기 한 페이지에 보여줄 글 갯수
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

			model.addAttribute("pageVO", pageVO);
			model.addAttribute("count", count);
			model.addAttribute("bList", bList);

			return "admin/blogList";

		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;
		} else {

			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 로그인해주세요.');");
			out.print("location.href='/member/login'");
			out.print("</script>");
			out.close();
			return null;
		}
	}

	@RequestMapping("boardDetail")
	public String BlogDetail(@RequestParam int num, Model model, HttpSession session, HttpServletResponse response)
			throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");
		if (id != null && id.equals("admin")) {
			BlogVO blogVO = blogDao.getBlog(num);
			int count = replyDao.replyCount(num);

			model.addAttribute("blogVO", blogVO);
			model.addAttribute("replyCount", count);

			return "admin/blogDetail";
		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;
		} else {

			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 로그인해주세요.');");
			out.print("location.href='/member/login'");
			out.print("</script>");
			out.close();
			return null;
		}
	}

	@RequestMapping(value = "boardDelete")
	public String BoardDelete(@RequestParam(value = "check", required = false) int num[], HttpSession session,
			HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {

			if (num == null) {
				System.out.println("num 값 : " + num);
				PrintWriter out = response.getWriter();
				out.println("<script>alert('삭제 할 글이 선택되지 않았습니다.'); " + "location.href=history.back();</script>");
				out.close();
				return null;
			} else {

				for (int i = 0; i < num.length; i++) {
					blogDao.deleteBoard(num[i]);
				}
				PrintWriter out = response.getWriter();
				out.println("<script>alert('해당 글이 삭제되었습니다.'); " + "location.href='blog';</script>");
				out.close();
				return null;

			}
		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;
		} else {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 로그인 해주세요.');");
			out.print("location.href='/member/login'");
			out.print("</script>");
			out.close();

			return null;
		}
	}

	@RequestMapping("blogDetailDelete")
	public String BlogDetailDelete(@RequestParam(value = "num", required = false) int num, HttpSession session,
			HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {

			blogDao.deleteBoard(num);
			PrintWriter out = response.getWriter();
			out.println("<script>alert('삭제되었습니다.'); " + "location.href='blog';</script>");
			out.close();
			return null;

		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;
		} else {

			try {
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('다시 로그인해주세요.');");
				out.print("location.href='/member/login'");
				out.print("</script>");
				out.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return null;
		}

	}

	@RequestMapping("bookList")
	public String BookList(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
			Model model, HttpSession session, HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {

			// 전체 총 글갯수 메서드를 호출해서 인트값에 넣음
			int count = bookDao.getBookCount();

			// 보여줄 글 갯수
			int pageSize = 15;

			// 보여줄 페이지 첫 번째 글번호
			int startRow = (pageNum - 1) * pageSize + 1;

			// 제네릭 보드bean 객체타입에 담을 DAO의 getMember 메서드호출
			List<BookVO> list = bookDao.getAdminBookList(startRow, pageSize);

			// 밑에 나오는 페이지 블록수 정하기 연산 총 글갯수 나누기 한 페이지에 보여줄 글 갯수
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

			model.addAttribute("pageVO", pageVO);
			model.addAttribute("count", count);
			model.addAttribute("list", list);

			return "admin/bookList";

		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;

		} else {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 로그인 해주세요.');");
			out.print("location.href='/member/login'");
			out.print("</script>");
			out.close();
			return null;
		}
	}

	@RequestMapping("bookDetail")
	public String BookDetail(@RequestParam int num, Model model, HttpSession session, HttpServletResponse response)
			throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {
			BookVO bookVO = bookDao.getBlog(num);

			model.addAttribute("bookVO", bookVO);

			return "admin/bookDetail";
		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;

		} else {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 로그인 해주세요.');");
			out.print("location.href='/member/login'");
			out.print("</script>");
			out.close();
			return null;
		}
	}
	
	// 진행상황을 알려주는 메소드 진행중/진행완료
	@RequestMapping(value = "bookMeetCheck")
	public String bookMeetCheck(@RequestParam(value = "check", required = false) int num[], HttpSession session,
			HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {

			if (num == null) {
				System.out.println("num 값 : " + num);
				PrintWriter out = response.getWriter();
				out.println("<script>alert('체크박스를 확인해주세요.'); " + "location.href=history.back();</script>");
				out.close();
				return null;
			} else {
				for (int i = 0; i < num.length; i++) {
					bookDao.bookMeetCheck(num[i]);
				}
				PrintWriter out = response.getWriter();
				out.println("<script>alert('해당 예약의 진행을 완료했습니다.'); " + "location.href='bookList';</script>");
				out.close();
				return null;
			}
		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;

		} else {

			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 로그인해주세요.');");
			out.print("location.href='/member/login'");
			out.print("</script>");
			out.close();

			return null;
		}
	}

	@RequestMapping(value = "bookListDelete")
	public String BookListDelete(@RequestParam(value = "check", required = false) int num[], HttpSession session,
			HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {

			if (num == null) {
				System.out.println("num 값 : " + num);
				PrintWriter out = response.getWriter();
				out.println("<script>alert('체크박스를 확인해주세요.'); " + "location.href=history.back();</script>");
				out.close();
				return null;
			} else {
				for (int i = 0; i < num.length; i++) {
					bookDao.bookDelete(num[i]);
				}
				PrintWriter out = response.getWriter();
				out.println("<script>alert('해당 예약이 삭제되었습니다.'); " + "location.href='bookList';</script>");
				out.close();
				return null;
			}

		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;

		} else {

			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('다시 로그인 해주세요.');");
			out.print("location.href='/member/login'");
			out.print("</script>");
			out.close();
			return null;
		}

	}

	@RequestMapping("bookDetailMeetCheck")
	public String bookDetailMeetCheck(@RequestParam(value = "num", required = false) int num, HttpSession session,
			HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {

			bookDao.bookMeetCheck(num);

			PrintWriter out = response.getWriter();
			out.println("<script>alert('해당 예약을 진행완료했습니다.'); " + "location.href='bookList';</script>");
			out.close();
			return null;

		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;

		} else {

			try {
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('다시 로그인해주세요.');");
				out.print("location.href='/member/login'");
				out.print("</script>");
				out.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return null;
		}
	}

	@RequestMapping("bookDetailDelete")
	public String BookDetailDelete(@RequestParam(value = "num", required = false) int num, HttpSession session,
			HttpServletResponse response) throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");

		if (id != null && id.equals("admin")) {

			bookDao.bookDelete(num);

			PrintWriter out = response.getWriter();
			out.println("<script>alert('해당 예약이 삭제되었습니다.'); " + "location.href='bookList';</script>");
			out.close();
			return null;

		} else if (id != null && !id.equals("admin")) {

			PrintWriter out = response.getWriter();

			out.println("<script>alert('관리자계정이 아닙니다.'); " + "location.href='/member/main';</script>");
			out.close();
			return null;

		} else {

			try {
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('다시 로그인 해주세요.');");
				out.print("location.href='/member/login'");
				out.print("</script>");
				out.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return null;
		}
	}
}