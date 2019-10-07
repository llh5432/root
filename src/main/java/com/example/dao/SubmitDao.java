package com.example.dao;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.example.vo.MemberVO;
import com.example.vo.SubmitVO;

@Repository // DAO 를 명시하기위해서사용
public class SubmitDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	private SimpleJdbcInsert simpleJdbcInsert;

	@PostConstruct
	public void init() {
		simpleJdbcInsert = new SimpleJdbcInsert(jdbcTemplate);
		simpleJdbcInsert.withTableName("submit");
	}

	public void add(String id, SubmitVO submitVO) {

		submitVO.setS_id(id);
		submitVO.setS_reg_date(new Timestamp(System.currentTimeMillis()).toString());
		simpleJdbcInsert.execute(new BeanPropertySqlParameterSource(submitVO));

	}

	public SubmitVO get(int s_num) {
		// queryForObject() 메소드는 행 1개만 가져오는 select문 실행시 사용!
		// 행이 0개 또는 2개 이상 가져오면 예외를 발생시킴! 해당값이 없거나 2개이상..
		try {
			SubmitVO submitVO;
			try {
				submitVO = jdbcTemplate.queryForObject("select * from submit where s_num = ?",
						new BeanPropertyRowMapper<SubmitVO>(SubmitVO.class), s_num);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			}
			return submitVO;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}// get 메소드끝

	public int getSubmitCount() {

		int count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM submit", Integer.class);

		return count;
	}

	public List<SubmitVO> submitList(int startRow, int pageSize) {

		List<SubmitVO> list = jdbcTemplate.query("SELECT * FROM submit ORDER BY s_num DESC LIMIT ?,?",
				new BeanPropertyRowMapper<SubmitVO>(SubmitVO.class), startRow - 1, pageSize);

		return list;
	}

	public void deleteSubmit(int num) {

		jdbcTemplate.update("DELETE FROM submit WHERE s_num = ?", num);
	}

	public void upgradeSubmit(String id, String name, int num) {

//		==================== submit 테이블 update =======================
		String date = new Timestamp(System.currentTimeMillis()).toString();
		jdbcTemplate.update("UPDATE submit SET s_upgrade = ? WHERE s_num = ?", date, num);

//		==================== member 테이블 update =======================
		jdbcTemplate.update("UPDATE member SET model = ? WHERE id = ?", name, id);
	}
}