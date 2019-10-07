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
import com.example.vo.OppaVO;

@Repository
public class OppaDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	private SimpleJdbcInsert simpleJdbcInsert;

	@PostConstruct
	public void init() {
		simpleJdbcInsert = new SimpleJdbcInsert(jdbcTemplate);
		simpleJdbcInsert.withTableName("oppa");
		
		
	}

	public void add(String id, int num) {

		try {

			int select = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM oppa WHERE o_id = ?", Integer.class, id);
			System.out.println("select : " + select);

			if (select == 0) {

				OppaVO oppaVO = new OppaVO();

				String name = jdbcTemplate.queryForObject("SELECT s_name FROM submit WHERE s_num = ?", String.class,
						num);
				String regDate = jdbcTemplate.queryForObject("SELECT join_date FROM member WHERE id = ?", String.class,
						id);
				String time = new Timestamp(System.currentTimeMillis()).toString();
				oppaVO.setO_id(id);
				oppaVO.setO_name(name);
				oppaVO.setO_join_date(regDate);
				oppaVO.setO_reg_date(time);
				simpleJdbcInsert.execute(new BeanPropertySqlParameterSource(oppaVO));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	public List<OppaVO> oppaList() {

		List<OppaVO> list = jdbcTemplate.query("SELECT * FROM oppa ORDER BY o_join_date DESC LIMIT 0,9",
				new BeanPropertyRowMapper<OppaVO>(OppaVO.class));

		return list;

	}

	public int oppaTotal(String id) {

		try {
			int count = jdbcTemplate.queryForObject("SELECT total FROM oppa WHERE o_id = ?", Integer.class, id);
			return count;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
	}

	public int oppaLike(String id) {

		try {
			int count = jdbcTemplate.queryForObject("SELECT o_like FROM oppa WHERE o_id = ?", Integer.class, id);

			return count;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
	}

}
