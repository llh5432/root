package com.example.dao;

import java.sql.Timestamp;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.example.vo.MemberVO;
import com.example.vo.OppaListVO;

import com.example.vo.QnaVO;

@Repository
public class AdminDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	private SimpleJdbcInsert simpleJdbcInsert;

	@PostConstruct
	public void init() {
		simpleJdbcInsert = new SimpleJdbcInsert(jdbcTemplate);
		simpleJdbcInsert.withTableName("model");
	}

	public List<MemberVO> getAllMembers(int startRow, int pageSize) { // 전체회원가져오기
		List<MemberVO> list = jdbcTemplate.query("SELECT * FROM member ORDER BY num DESC LIMIT ?,?",
				new BeanPropertyRowMapper<MemberVO>(MemberVO.class), startRow - 1, pageSize);

		return list;
	}

	public List<QnaVO> getAllQboard(int startRow) { // 문의글 전체 가져오기
		List<QnaVO> list = jdbcTemplate.query("SELECT * FROM qna ORDER BY q_num DESC LIMIT ?,10",
				new BeanPropertyRowMapper<QnaVO>(QnaVO.class));

		return list;
	}
	
	public int getOppa() {
		
		try {
			int count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM member WHERE model IS NOT NULL", Integer.class);
			return count;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
	}
	
	public int getAdmin() {
		
		try {
			
			int count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM member WHERE id = 'admin'", Integer.class);
			return count;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
		
	}

	public int getCountMember() { // 전체 회원저장 데이터 총 갯수 구하기 메서드

		int count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM member", Integer.class);

		return count;
	}

	public void deleteMember(int num) { // 해당 번호 레코드 삭제 메서드
		jdbcTemplate.update("DELETE FROM member WHERE num = ?", num);

	}

	public void upgradeMember(String id, int num) { // 오빠 회원등급업 메서드

		String sqlName = "SELECT name FROM member WHERE id = ?";
		String name = jdbcTemplate.queryForObject(sqlName, String.class, id);

		String time = new Timestamp(System.currentTimeMillis()).toString();
		String sqlSubmit = "UPDATE submit SET s_upgrade = ? WHERE s_num = ?";

		String sqlMember = "UPDATE member SET model = ? WHERE id = ?";
		jdbcTemplate.update(sqlSubmit, time, num);

		jdbcTemplate.update(sqlMember, name, id);

	}

	public List<MemberVO> oppaAdminList() {

		List<MemberVO> list = jdbcTemplate.query("SELECT * FROM member WHERE model NOT LIKE 'NULL' ORDER BY num DESC",
				new BeanPropertyRowMapper<MemberVO>(MemberVO.class));

		return list;

	}

	public List<MemberVO> oppaMainList() {

		List<MemberVO> list = jdbcTemplate.query(
				"SELECT * FROM member WHERE model NOT LIKE 'NULL' ORDER BY join_date DESC LIMIT 0,9",
				new BeanPropertyRowMapper<MemberVO>(MemberVO.class));

		return list;

	}

	public void deleteOppa(int num, int num2) {
		jdbcTemplate.update("DELETE FROM oppa WHERE o_num = ?", num);
		System.out.println("num:"+num);
		jdbcTemplate.update("UPDATE member SET model = NULL WHERE num = ?", num2);
		System.out.println("num:"+num2);
	}

	public void numUp(int num2, int num1) {
		jdbcTemplate.update("UPDATE member SET model = ? WHERE num = ?", num2, num1);
	}

	public int getOppaCount() {
		int count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM oppa", Integer.class);

		return count;
	}

	public int getCountBlog() {
		int count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM blog", Integer.class);

		return count;
	}

	public int getCountQna() {

		try {
		int count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM qna", Integer.class);

		return count;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
	}

	public List<OppaListVO> oppaList() {

		List<OppaListVO> list = jdbcTemplate.query(
				"SELECT m.num, o.o_num, o.o_id, o.o_name, m.age, m.address, m.email, m.phone, o.total, o.o_reg_date, o.o_join_date, o.o_like\r\n"
						+ "FROM member AS m JOIN oppa AS o ON\r\n" + "m.id = o.o_id ORDER BY o.o_like DESC",
				new BeanPropertyRowMapper<OppaListVO>(OppaListVO.class));

		return list;

	}

	public int allTotal() {

		try {
		int count = jdbcTemplate.queryForObject("SELECT SUM(pay) FROM book", Integer.class);

		return count;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
	}

	public String maxLikeModel() {

		try {
		String name = jdbcTemplate.queryForObject(
				"SELECT o_name FROM oppa GROUP BY o_like HAVING MAX(o_like) ORDER BY o_num DESC LIMIT 0,1",
				String.class);

		return name;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "없음";
		}
	}

	public String maxLikeBlog() {
		
		try {
		String title = jdbcTemplate.queryForObject(
				"SELECT b_title FROM blog GROUP BY b_likeCount HAVING MAX(b_likeCount) ORDER BY b_num DESC LIMIT 0,1",
				String.class);

		return title;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "없음";
		}
	}

	public int countBook() {
		
		try {
		int count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM book", Integer.class);

		return count;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
	}

	public int countMaxLikeModel() {

		try {
		int count = jdbcTemplate.queryForObject(
				"SELECT o_like FROM oppa GROUP BY o_like HAVING MAX(o_like) ORDER BY o_num DESC LIMIT 0,1",
				Integer.class);

		return count;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
	}

	public int countMaxLikeBlog() {

		try {
		int count = jdbcTemplate.queryForObject(
				"SELECT b_likeCount FROM blog GROUP BY b_likeCount HAVING MAX(b_likeCount) ORDER BY b_num DESC LIMIT 0,1",
				Integer.class);

		return count;
		}catch (Exception e) {
			// TODO: handle exception
//			e.printStackTrace();
			return 0;
		}
	}

	public int countNowSumTotal() {

		try {
			int count = jdbcTemplate.queryForObject(
					"SELECT SUM(pay) FROM book WHERE DATE(reg_date) = DATE(NOW()) AND type ='T'", Integer.class);
			return count;
		} catch (Exception e) {
			// TODO: handle exception
//			e.printStackTrace();
			return 0;
		}
	}
}
