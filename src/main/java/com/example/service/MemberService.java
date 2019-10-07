package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.MemberDao;
import com.example.dao.SubmitDao;
import com.example.vo.MemberVO;

@Service
@Transactional
public class MemberService {

	public static final int ID_AND_PASSWD_OK = 1;
	public static final int ONLY_PASSWD_FAIL = 0;
	public static final int ID_AND_PASSWD_FAIL = -1;

	// @Autowired : 타입 정보를 기준으로 의존관계를 주입

	@Autowired
	private MemberDao memberDao;

	public void add(MemberVO memberVO) {
		memberDao.add(memberVO);
	}

	public int userCheck(String id, String passwd) { // 로그인에서 입력한 id,passwd가 VO객체에 저장된걸 매개변수로 씀

		MemberVO memberVO = memberDao.get(id);
		System.out.println("서비스쪽membervo : " + memberVO);
		if (memberVO != null) { // id 값 일치할경우
			if (memberVO.getPasswd().equals(passwd)) { // memberVO에 담겨져있는 패스워드값과 select문의 패스워드가 일치하면
				return ID_AND_PASSWD_OK; // 1을 반환
			} else { // passwd 값 불일치
				return ONLY_PASSWD_FAIL;
			}
		} else { // member == null이면
			return ID_AND_PASSWD_FAIL; // 아이디가 없으면
		}
	}// userCheck 끝

	public String emailCheck(String email) {
		MemberVO memberVO = memberDao.getId(email);
		String id = memberVO.getId();

		System.out.println("담겼잖아 : " + id);
		return id;
	}

	public String searchIdPwd(String id) {
		MemberVO memberVO = memberDao.get(id);
		String passwd = memberVO.getPasswd();
		return passwd;
	}

	@Transactional(readOnly = true)
	public MemberVO get(String id) {
		return memberDao.get(id);
	}

	public void update(MemberVO memberVO) {

		memberDao.update(memberVO);
	}

	public void updateNonImage(MemberVO memberVO) {

		memberDao.updateNonImg(memberVO);
	}

	public void delete(String id) {

		memberDao.delete(id);
	}

	public void updateProfile(MemberVO memberVO) {

		memberDao.profileUpdate(memberVO);
	}

	public void updateIntro(MemberVO memberVO) {

		memberDao.introUpdate(memberVO);
	}

	public int countById(String id) {
		return memberDao.countById(id);
	}

	public int countByEmail(String email) {
		return memberDao.countByEmail(email);
	}
}
