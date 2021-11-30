package com.seok.www.persistence;

import java.util.List;

import com.seok.www.common.Criteria;
import com.seok.www.domain.ReplyVo;

public interface ReplyDao {
	
	   public List<ReplyVo> selectList(int boardNo) throws Exception;

	   public void insertReply(ReplyVo replyVo) throws Exception;

	   public void updateReply(ReplyVo replyVo) throws Exception;

	   public void deleteReply(ReplyVo replyVo) throws Exception;
	   
	   public List<ReplyVo> listPaging(int boardNo, Criteria criteria) throws Exception;

	   public int countReply(int boardNo) throws Exception;

	   
}
