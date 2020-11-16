package com.hotelSK.command;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hotelSK.dao.Mapper;
import com.hotelSK.domain.QnaBoardVO;
import com.hotelSK.domain.QnaComentsVO;

public class DetailQnaCommand implements Command{

	@Override
	public Map<String, Object> command(HttpServletRequest request, Mapper mapper) {
		Map<String, Object> map = new HashMap<>();
		map.put("page", "qnaBoard");
		
		return map;
	}
	public QnaBoardVO detailQna(int board_no, Mapper mapper) {
		
		QnaBoardVO qnaBoardVO = new QnaBoardVO();
		qnaBoardVO = mapper.getQnaDetail(board_no);
		
		return qnaBoardVO;
	}
	public List<QnaComentsVO> detailQnaCo(int board_no, Mapper mapper) {
		
		List<QnaComentsVO> qnaComentsList = new ArrayList<>();
		qnaComentsList = mapper.getQnaCo(board_no);
		
		return qnaComentsList;
	}
}