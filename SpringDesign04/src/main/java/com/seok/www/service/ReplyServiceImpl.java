package com.seok.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seok.www.common.Criteria;
import com.seok.www.domain.ReplyVo;
import com.seok.www.persistence.ReplyDao;

@Service("ReplyService")
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyDao dao;

	@Override
	public List<ReplyVo> selectList(int boardNo) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectList(boardNo);
	}

	@Override
	public void insertReply(ReplyVo ReplyVo) throws Exception {
		// TODO Auto-generated method stub
		dao.insertReply(ReplyVo);
	}

	@Override
	public void updateReply(ReplyVo ReplyVo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateReply(ReplyVo);
	}

	@Override
	public void deleteReply(ReplyVo ReplyNo) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteReply(ReplyNo);
	}

	@Override
	public int countReplies(int boardNo) throws Exception {
		// TODO Auto-generated method stub
		return dao.countReply(boardNo);
	}

	@Override
	public List<ReplyVo> getRepliesPaging(int boardNo, Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPaging(boardNo, criteria);
	}
}
