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

import com.example.vo.QnaVO;

@Repository
public class QnaDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	private SimpleJdbcInsert simpleJdbcInsert;

	@PostConstruct
	public void init() {
		simpleJdbcInsert = new SimpleJdbcInsert(jdbcTemplate);
		simpleJdbcInsert.withTableName("qna");
	}

	public void add(QnaVO qnaVO) {

		simpleJdbcInsert.execute(new BeanPropertySqlParameterSource(qnaVO));

	}

	public QnaVO get(String id) {
		// queryForObject() 메소드는 행 1개만 가져오는 select문 실행시 사용!
		// 행이 0개 또는 2개 이상 가져오면 예외를 발생시킴! 해당값이 없거나 2개이상..
		try {
			QnaVO qnaVO;
			try {
				qnaVO = jdbcTemplate.queryForObject("select * from qna where id = ?",
						new BeanPropertyRowMapper<QnaVO>(QnaVO.class), id);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			}
			return qnaVO;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}// get 메소드끝

	// 문의글 삭제 메소드
	public void deleteQb(int num) {

		jdbcTemplate.update("DELETE FROM qna WHERE q_num=?", num);
	} // 끝

	public List<QnaVO> getQboard(String q_id) {

		List<QnaVO> list = jdbcTemplate.query("SELECT * FROM qna WHERE q_id=? ORDER BY q_num DESC",
				new BeanPropertyRowMapper<QnaVO>(QnaVO.class), q_id);
		return list;
	}

	// 글 갯수 구하기 메소드
	public int getQnaCount() {

		try {
		int count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM qna", Integer.class);

		return count;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}	
	}

	// 문의글 리스트 메소드
	public List<QnaVO> getAllQna(int startRow, int pageSize) {
		
		try {
		List<QnaVO> list = jdbcTemplate.query("SELECT * FROM qna ORDER BY q_num DESC limit ?,?",
				new BeanPropertyRowMapper<QnaVO>(QnaVO.class), startRow - 1, pageSize);

		return list;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

	public QnaVO getQnaDetail(int num) {

		QnaVO qnaVO = jdbcTemplate.queryForObject("SELECT * FROM qna WHERE q_num = ?",
				new BeanPropertyRowMapper<QnaVO>(QnaVO.class), num);

		return qnaVO;

	}

	public void updateReply(int num, String re_content) {

		Timestamp time = new Timestamp(System.currentTimeMillis());
		String date = time.toString();

		jdbcTemplate.update("UPDATE qna SET re_content = ?, re_date = ?, reply = 'T' WHERE q_num = ?", re_content,
				date, num);
	}
}