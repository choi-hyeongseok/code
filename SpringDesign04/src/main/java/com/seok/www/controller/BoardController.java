package com.seok.www.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seok.www.common.PageMaker;
import com.seok.www.common.SearchCriteria;
import com.seok.www.domain.BoardVo;
import com.seok.www.domain.FileVo;
import com.seok.www.service.BoardService;

@Controller
@RequestMapping(value = "board")
public class BoardController {

	@Autowired
	BoardService service;

	/**
	 * home
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "")
	String GET(Model model) throws Exception {
		return "redirect:board/list";
	}

	/**
	 * search paging
	 * 
	 * @param searchCriteria
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String boardlistGET(@ModelAttribute("searchCriteria") SearchCriteria searchCriteria, Model model)
			throws Exception {

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(searchCriteria);
		pageMaker.setTotalCount(service.countSearchedboards(searchCriteria));

		model.addAttribute("list", service.listSearch(searchCriteria));
		model.addAttribute("pageMaker", pageMaker);

		return "/board/list";
	}

	/**
	 * 작성 페이지
	 * 
	 * @param model
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	String boardWrite(Model model, BoardVo vo) {
		return "/board/write";
	}

	/**
	 * 작성 업로드
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	String boardRegist(BoardVo vo, @ModelAttribute("fileList") FileVo[] fileList) throws Exception {
//		, FileVo[] fileList
		System.out.println("sdf;lksdf");
		System.out.println("123 "+vo.toString());
		if(fileList != null) {
			//list.forEach(attach -> log.info(attach));
			System.out.println("@@@");
			for(FileVo fvo : fileList) {
				System.out.println(fvo.toString());
			}
		}
		//int res = service.insertBoard(vo, file);
		//System.out.println("작성 완료 건수: " + res);
		return "redirect:/board";
	}

	/**
	 * 게시판 조회 페이지
	 * 
	 * @param boardNo
	 * @param searchCriteria
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "view", method = RequestMethod.GET)
	String boardOne(BoardVo boardVo, @ModelAttribute("searchCriteria") SearchCriteria searchCriteria, Model model)
			throws Exception {

		model.addAttribute("board", service.selectBoardRead(boardVo));
		model.addAttribute("boardFiles", service.selectFileList(boardVo));

		return "/board/view";
	}

	/**
	 * 게시판 수정 페이지
	 * 
	 * @param boardNo
	 * @param searchCriteria
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	String boardModifyGET(BoardVo boardVo, @ModelAttribute("searchCriteria") SearchCriteria searchCriteria, Model model)
			throws Exception {

		System.out.println("bord modify: " + boardVo.getBoardNo());
		model.addAttribute("board", service.selectBoardRead(boardVo));
		model.addAttribute("boardFiles", service.selectFileList(boardVo));
		return "/board/modify";
	}

	/**
	 * 게시판 수정 업데이트
	 * 
	 * @param vo
	 * @param searchCriteria
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	String boardModifyPOST(BoardVo vo, SearchCriteria searchCriteria, RedirectAttributes redirectAttributes)
			throws Exception {
		service.modifyBoard(vo);
		redirectAttributes.addAttribute("page", searchCriteria.getPage());
		redirectAttributes.addAttribute("perPageNum", searchCriteria.getPerPageNum());
		redirectAttributes.addAttribute("searchType", searchCriteria.getSearchType());
		redirectAttributes.addAttribute("keyword", searchCriteria.getKeyword());
		return "redirect:/board/list";
	}

	/**
	 * 게시판 삭제
	 * 
	 * @param boardNo
	 * @param searchCriteria
	 * @param redirectAttributes
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	String boardDelete(@RequestParam("boardNo") int boardNo, SearchCriteria searchCriteria,
			RedirectAttributes redirectAttributes, Model model) throws Exception {
		service.deleteBoard(boardNo);
		redirectAttributes.addAttribute("page", searchCriteria.getPage());
		redirectAttributes.addAttribute("perPageNum", searchCriteria.getPerPageNum());
		redirectAttributes.addAttribute("searchType", searchCriteria.getSearchType());
		redirectAttributes.addAttribute("keyword", searchCriteria.getKeyword());

		return "redirect:/board/list";
	}

}
