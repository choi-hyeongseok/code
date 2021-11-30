package com.seok.www.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.seok.www.common.Criteria;
import com.seok.www.common.PageMaker;
import com.seok.www.domain.ReplyVo;
import com.seok.www.service.ReplyService;

@RestController
@Controller
@RequestMapping(value = "replies")
public class ReplyController {

	@Autowired
	ReplyService service;

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVo replyVO) {
		ResponseEntity<String> entity = null;
		try {
			service.insertReply(replyVO);
			entity = new ResponseEntity<>("regSuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/all/{boardNo}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVo>> list(@PathVariable("boardNo") int boardNo) {
		ResponseEntity<List<ReplyVo>> entity = null;
		try {
			entity = new ResponseEntity<>(service.selectList(boardNo), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/{replyNo}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update(@PathVariable("replyNo") int replyNo, @RequestBody ReplyVo replyVO) {
		ResponseEntity<String> entity = null;
		try {
			replyVO.setReplyNo(replyNo);
			service.updateReply(replyVO);
			entity = new ResponseEntity<>("modSuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/{replyNo}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("replyNo") int replyNo, @RequestBody ReplyVo replyVO) {
		ResponseEntity<String> entity = null;
		try {
			replyVO.setReplyNo(replyNo);
			System.out.println("@@@@@@@@@" + replyVO.toString());
			service.deleteReply(replyVO);
			System.out.println("404040");
			entity = new ResponseEntity<>("delSuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/{boardNo}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPaging(@PathVariable("boardNo") int boardNo,
			@PathVariable("page") int page) {
		ResponseEntity<Map<String, Object>> entity = null;
		try {

			Criteria criteria = new Criteria();
			criteria.setPage(page);

			List<ReplyVo> replies = service.getRepliesPaging(boardNo, criteria);
			int repliesCount = service.countReplies(boardNo);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCriteria(criteria);
			pageMaker.setTotalCount(repliesCount);

			Map<String, Object> map = new HashMap<>();
			map.put("replies", replies);
			map.put("pageMaker", pageMaker);

			entity = new ResponseEntity<>(map, HttpStatus.OK);

		} catch (Exception e) {

			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.OK);

		}

		return entity;
	}

}
