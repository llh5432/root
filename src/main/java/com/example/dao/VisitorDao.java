package com.example.dao;

import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;
import com.example.vo.VisitorVO;

@Repository
public class VisitorDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	private SimpleJdbcInsert simpleJdbcInsert;

	@PostConstruct
	public void init() {
		simpleJdbcInsert = new SimpleJdbcInsert(jdbcTemplate);
		simpleJdbcInsert.withTableName("visitor"); // 필수

	}

	public void add(String time, int sum) {

		// simplejdbcInsert 방식
		try {
			VisitorVO visitorVO = new VisitorVO();
			System.out.println("add 메소드 : " + time);
			visitorVO.setV_date(time);
			visitorVO.setV_sum(sum);
			simpleJdbcInsert.execute(new BeanPropertySqlParameterSource(visitorVO));

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}// add

	public int count() {

		int count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM visitor", Integer.class);

		return count;
	}

	public int sum() {

		try {
			int sum = jdbcTemplate.queryForObject("SELECT v_sum FROM visitor ORDER BY v_num DESC LIMIT 0,1",
					Integer.class);

			return sum;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
	}

	public void delete() {

		jdbcTemplate.update("DELETE FROM visitor WHERE v_date IS NOT NULL");
	}

	public int select(String time) {

		try {
			int select = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM visitor WHERE v_date = ?", Integer.class,
					time);

			if (select >= 1) {

				return 1;
			} else {
				System.out.println("select : " + select);
				return 0;
			}
			// else 끝
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

			return 0;
		}
		// catch 끝
	}
}