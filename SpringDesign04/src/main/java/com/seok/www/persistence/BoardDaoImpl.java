package com.seok.www.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seok.www.common.Criteria;
import com.seok.www.common.SearchCriteria;
import com.seok.www.domain.BoardVo;
import com.seok.www.domain.FileVo;

@Repository("BoardDao")
public class BoardDaoImpl implements BoardDao {

	private static final String NAMESPACE = "board";

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<BoardVo> listCriteria(Criteria criteria) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listCriteria", criteria);
	}

	public int insertBoard(BoardVo vo) {		
		return sqlSession.insert(NAMESPACE + ".insertBoard", vo);
	}

	public BoardVo selectBoardRead(BoardVo vo) {
		return sqlSession.selectOne(NAMESPACE + ".insertBoardRead", vo.getBoardNo());
	}

	@Override
	public void updateBoard(BoardVo vo) throws Exception {
		System.out.println(vo.toString());
		sqlSession.update(NAMESPACE + ".updateBoard", vo);
	}

	@Override
	public void deleteBoard(int no) throws Exception {
		sqlSession.update(NAMESPACE + ".deleteBoard", no);

	}

	@Override
	public int countArticles(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + ".countArticles", criteria);
	}

	@Override
	public int countSearchedboards(SearchCriteria searchCriteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + ".countSearchedboards", searchCriteria);
	}

	@Override
	public List<BoardVo> listSearch(SearchCriteria searchCriteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + ".listSearch", searchCriteria);
	}

	@Override
	public void updateViewCnt(int boardNo) throws Exception {
		sqlSession.update(NAMESPACE + ".updateViewCnt", boardNo);

	}
	
	@Override
	public void insertFileUpload(FileVo fileVo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(NAMESPACE + ".insertFile", fileVo);
	}
	
	@Override
	public List<FileVo> selectFileList(BoardVo vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("dao board: "+vo.getBoardFileId());
		return sqlSession.selectList(NAMESPACE + ".selectFileList", vo);
	}
}
