package com.example.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.example.dao.BlogDao;
import com.example.dao.BookDao;
import com.example.dao.MemberDao;
import com.example.dao.OppaDao;
import com.example.dao.QnaDAO;
import com.example.dao.VisitorDao;
import com.example.service.MemberService;
import com.example.vo.BlogVO;
import com.example.vo.BookVO;
import com.example.vo.MemberVO;
import com.example.vo.QnaVO;

@Controller
@RequestMapping("member")
public class memberContoller {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private MemberService memberService;

	@Autowired
	private QnaDAO qnaDao;

	@Autowired
	private BookDao bookDao;

	@Autowired
	private OppaDao oppaDao;

	@Autowired
	private BlogDao blogDao;

	@Autowired
	private VisitorDao visitorDao;

	@RequestMapping("main")
	public String main() {

		return "index";
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String Join() {

		return "member/joinForm";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@ModelAttribute MemberVO memberVO) { // 어노테이션 사용해서 bean 객체에 데이터를 담음

		memberVO.setJoin_date(new Timestamp(System.currentTimeMillis()).toString()); // 회원가입날짜를 여기서 SET
		memberService.add(memberVO);

		return "redirect:/main";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {

		return "member/loginForm";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(MemberVO memberVO, Model model, HttpServletResponse response, HttpSession session)
			throws Exception {
		// HttpServletResponse 클라이언트에 데이터전송을 하기위해 사용
		// 이를 위하여 Response객체의 setContentType() 과 getWriter()메소드를 이용

		int check = memberService.userCheck(memberVO.getId(), memberVO.getPasswd());
		System.out.println(check);

		if (check != MemberService.ID_AND_PASSWD_OK) { // 체크값이 1이아니면, 아이디가 틀렸을경우에
			System.out.println("if문");
			String message = "";

			switch (check) {
			case MemberService.ONLY_PASSWD_FAIL:
				message = "패스워드 틀림";
				break;
			case MemberService.ID_AND_PASSWD_FAIL:
				message = "아이디 없음";
				break;
			}

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.print("alert('" + message + "');");
			out.print("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}

		MemberVO memberVO1 = memberDao.get(memberVO.getId()); // model 정보를 가져오기위한 변수

		session.setAttribute("id", memberVO1.getId());
		session.setAttribute("model", memberVO1.getModel());

		String time = new Timestamp(System.currentTimeMillis()).toString().substring(0, 10);
		int select = visitorDao.select(time);
		if (select == 1) {
			int sum = visitorDao.sum() + 1;
			visitorDao.add(time, sum);
		} else {
			System.out.println("else 부분");
			int sum = visitorDao.sum() + 1;
			visitorDao.delete();
			System.out.println("delete 통과");

			visitorDao.add(time, sum);
			System.out.println("else 끝");
		}
		return "redirect:/main";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session, HttpServletResponse response) {
		
		String id = (String)session.getAttribute("id");
		if(!id.equals(null)) {
			int select = bookDao.selectNull(id);
			if(select > 0) {
				bookDao.delete(id);
			}
		}
		session.invalidate(); // session을 끝냄

		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("alert('로그아웃하였습니다.')");
			out.println("location.href='/main'");
			out.println("</script>");
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return null;
	}

	@RequestMapping("myPage")
	public String myPage(HttpSession session, Model model, HttpServletResponse response) {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");
		MemberVO memberVO = memberService.get(id);

		if (id == null) {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('로그인이 필요한 기능입니다.');");
				out.print("location.href='login'");
				out.print("</script>");
				out.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return null;
		} else if (memberVO.getModel() != null) {

			int total = oppaDao.oppaTotal(id);
			int like = oppaDao.oppaLike(id);
			model.addAttribute("like", like);
			model.addAttribute("total", total);

			List<QnaVO> myQboard = qnaDao.getQboard(id);
			List<BookVO> myBook = bookDao.getBookList(id);
			List<BlogVO> myPboard = blogDao.profileBoard(memberVO.getName());
			System.out.println(myPboard);

			model.addAttribute("myPboard", myPboard);
			model.addAttribute("myBook", myBook);
			model.addAttribute("memberVO", memberVO); // member 담고있는 model
			model.addAttribute("myQboard", myQboard); // ask 담고있는 model

			return "member/myPage";

		} else {

			List<QnaVO> myQboard = qnaDao.getQboard(id);
			List<BookVO> myBook = bookDao.getBookList(id);

			model.addAttribute("myBook", myBook);
			model.addAttribute("memberVO", memberVO); // member 담고있는 model
			model.addAttribute("myQboard", myQboard); // ask 담고있는 model

			return "member/myPage";
		}
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(HttpSession session, @ModelAttribute MemberVO memberVO, HttpServletResponse response)
			throws Exception {

		String id = (String) session.getAttribute("id");
		System.out.println("update메소드 id값 : " + id);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (id == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요한 기능입니다.');");
			out.println("location.href='login'");
			out.println("</script>");
			out.close();
			return "redirect:/main";
		} else {
			memberVO.setId(id);

			System.out.println("update메소드 : " + memberVO.toString());
			memberService.update(memberVO);
			out.print("<script>");
			out.print("alert('프로필이 업데이트되었습니다.');");
			out.print("location.href='/member/myPage';");
			out.print("</script>");
			out.close();
			return null;
		}

	}

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String delete(HttpSession session, @RequestParam String passwd, HttpServletResponse response)
			throws Exception {
		String id = (String) session.getAttribute("id");

		if (id == null) {
			return "redirect:/member/login";
		}

		int check = memberService.userCheck(id, passwd);

		if (check == memberService.ONLY_PASSWD_FAIL) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('패스워드가 틀렸습니다.');");
			out.print("location.href=history.back();");
			out.print("</script>");
			out.close();
			return null;
		}

		memberService.delete(id);
		session.invalidate(); // 세션 초기화(전체삭제)

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('지금까지 이용해주셔서 감사합니다!');");
		out.println("location.href='/main';");
		out.println("</script>");
		out.close();
		return null;
	}

	@RequestMapping(value = "qDelete", method = RequestMethod.POST)
	public String qDelete(@RequestParam(value = "q_check", required = false) int q_num[], HttpServletResponse response)
			throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println("delete메소드");

		if (q_num == null) {
			out.print("<script>");
			out.print("alert('삭제할 글이 선택되지 않았습니다.');");
			out.print("location.href=history.back();");
			out.print("</script>");
			out.close();

		} else {
			for (int i = 0; i < q_num.length; i++) {
				qnaDao.deleteQb(q_num[i]);
			}
			out.print("<script>");
			out.print("alert('선택 된 문의글이 삭제되었습니다.');");
			out.print("location.href='/member/myPage';");
			out.print("</script>");
			out.close();
		}
		return null;
	}

	@RequestMapping(value = "bDelete", method = RequestMethod.POST)
	public String bDelete(@RequestParam(value = "b_check", required = false) int b_num[], HttpServletResponse response)
			throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println("delete메소드");

		if (b_num == null) {
			out.print("<script>");
			out.print("alert('삭제할 예약내역이 선택되지 않았습니다.');");
			out.print("location.href='/member/myPage';");
			out.print("</script>");
			out.close();

		} else {
			for (int j = 0; j < b_num.length; j++) {
				bookDao.bookDelete(b_num[j]);
			}
			out.print("<script>");
			out.print("alert('선택 된 예약내역이 삭제되었습니다.');");
			out.print("location.href='/member/myPage';");
			out.print("</script>");
			out.close();
		}
		return null;
	}

	@RequestMapping(value = "oppaUpdate", method = RequestMethod.POST)
	public String oppaProfileUpdate(@RequestParam("profileImage") MultipartFile multi, HttpSession session,
			@ModelAttribute MemberVO memberVO, HttpServletResponse response, HttpServletRequest request)
			throws Exception {

		String id = (String) session.getAttribute("id");
		response.setContentType("text/html; charset=UTF-8");

		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("/img"); // 파일업로드할 리얼패스 String 설정
		String filename = multi.getOriginalFilename(); // 업로드할 파일네임 설정
		System.out.println("filename 첫 생성자 : " + filename);

		if (id == null) {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('로그인이 필요한 기능입니다.');");
				out.print("location.href='login'");
				out.print("</script>");
				out.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return null;
		} else {

			try {
				System.out.println("filename은 널일까? : " + filename);
				if (filename.length() == 0) { // filename 에 든 데이터값의 랭스가 0 이면 intro 만 업데이트
					memberVO.setId(id);
					PrintWriter out = response.getWriter();
					System.out.println("이미지없는경우 : " + memberVO.toString());
					memberService.updateNonImage(memberVO);
					out.print("<script>");
					out.print("alert('프로필이 저장되었습니다.');");
					out.print("location.href='/member/myPage';");
					out.print("</script>");
					out.close();
					return null;

				} else { // filename 에 이미지파일이 들어있다면 intro, image 둘다 업데이트

					String directory = id; // realPath 폴더안에 폴더이름 설정
					File dic = new File(realPath + "/" + directory); // 파일 생성자호출 (경로)
					if (!dic.exists()) { // 파일이 없으면
						dic.mkdirs(); // 만들기
					}

					File file = new File(realPath + "/" + directory + "/" + filename); // 경로에 파일만들기
					IOUtils.copy(multi.getInputStream(), new FileOutputStream(file));
					memberVO.setImage(filename);

					memberVO.setId(id);
					System.out.println("사진있을경우 : " + memberVO.toString());
					PrintWriter out = response.getWriter();
					memberService.update(memberVO);
					out.print("<script>");
					out.print("alert('프로필이 저장되었습니다.');");
					out.print("location.href='/member/myPage';");
					out.print("</script>");
					out.close();
					return null;

				}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

			}

		}
		return null;
	}
}
