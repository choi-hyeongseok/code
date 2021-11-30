package com.seok.www.persistence;

import java.util.List;

import com.seok.www.common.Criteria;
import com.seok.www.common.SearchCriteria;
import com.seok.www.domain.BoardVo;
import com.seok.www.domain.FileVo;

public interface BoardDao {
	/**
	 * �Խñ� ����Ʈ ���
	 * 
	 * @param criteria
	 * @return
	 * @throws Exception
	 */
	public List<BoardVo> listCriteria(Criteria criteria) throws Exception;

	/**
	 * insert Board
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int insertBoard(BoardVo vo) throws Exception;

	/**
	 * �Խñ� �б�
	 * 
	 * @param vo
	 * @return
	 */
	public BoardVo selectBoardRead(BoardVo vo) throws Exception;

	/**
	 * �Խñ� ����
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public void updateBoard(BoardVo vo) throws Exception;
	
	/**
	 * �Խñ� ���� ����
	 * @param no
	 * @throws Exception
	 */
	public void deleteBoard(int no) throws Exception;

	/**
	 * �Խñ� ��ü ����
	 * 
	 * @param criteria
	 * @return
	 * @throws Exception
	 */
	public int countArticles(Criteria criteria) throws Exception;
	
	public List<BoardVo> listSearch(SearchCriteria searchCriteria) throws Exception;

	public int countSearchedboards(SearchCriteria searchCriteria) throws Exception;
	
	public void updateViewCnt(int boardNo) throws Exception;
	
	public void insertFileUpload(FileVo fileVo) throws Exception;
	
	
	/**
	 * file read
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<FileVo> selectFileList(BoardVo vo) throws Exception;
	
	

}
