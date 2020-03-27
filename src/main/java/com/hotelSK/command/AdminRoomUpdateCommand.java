package com.hotelSK.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hotelSK.dao.Mapper;
import com.hotelSK.domain.RoomVO;

public class AdminRoomUpdateCommand implements Command{

	@Override
	public Map<String, Object> command(HttpServletRequest request, Mapper mapper) {
		RoomVO roomVO = new RoomVO();
		HttpSession session = request.getSession();
		RoomVO sessionRoom = (RoomVO)session.getAttribute("roomVO");
	
		int room_id = sessionRoom.getRoom_id();
		String room_no = request.getParameter("room_no");
		String room_type = request.getParameter("room_type");
		String room_bedType = request.getParameter("room_bedType");
		String room_size = request.getParameter("room_size");
		String room_fare = request.getParameter("room_fare");
		String room_view = request.getParameter("room_view");
		String hotel_name = request.getParameter("hotel_name");
		
		
		if (room_no.length() == 0) {
			room_no = sessionRoom.getRoom_no()+"";
		}
		if (room_type.length() == 0) {
			room_type = sessionRoom.getRoom_type();
		}
		if (room_bedType.length() == 0) {
			room_bedType = sessionRoom.getRoom_bedType();
		}
		if (room_size.length() == 0) {
			room_size = sessionRoom.getRoom_size()+"";
		}
		if (room_fare.length() == 0) {
			room_fare = sessionRoom.getRoom_fare()+"";
		}
		if (room_view.length() == 0) {
			room_view = sessionRoom.getRoom_view()+"";
		}
		if (hotel_name.length() == 0) {
			hotel_name = sessionRoom.getHotel_name()+"";
		}
	
		roomVO.setRoom_id(room_id);
		roomVO.setRoom_no(Integer.parseInt(room_no));
		roomVO.setRoom_type(room_type);
		roomVO.setRoom_bedType(room_bedType);
		roomVO.setRoom_size(Integer.parseInt(room_size));
		roomVO.setRoom_fare(Integer.parseInt(room_fare));
		roomVO.setRoom_view(room_view);
		roomVO.setHotel_name(hotel_name);
		
		mapper.roomUpdate(roomVO);
		
		Map<String, Object> map = new HashMap<>();
		map.put("page", "redirect:roomList");
		
		return map;
	}
}