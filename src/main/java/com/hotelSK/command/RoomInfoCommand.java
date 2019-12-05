package com.hotelSK.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hotelSK.dao.Mapper;

public class RoomInfoCommand implements Command{

	@Override
	public Map<String, Object> command(HttpServletRequest request, Mapper mapper) {
		Map<String, Object> map = new HashMap<>();
		map.put("page", "roomInfo");
		
		// TODO Auto-generated method stub
		return map;
	}
}