package com.seok.www.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.seok.www.common.Criteria;
import com.seok.www.common.SearchCriteria;
import com.seok.www.domain.BoardVo;
import com.seok.www.domain.FileVo;

public interface BoardService {
	/**
	 * 
	 * @param criteria
	 * @return
	 * @throws Exception
	 */
	public List<BoardVo> listCriteria(Criteria criteria) throws Exception;

	/**
	 * 
	 * 
	 * @param vo
	 * @return
	 */
	public int insertBoard(BoardVo vo, MultipartFile files) throws Exception;

	/**
	 * board
	 * 
	 * @param no
	 * @return
	 */
	public BoardVo selectBoardRead(BoardVo vo) throws Exception;

	/**
	 * board ����
	 * 
	 * @param vo
	 * @return
	 */
	public void modifyBoard(BoardVo vo) throws Exception;

	/**
	 * board ����
	 * 
	 * @param no
	 * @return
	 */
	public void deleteBoard(int no) throws Exception;

	/**
	 * board ��ü ���� ��ȸ
	 * 
	 * @param criteria
	 * @return
	 * @throws Exception
	 */
	public int countArticles(Criteria criteria) throws Exception;

	public List<BoardVo> listSearch(SearchCriteria searchCriteria) throws Exception;

	public int countSearchedboards(SearchCriteria searchCriteria) throws Exception;
	
	public List<FileVo> selectFileList(BoardVo vo) throws Exception;

}
