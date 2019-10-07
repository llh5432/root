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
import com.example.vo.BookVO;

@Repository
public class BookDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	private SimpleJdbcInsert simpleJdbcInsert;

	@PostConstruct
	public void init() {
		simpleJdbcInsert = new SimpleJdbcInsert(jdbcTemplate);
		simpleJdbcInsert.withTableName("book");
	}

	public BookVO getBlog(int num) { // blog main 메소드

		try {
			BookVO bookVO;
			try {

				bookVO = jdbcTemplate.queryForObject("SELECT * FROM book WHERE book_num = ?",
						new BeanPropertyRowMapper<BookVO>(BookVO.class), num);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			}
			return bookVO;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

	// 예약데이터 삽입 메소드
	public void add(String id, BookVO bookVO) {

		bookVO.setId(id);
		bookVO.setPay(80000);
		bookVO.setType("T");
		bookVO.setReg_date(new Timestamp(System.currentTimeMillis()).toString()); // 현재시간데이터를 String타입으로 변환
		bookVO.setMeet("F");
		simpleJdbcInsert.execute(new BeanPropertySqlParameterSource(bookVO)); // 예약데이터 bean 오브젝트를 담아서 execute함
		
		int count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM book WHERE model = ?", Integer.class, bookVO.getModel());
		// 방금 데이터삽입한 행의 해당모델의 예약건수를 구해서 count에 삽입
		
		if(count > 0) {//만약 예약건수가 1건이상이라면
			int total = count * 80000; // 1건당 8만원 곱하기 
			jdbcTemplate.update("UPDATE oppa SET total = ? WHERE o_name = ?", total, bookVO.getModel());
			// 구한 total 데이터베이스에 업그레이드
		}
		
		
		
	}

	public int select(String model, String date) {

		try {
			int count = jdbcTemplate.queryForObject(
					"SELECT COUNT(*) FROM book WHERE model = ? AND book_date LIKE '%" + date + "%'", Integer.class,
					model);
			return count;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}

	}

	public void dummyBook(String id, String model, String date) {

//		String sqlName = "SELECT name FROM member WHERE model = ?";
//		String modelName = jdbcTemplate.queryForObject(sqlName, String.class, model);
		jdbcTemplate.update("INSERT INTO book (id, model, book_date, type, pay)VALUES(?,?,?,?,?)", id, model, date, "F", 0);
	}

	public void delete(String id) {
		jdbcTemplate.update("DELETE FROM book WHERE id = ? AND content IS NULL", id);
	}

	public int selectNull(String id) {

		try {
			int count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM book WHERE id = ? AND content IS NULL",
					Integer.class, id);

			return count;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
	}

	public List<BookVO> getBookList(String id) {

		List<BookVO> list = jdbcTemplate.query("SELECT * FROM book WHERE id = ? ORDER BY book_num DESC",
				new BeanPropertyRowMapper<BookVO>(BookVO.class), id);

		return list;
	}

	public List<BookVO> getAdminBookList(int startRow, int pageSize) {

		List<BookVO> list = jdbcTemplate.query("SELECT * FROM book ORDER BY book_num DESC LIMIT ?,?",
				new BeanPropertyRowMapper<BookVO>(BookVO.class), startRow - 1, pageSize);

		return list;
	}

	public int getBookCount() {

		int count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM book", Integer.class);

		return count;
	}
	
	// 관리자페이지에서 진행상황버튼 메소드 예약이 진행됐다면 '진행완료' 아니면  '진행중'
	public void bookMeetCheck(int num) {

			jdbcTemplate.update("UPDATE book SET meet = 'T' WHERE book_num = ?", num);
			// 체크된 번호들을 매개변수 int형으로 받아서 쿼리문에 삽입해서 update 시킴
			// F => T로 변환 meet 컬럼이 T로 변환이되면 진행완료로 바뀜
		
	}

	public void bookDelete(int num) {

		jdbcTemplate.update("DELETE FROM book WHERE book_num = ?", num);
	}

}