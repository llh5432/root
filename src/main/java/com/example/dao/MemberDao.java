package com.example.dao;

import java.sql.Timestamp;

import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;
import com.example.vo.MemberVO;
import com.example.vo.SubmitVO;

@Repository
public class MemberDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	private SimpleJdbcInsert simpleJdbcInsert;

	@Autowired
	private AdminDao adminDao;

	@Autowired
	private SubmitDao submitDao;
	
	@PostConstruct
	public void init() {
		simpleJdbcInsert = new SimpleJdbcInsert(jdbcTemplate);
		simpleJdbcInsert.withTableName("member"); // 필수
		
		int count = adminDao.getCountMember();
		if (count < 10) { // 멤버수가 10명이 안되면 1000개의 멤버더미데이터 생성
			dummyMember();
		}
		int adminCount = adminDao.getAdmin();
		if(adminCount == 0) { // 어드민계정이없다면 어드민 계정 하나 생성
			userAdmin();
		}
		
	}

	private void dummyMember() { // 샘플 memberVO데이터 삽입 메서드

		SqlParameterSource[] sources = new SqlParameterSource[1000];

		MemberVO memberVO = null;

		for (int i = 0; i < 1000; i++) {
			memberVO = new MemberVO();
			memberVO.setId("abc" + i);
			memberVO.setPasswd("1234");
			memberVO.setName("abc" + i);
			memberVO.setCountry("japan");
			memberVO.setAddress(i + "street");
			memberVO.setLanguage("English");
			memberVO.setJob("student" + i);
			memberVO.setAge(0 + i);
			memberVO.setGender("femail");
			memberVO.setEmail("abc@abc" + i);
			memberVO.setPhone("010-1234-" + i);
			memberVO.setJoin_date(new Timestamp(System.currentTimeMillis()).toString());
			memberVO.setLikes(0);
			memberVO.setIntro("" + i);

			sources[i] = new BeanPropertySqlParameterSource(memberVO);
		}
		simpleJdbcInsert.executeBatch(sources);

	}
	public void userAdmin() { // 어드민계정 자동생성
		
		
		MemberVO memberVO = new MemberVO();
	
		memberVO.setId("admin");
		memberVO.setPasswd("1234");
		memberVO.setName("admin");
		memberVO.setCountry("japan");
		memberVO.setAddress("home");
		memberVO.setLanguage("English");
		memberVO.setJob("admin");
		memberVO.setAge(0);
		memberVO.setGender("femail");
		memberVO.setEmail("admin@admin.com");
		memberVO.setPhone("010-1111-1111");
		memberVO.setJoin_date(new Timestamp(System.currentTimeMillis()).toString());
		memberVO.setLikes(0);
		memberVO.setIntro("admin아이디입니다.");
		System.out.println("되나");
		simpleJdbcInsert.execute(new BeanPropertySqlParameterSource(memberVO));
		System.out.println("안되나");
	}
	
	public void add(MemberVO memberVO) {

		// simplejdbcInsert 방식
		simpleJdbcInsert.execute(new BeanPropertySqlParameterSource(memberVO));

	}// add

	public MemberVO get(String id) {
		// queryForObject() 메소드는 행 1개만 가져오는 select문 실행시 사용!
		// 행이 0개 또는 2개 이상 가져오면 예외를 발생시킴! 해당값이 없거나 2개이상..
		try {
			MemberVO memberVO;
			try {
				System.out.println("왜안떠:" + id);
				memberVO = jdbcTemplate.queryForObject("SELECT * FROM member WHERE id = ?",
						new BeanPropertyRowMapper<MemberVO>(MemberVO.class), id);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			}
			return memberVO;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}// get 메소드끝

	public MemberVO getId(String email) {
		try {
			// JdbcTemplate 방식

			/*
			 * * Member m = jdbcTemplate.queryForObject("SELECT * FROM member WHERE id=?",
			 * new BeanPropertyRowMapper<Member>(Member.class), id); return m;
			 */

			// NamedParameterJdbcTemplate 방식
			MemberVO mm = jdbcTemplate.queryForObject("SELECT * FROM member WHERE email=?",
					new BeanPropertyRowMapper<MemberVO>(MemberVO.class), email);
			System.out.println("name memberVo : " + mm.toString());
			return mm;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int comfirm(String id, String passwd) {

		try {
			MemberVO memberVO;
			int check; // 초기값
			try {
				memberVO = jdbcTemplate.queryForObject("select * from member where id = ?",
						new BeanPropertyRowMapper<MemberVO>(MemberVO.class), id);

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return 0;
			}

			if (memberVO.getId().equals(id) && memberVO.getPasswd().equals(passwd)) {
				// id, passwd 가 일치
				check = 1;
			} else {
				// id, passwd 가 불일치
				check = 0;
			}

//			System.out.println("memberDao.comfirm 메소드 check 값 : "+check);
			return check;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
	}

	public int update(MemberVO memberVO) {
		int rowCount = namedParameterJdbcTemplate.update(
				"UPDATE member SET passwd=:passwd, country=:country, email=:email, language=:language, job=:job, phone=:phone, intro=:intro, image=:image WHERE id=:id",
				new BeanPropertySqlParameterSource(memberVO));
		return rowCount;
	}

	public int updateNonImg(MemberVO memberVO) {
		int rowCount = namedParameterJdbcTemplate.update(
				"UPDATE member SET passwd=:passwd, country=:country, email=:email, language=:language, job=:job, phone=:phone, intro=:intro WHERE id=:id",
				new BeanPropertySqlParameterSource(memberVO));
		return rowCount;
	}

	public void delete(String id) {
		SqlParameterSource param = new MapSqlParameterSource("id", id);
		namedParameterJdbcTemplate.update("DELETE FROM member WHERE id=:id", param);
	}

	public MemberVO getModel(String model) {

		try {
			MemberVO memberVO = jdbcTemplate.queryForObject("SELECT * FROM member WHERE model = ?",
					new BeanPropertyRowMapper<MemberVO>(MemberVO.class), model);
			return memberVO;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

	public int profileUpdate(MemberVO memberVO) {
		int rowCount = namedParameterJdbcTemplate.update("UPDATE member SET intro=:intro, image=:image WHERE id=:id",
				new BeanPropertySqlParameterSource(memberVO));
		return rowCount;
	}

	public int introUpdate(MemberVO memberVO) {
		int rowCount = namedParameterJdbcTemplate.update("UPDATE member SET intro=:intro WHERE id=:id",
				new BeanPropertySqlParameterSource(memberVO));
		return rowCount;
	}

	public MemberVO selectLikeMember() {

		MemberVO memberVO = jdbcTemplate.queryForObject(
				"SELECT * FROM member WHERE likes = (SELECT MAX(likes) FROM member) ORDER BY num DESC LIMIT 1",
				new BeanPropertyRowMapper<MemberVO>(MemberVO.class));

		return memberVO;
	}

	public String getOppaName(String model) {

		String name = jdbcTemplate.queryForObject("SELECT name FROM member WHERE model = ?", String.class, model);
		return name;
	}

	public int countById(String id) {
		int count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM member WHERE id = ?", Integer.class, id);
		return count;
	}

	public int countByEmail(String email) {
		int count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM member WHERE email = ?", Integer.class, email);

		return count;
	}

	public MemberVO getPwd(String passwd) {
		try {// NamedParameterJdbcTemplate 방식
			MemberVO mm = jdbcTemplate.queryForObject("SELECT passwd FROM member WHERE mb_ID=?",
					new BeanPropertyRowMapper<MemberVO>(MemberVO.class), passwd);
			System.out.println("PASWDD memberVo : " + mm.toString());

			return mm;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

}
