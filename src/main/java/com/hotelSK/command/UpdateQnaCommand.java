package com.hotelSK.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hotelSK.dao.Mapper;
import com.hotelSK.domain.QnaBoardVO;

public class UpdateQnaCommand implements Command{

	@Override
	public Map<String, Object> command(HttpServletRequest request, Mapper mapper) {
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("result", 1);
		return map;
	}
	public void updateQna(HttpServletRequest request, Mapper mapper, int board_no, QnaBoardVO vo) {
		QnaBoardVO qnaBoardVO = new QnaBoardVO();
		qnaBoardVO.setBoard_no(board_no);
		
		qnaBoardVO.setBoard_title(vo.getBoard_title());
		qnaBoardVO.setBoard_text(vo.getBoard_text());
		/*
		qnaBoardVO.setBoard_title(request.getParameter("qna_title"));
		qnaBoardVO.setBoard_text(request.getParameter("qna_text"));
		*/
		mapper.updateQna(qnaBoardVO);
	}
}