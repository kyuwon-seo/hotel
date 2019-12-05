package com.hotelSK.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hotelSK.dao.Mapper;
import com.hotelSK.domain.RoomVO;

public class RoomListCommand implements Command{

	@Override
	public Map<String, Object> command(HttpServletRequest request, Mapper mapper) {
		List<RoomVO> roomList = mapper.roomList();
		Map<String, Object> map = new HashMap<>();
		map.put("page", "adminRoomList");
		map.put("roomList", roomList);
		return map;
	}
}