package com.hotelSK.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hotelSK.dao.Mapper;
import com.hotelSK.domain.RoomVO;

public class AdminRoomInfoCommand implements Command{

	@Override
	public Map<String, Object> command(HttpServletRequest request, Mapper mapper) {
		Map<String, Object> map = new HashMap<>();
		map.put("page", "adminRoomInfo");
		int room_id = Integer.parseInt(request.getParameter("room_id"));
	
		RoomVO roomVO = mapper.roomInfo(room_id);
		map.put("roomVO", roomVO);
		
		return map;
	}
	

}
