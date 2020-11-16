package com.hotelSK.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hotelSK.dao.Mapper;
import com.hotelSK.domain.QnaBoardVO;

public class DeleteQnaCommand  implements Command{

	@Override
	public Map<String, Object> command(HttpServletRequest request, Mapper mapper) {
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("result", 1);
		return map;
	}
	public void command(HttpServletRequest request, Mapper mapper, int board_no) {
		mapper.deleteQna(board_no);
		
	}
}