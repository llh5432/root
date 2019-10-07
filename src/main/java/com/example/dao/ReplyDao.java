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

import com.example.vo.ReplyVO;

@Repository
public class ReplyDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	private SimpleJdbcInsert simpleJdbcInsert;

	@PostConstruct
	public void init() {
		simpleJdbcInsert = new SimpleJdbcInsert(jdbcTemplate);
		simpleJdbcInsert.withTableName("reply");
	}

	public void add(int b_num, String id, ReplyVO replyVO) {

		replyVO.setB_num(b_num);
		replyVO.setR_id(id);
		replyVO.setR_replyDate(new Timestamp(System.currentTimeMillis()).toString());
		simpleJdbcInsert.execute(new BeanPropertySqlParameterSource(replyVO));
	}

	public ReplyVO getReply(int b_num) {

		try {
			ReplyVO replyVO;
			try {
				replyVO = jdbcTemplate.queryForObject("SELECT * FROM reply WHERE b_num= ?",
						new BeanPropertyRowMapper<ReplyVO>(ReplyVO.class), b_num);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			}
			return replyVO;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}

	}

	public List<ReplyVO> replyList(int b_num) {

		List<ReplyVO> list = jdbcTemplate.query("SELECT * FROM reply WHERE b_num = ? ORDER BY r_num DESC ",
				new BeanPropertyRowMapper<ReplyVO>(ReplyVO.class), b_num);

		return list;
	}

	public int replyCount(int b_num) {

		int count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM reply WHERE b_num = ?", Integer.class, b_num);

		return count;
	}

	public void deleteReply(int r_num) {

		jdbcTemplate.update("DELETE FROM reply WHERE r_num = ?", r_num);

	}

	public int selectBlogNum(int r_num) {

		int num = jdbcTemplate.queryForObject("SELECT b_num FROM reply WHERE r_num =?", Integer.class, r_num);

		return num;
	}

}