package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.BlogDao;
import com.example.dao.MemberDao;
import com.example.dao.ReplyDao;
import com.example.dao.SubmitDao;
import com.example.vo.BlogVO;
import com.example.vo.MemberVO;
import com.example.vo.ReplyVO;

@Service
@Transactional
public class BlogService {

	// @Autowired : 타입 정보를 기준으로 의존관계를 주입

	@Autowired
	private BlogDao blogDao;

	@Autowired
	private ReplyDao replyDao;

	public void updateBlogNonImg(BlogVO blogVO) {
		blogDao.updateBoardNonImg(blogVO);

	}

	public void updateBlogImg(BlogVO blogVO) {
		blogDao.updateBoardImg(blogVO);

	}

	public void updateReply(int b_num, String id, ReplyVO replyVO) {
		replyDao.add(b_num, id, replyVO);
		blogDao.replyCountUpdate(b_num);
	}

}