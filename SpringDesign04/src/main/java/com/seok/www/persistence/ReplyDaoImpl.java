package com.seok.www.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seok.www.common.Criteria;
import com.seok.www.domain.ReplyVo;

@Repository("ReplyDao")
public class ReplyDaoImpl implements ReplyDao {

	private static String NAMESPACE = "reply";

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<ReplyVo> selectList(int boardNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + ".list", boardNo);
	}

	@Override
	public void insertReply(ReplyVo replyVo) throws Exception {
		// TODO Auto-generated method stub
		if (replyVo.getReplyGrp() == 0) {
			sqlSession.insert(NAMESPACE + ".insertReply", replyVo);
		} else {
			sqlSession.insert(NAMESPACE + ".insertReplyTo", replyVo);
		}

	}

	@Override
	public void updateReply(ReplyVo replyVo) throws Exception {
		// TODO Auto-generated method stub
		if (replyVo.getReplyLogin() == 1) {
			sqlSession.update(NAMESPACE + ".updateReply", replyVo);
		} else {
			sqlSession.update(NAMESPACE + ".updateReplyNon", replyVo);
		}

	}

	@Override
	public void deleteReply(ReplyVo replyVo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("dao del reply");
		if (replyVo.getReplyLogin() == 1) {
			System.out.println("dao del reply login");
			sqlSession.update(NAMESPACE + ".deleteReply", replyVo);
		} else {
			System.out.println("dao no del reply :"+replyVo.toString());
			sqlSession.update(NAMESPACE + ".deleteReplyNon", replyVo);
		}

	}

	@Override
	public int countReply(int boardNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + ".countReplies", boardNo);
	}

	@Override
	public List<ReplyVo> listPaging(int boardNo, Criteria criteria) throws Exception {
		// TODO Auto-generated method stub

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("boardNo", boardNo);
		paramMap.put("criteria", criteria);
		return sqlSession.selectList(NAMESPACE + ".listPaging", paramMap);
	}

}
