package com.hotelSK.command;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hotelSK.dao.Mapper;
import com.hotelSK.domain.QnaBoardVO;

public class QnaCommand implements Command{

	@Override
	public Map<String, Object> command(HttpServletRequest request, Mapper mapper) {
		Map<String, Object> map = new HashMap<>();
		
		//QnaBoardVO qnaBoardVO = new QnaBoardVO();
		List<QnaBoardVO> listQnaBoardVO = new ArrayList<>();
		listQnaBoardVO = mapper.getQna();
		
		map.put("qnaBoardVO", listQnaBoardVO);
		map.put("page", "qnaBoard");
		
		return map;
	}
}