package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.example.dao.QnaDAO;
import com.example.vo.QnaVO;

@Service
@Transactional
public class QnaService {

	@Autowired
	private QnaDAO qnaDao;

	public void add(QnaVO qboardVO) {
		qnaDao.add(qboardVO);
	}
}