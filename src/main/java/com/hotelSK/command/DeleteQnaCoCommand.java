package com.hotelSK.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hotelSK.dao.Mapper;

public class DeleteQnaCoCommand implements Command{

	@Override
	public Map<String, Object> command(HttpServletRequest request, Mapper mapper) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public void command(HttpServletRequest request, Mapper mapper, int co_no) {
		
		mapper.deleteQnaCo(co_no);;
	}
}
