package com.hotelSK.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hotelSK.dao.Mapper;
import com.hotelSK.domain.QnaBoardVO;

public class MakeQnaCommand implements Command{

	@Override
	public Map<String, Object> command(HttpServletRequest request, Mapper mapper) {
		
		QnaBoardVO qnaBoardVO = new QnaBoardVO();
		qnaBoardVO.setUser_id(request.getParameter("id"));
		qnaBoardVO.setUser_password(request.getParameter("password"));
		qnaBoardVO.setBoard_title(request.getParameter("qna_title"));
		qnaBoardVO.setBoard_text(request.getParameter("qna_content"));
		
		mapper.makeQna(qnaBoardVO);
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("result", 1);
		return map;
	}
}