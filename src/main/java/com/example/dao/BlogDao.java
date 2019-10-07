package com.example.dao;

import java.sql.Timestamp;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.example.vo.MemberVO;
import com.example.vo.BlogVO;
import com.example.vo.CarouselVO;

@Repository
public class BlogDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	private SimpleJdbcInsert simpleJdbcInsert;

	@Autowired
	AdminDao adminDao;
	@Autowired
	MemberDao memberDao;
	@Autowired
	ReplyDao replyDao;

	@PostConstruct
	public void init() { // blog 더미데이터 삽입 메서드
		simpleJdbcInsert = new SimpleJdbcInsert(jdbcTemplate);
		simpleJdbcInsert.withTableName("blog");

		int count = adminDao.getCountBlog();
		if (count < 10) {
			dummyBoard();
		}

	}

	private void dummyBoard() { // 샘플 blogVO데이터 삽입 메서드

		SqlParameterSource[] sources = new SqlParameterSource[1000];

		BlogVO blogVO = null;

		for (int i = 0; i < 1000; i++) {
			blogVO = new BlogVO();
			blogVO.setB_id("abc" + i);
			blogVO.setB_model("0");
			blogVO.setB_name("abc" + i);
			blogVO.setB_title("테스트중 " + i + "번째 글!(dummy)");
			blogVO.setB_reg_date(new Timestamp(System.currentTimeMillis()).toString());
			blogVO.setB_content("글내용입니다(dummy)" + i);
			blogVO.setReplyCount(0);
			sources[i] = new BeanPropertySqlParameterSource(blogVO);
		}
		simpleJdbcInsert.executeBatch(sources);

	}

	public void add(String id, BlogVO blogVO) { // blog 게시물 삽입 메서드
		MemberVO memberVO = new MemberVO();

		memberVO = memberDao.get(id);
		blogVO.setB_likeCount(0);
		blogVO.setB_readCount(0);
		blogVO.setB_id(memberVO.getId());
		blogVO.setB_name(memberVO.getName());
		blogVO.setB_likeCount(1);

		blogVO.setB_reg_date(new Timestamp(System.currentTimeMillis()).toString());
		System.out.println("blogVO add메소드 : " + blogVO.toString());
		simpleJdbcInsert.execute(new BeanPropertySqlParameterSource(blogVO));
	}

	public List<BlogVO> blogList(int startRow, int pageSize) {

		List<BlogVO> list = jdbcTemplate.query(
				"SELECT b_id,b_model,b_num,b_name,b_title,b_content,b_image,b_reg_date,b_readCount,b_likeCount,(SELECT COUNT(*) FROM reply WHERE b_num = b.b_num) replyCount\r\n"
						+ "FROM blog b\r\n" + "ORDER BY b_num DESC LIMIT ?,?;",
				new BeanPropertyRowMapper<BlogVO>(BlogVO.class), startRow - 1, pageSize);

		return list;
	
	}

	public List<BlogVO> adminBlogList(int startRow, int pageSize) {

		List<BlogVO> list = jdbcTemplate.query("SELECT * FROM blog ORDER BY b_num DESC LIMIT ?,?",
				new BeanPropertyRowMapper<BlogVO>(BlogVO.class), startRow - 1, pageSize);

		return list;
	}

	public BlogVO getBlog(int b_num) { // blog main 메소드

		try {
			BlogVO blogVO;
			try {

				blogVO = jdbcTemplate.queryForObject("SELECT * FROM blog WHERE b_num = ?",
						new BeanPropertyRowMapper<BlogVO>(BlogVO.class), b_num);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			}
			return blogVO;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

	public List<BlogVO> getLikeBlog(String model) {
		// 모델 별 좋아요 횟수가 가장 많은 게시물 탑 5개 뽑아오기

		List<BlogVO> blogVO = jdbcTemplate.query(
				"SELECT * FROM blog WHERE b_model = ? ORDER BY b_likeCount DESC LIMIT 0,5",
				new BeanPropertyRowMapper<BlogVO>(BlogVO.class), model);

		return blogVO;

	}

	public void readCountUpdate(BlogVO blogVO) {

		namedParameterJdbcTemplate.update("UPDATE blog SET b_readCount=:b_readCount+1 WHERE b_num=:b_num",
				new BeanPropertySqlParameterSource(blogVO));

	}

	public void replyCountUpdate(int b_num) {
		jdbcTemplate.update("UPDATE blog SET b_replyCount = b_replyCount+1 WHERE b_num = ?", b_num);
	}

	public int countLike(int b_num) {

		int like = jdbcTemplate.queryForObject("SELECT b_likeCount FROM blog WHERE b_num = ?", Integer.class, b_num);

		return like;
	}

	public int detailLikeMember(int b_num, String id) {

		try {
			int detail = jdbcTemplate.queryForObject(
					"SELECT COUNT(*) FROM blog WHERE b_num = ? AND b_likeMember LIKE '%" + id + "%'", Integer.class,
					b_num);
			return detail;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}

	}

	public int btnLikeMember(int b_num, String id, int select) {

		if (select == 1) { // 셀렉값이 나왔으면 다시 없애고 -1 시켜야함
			// likeMember 의 id를 '' 로 만듦
			jdbcTemplate.update("UPDATE blog SET b_likeMember = REPLACE(b_likeMember,'," + id + "','') WHERE b_num = ?",
					b_num);
			// likeCount -1 을 시킴
			jdbcTemplate.update("UPDATE blog SET b_likeCount = b_likeCount - 1 WHERE b_num=?", b_num);

			String model = jdbcTemplate.queryForObject("SELECT b_model FROM blog WHERE b_num = ?", String.class, b_num);
			jdbcTemplate.update("UPDATE oppa SET o_like = o_like - 1 WHERE o_name = ?", model);
			try {
				int num = jdbcTemplate.queryForObject("SELECT num FROM member WHERE name = ? AND model IS NOT NULL",
						Integer.class, model);
				jdbcTemplate.update("UPDATE member SET likes = likes - 1 WHERE num = ?", num);
				return 0;

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return 0;
			}

		} else { // 셀렉값이 안나왔으면 다시 만들고 +1
					// likeMember 의 id를 넣음
					// concat 은 해당필드값이 null 일때 업데이트가 안되고 null을 반환함 ifnull을 사용해줘야함
			jdbcTemplate.update(
					"UPDATE blog SET b_likeMember = CONCAT(IFNULL(b_likeMember,''),'," + id + "')WHERE b_num = ?",
					b_num);
			// likeCount +1을 시킴
			jdbcTemplate.update("UPDATE blog SET b_likeCount = b_likeCount +1 WHERE b_num = ?", b_num);

			String model = jdbcTemplate.queryForObject("SELECT b_model FROM blog WHERE b_num = ?", String.class, b_num);
			jdbcTemplate.update("UPDATE oppa SET o_like = o_like + 1 WHERE o_name = ?", model);

			try {
				int num = jdbcTemplate.queryForObject("SELECT num FROM member WHERE name = ? AND model IS NOT NULL",
						Integer.class, model);
				jdbcTemplate.update("UPDATE member SET likes = likes + 1 WHERE num = ?", num);
				return 1;

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return 1;
			}

		}
	}

	public int getSelectCount(String model) {

		int count = jdbcTemplate.queryForObject(
				"SELECT COUNT(*) FROM blog WHERE b_model = ? ORDER BY b_likeCount DESC LIMIT 0,5", Integer.class,
				model);

		return count;
	}

	public List<CarouselVO> carouselImg(String model) {

		List<CarouselVO> crVO = jdbcTemplate.query(
				"SELECT b_id, b_model, b_image, b_title FROM blog WHERE b_image <> '" + "NULL" + "' AND b_model = ?",
				new BeanPropertyRowMapper<CarouselVO>(CarouselVO.class), model);

		return crVO;

	}

	public int imgNumSelect(String model) {

		int num = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM blog WHERE b_image <> 'NULL' AND b_model = ?",
				Integer.class, model);

		return num;
	}

	public List<BlogVO> profileBoard(String model) {

		List<BlogVO> blogVO = jdbcTemplate.query(
				"SELECT * FROM blog WHERE b_model = ? ORDER BY b_likeCount DESC LIMIT 0,3",
				new BeanPropertyRowMapper<BlogVO>(BlogVO.class), model);

		return blogVO;
	}

	public BlogVO selectLikeBoard() {

		try {
			BlogVO blogVO = jdbcTemplate.queryForObject(
					"SELECT * FROM blog WHERE b_likeCount =(SELECT MAX(b_likeCount) FROM blog) ORDER BY b_num DESC LIMIT 1",
					new BeanPropertyRowMapper<BlogVO>(BlogVO.class));

			return blogVO;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

			return null;
		}

	}

	public void deleteBoard(int b_num) {

		jdbcTemplate.update("DELETE FROM blog WHERE b_num = ?", b_num);
	}

	public int getBoardCount() {

		int count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM blog", Integer.class);

		return count;
	}

	public int updateBoardNonImg(BlogVO blogVO) {

		int rowCount = namedParameterJdbcTemplate.update(
				"UPDATE blog SET b_model=:b_model, b_title=:b_title, b_content=:b_content, b_reg_date=:b_reg_date WHERE b_num=:b_num",
				new BeanPropertySqlParameterSource(blogVO));
		return rowCount;
	}

	public int updateBoardImg(BlogVO blogVO) {

		int rowCount = namedParameterJdbcTemplate.update(
				"UPDATE blog SET b_model=:b_model, b_title=:b_title, b_content=:b_content, b_image=:b_image, b_reg_date=:b_reg_date WHERE b_num=:b_num",
				new BeanPropertySqlParameterSource(blogVO));
		return rowCount;
	}
	
	public void pageNum(int b_num, int pageNum) {
		
		
	}

}
