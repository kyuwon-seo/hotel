package com.hotelSK.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hotelSK.dao.Mapper;
import com.hotelSK.domain.QnaBoardVO;
import com.hotelSK.domain.QnaComentsVO;

public class MakeQnaCoCommand implements Command{

	@Override
	public Map<String, Object> command(HttpServletRequest request, Mapper mapper) {
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("result", 1);
		
		return map;
	}
	public void command(HttpServletRequest request, Mapper mapper, QnaComentsVO vo) {
		
		mapper.makeQnaCo(vo);
	}
	public void replyCommand(HttpServletRequest request, Mapper mapper, QnaComentsVO vo) {
		
		mapper.makeQnaRe(vo);
	}
}