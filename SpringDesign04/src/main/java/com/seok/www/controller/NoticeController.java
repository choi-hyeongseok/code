//package com.seok.www.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import com.seok.www.common.Criteria;
//import com.seok.www.common.PageMaker;
//import com.seok.www.common.SearchCriteria;
//import com.seok.www.domain.BoardVo;
//import com.seok.www.service.BoardService;
//
//@Controller
//@RequestMapping(value = "notice")
//public class NoticeController {
//
//	@Autowired
//	BoardService service;
//
//	@RequestMapping(value = "")
//	String GET(Model model) throws Exception {
//		return "redirect:/notice/list";
//	}
//
//	@ResponseBody
//	@RequestMapping(value = "/sendVO")
//	public BoardVo sendVO() throws Exception {
//		BoardVo b = new BoardVo();
//		b.setBoardNo(1);
//		b.setBoardContent("123");
//	    return b;
//	}
//
//	// �Խ��� ����Ʈ
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public String boardlistGET(@ModelAttribute("searchCriteria") SearchCriteria searchCriteria, Model model)
//			throws Exception {
//
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCriteria(searchCriteria);
////		pageMaker.setTotalCount(service.countArticles(searchCriteria));
//		pageMaker.setTotalCount(service.countSearchedboards(searchCriteria));
//
//		model.addAttribute("list", service.listSearch(searchCriteria));
////		model.addAttribute("list", service.listCriteria(searchCriteria));
//		model.addAttribute("pageMaker", pageMaker);
//
//		return "/notice/list";
//	}
//
//	// �Խ��� �ۼ�
//	@RequestMapping(value = "/write", method = RequestMethod.GET)
//	String boardWrite(Model model, BoardVo vo) {
//		return "/notice/write";
//	}
//
//	// �Խ��� �ۼ� ó��
//	@RequestMapping(value = "/write", method = RequestMethod.POST)
//	String boardRegist(BoardVo vo) throws Exception {
//		// ��� �ҷ����� ���� �����
//		int res = service.insertBoard(vo);
//		System.out.println(vo.toString());
//		System.out.println("�Խñ� ��� ���� Ƚ��: " + res);
//
//		return "redirect:/notice/list";
//	}
//
//	// �Խ��� ��ȸ
//	@RequestMapping(value = "view", method = RequestMethod.GET)
//	String boardOne(@RequestParam("boardNo") int boardNo,
//			@ModelAttribute("searchCriteria") SearchCriteria searchCriteria, Model model) throws Exception {
//		// @pathVariable string�� �ƴ� int �� ���� ��� �߸��� ���� ���� ��
//
//		model.addAttribute("board", service.selectBoardRead(boardNo));
//
//		return "/notice/view";
//	}
//
//	// �Խ��� ����
//	@RequestMapping(value = "/modify", method = RequestMethod.GET)
//	String boardModifyGET(@RequestParam("boardNo") int boardNo,
//			@ModelAttribute("searchCriteria") SearchCriteria searchCriteria, Model model) throws Exception {
//		System.out.println("bord modify: " + boardNo);
//		model.addAttribute("board", service.selectBoardRead(boardNo));
//		return "/notice/modify";
//	}
//
//	// �Խ��� ���� ó��
//	@RequestMapping(value = "/modify", method = RequestMethod.POST)
//	String boardModifyPOST(BoardVo vo, SearchCriteria searchCriteria, RedirectAttributes redirectAttributes)
//			throws Exception {
//		service.modifyBoard(vo);
//		redirectAttributes.addAttribute("page", searchCriteria.getPage());
//		redirectAttributes.addAttribute("perPageNum", searchCriteria.getPerPageNum());
//		redirectAttributes.addAttribute("searchType", searchCriteria.getSearchType());
//		redirectAttributes.addAttribute("keyword", searchCriteria.getKeyword());
//		return "redirect:/notice/list";
//	}
//
//	// �Խ��� ���� ó��
//	@RequestMapping(value = "/delete", method = RequestMethod.POST)
//	String boardDelete(@RequestParam("boardNo") int boardNo, SearchCriteria searchCriteria,
//			RedirectAttributes redirectAttributes, Model model) throws Exception {
//		service.deleteBoard(boardNo);
//		redirectAttributes.addAttribute("page", searchCriteria.getPage());
//		redirectAttributes.addAttribute("perPageNum", searchCriteria.getPerPageNum());
//		redirectAttributes.addAttribute("searchType", searchCriteria.getSearchType());
//		redirectAttributes.addAttribute("keyword", searchCriteria.getKeyword());
//
//		return "redirect:/notice/list";
//	}
//
//}
