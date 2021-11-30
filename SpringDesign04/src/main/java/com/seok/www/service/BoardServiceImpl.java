package com.seok.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.seok.www.common.Criteria;
import com.seok.www.common.FileUpload;
import com.seok.www.common.SearchCriteria;
import com.seok.www.domain.BoardVo;
import com.seok.www.domain.FileVo;
import com.seok.www.persistence.BoardDao;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;

	FileUpload fileUpload = new FileUpload();

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public int insertBoard(BoardVo vo, MultipartFile file) throws Exception {

		// file 한개 업로드
		if (!file.isEmpty()) {
			FileVo fileVo = fileUpload.fileUpload(file);
			dao.insertFileUpload(fileVo);
			vo.setBoardFileId(fileVo.getFileName());
		}

		int num = dao.insertBoard(vo);

		// file 다중 업로드

		// update board
		// dao.updateBoard(vo);

		return num;
	}

	@Override
	public List<BoardVo> listCriteria(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCriteria(criteria);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVo selectBoardRead(BoardVo vo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateViewCnt(vo.getBoardNo());
		return dao.selectBoardRead(vo);
	}

	@Override
	public void modifyBoard(BoardVo vo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateBoard(vo);
	}

	@Override
	public void deleteBoard(int no) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteBoard(no);
	}

	@Override
	public int countArticles(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.countArticles(criteria);
	}

	@Override
	public int countSearchedboards(SearchCriteria searchCriteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.countSearchedboards(searchCriteria);
	}

	@Override
	public List<BoardVo> listSearch(SearchCriteria searchCriteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(searchCriteria);
	}


	@Override
	public List<FileVo> selectFileList(BoardVo vo) throws Exception {
		
		return dao.selectFileList(vo);
	}
}
