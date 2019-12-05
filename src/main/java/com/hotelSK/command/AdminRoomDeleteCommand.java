package com.hotelSK.command;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hotelSK.dao.Mapper;
import com.hotelSK.domain.RoomVO;

public class AdminRoomDeleteCommand implements Command{
	@Override
	public Map<String, Object> command(HttpServletRequest request, Mapper mapper) {
		Map<String, Object> map = new HashMap<>();
		int room_id = Integer.parseInt(request.getParameter("room_id"));
		
		mapper.deleteRoom(room_id);
		
		map.put("page", "redirect:roomList");
		
		return map;
	}
}
