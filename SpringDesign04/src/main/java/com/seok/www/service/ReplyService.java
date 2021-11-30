package com.seok.www.service;

import java.util.List;

import com.seok.www.common.Criteria;
import com.seok.www.domain.ReplyVo;

public interface ReplyService {

	public List<ReplyVo> selectList(int boardNo) throws Exception;

	public void insertReply(ReplyVo ReplyVo) throws Exception;

	public void updateReply(ReplyVo ReplyVo) throws Exception;

	public void deleteReply(ReplyVo ReplyVo) throws Exception;
	
	public List<ReplyVo> getRepliesPaging(int boardNo, Criteria criteria) throws Exception;

	public int countReplies(int boardNo) throws Exception;

}
