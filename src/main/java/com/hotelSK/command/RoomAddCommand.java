package com.hotelSK.command;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import com.hotelSK.dao.Mapper;
import com.hotelSK.domain.RoomVO;

public class RoomAddCommand implements Command{

	@Override
	public Map<String, Object> command(HttpServletRequest request, Mapper mapper) {
		
		Map<String, Object> map = new HashMap<>();
		RoomVO roomVO = new RoomVO();
		String hotel_name = (String)(request.getParameter("hotel_name"));
		String room_no = request.getParameter("room_no");
		String room_type = request.getParameter("room_type");
		String room_bedType = request.getParameter("room_bedType");
		String room_size = request.getParameter("room_size");
		String room_view = request.getParameter("room_view");
		String room_fare = request.getParameter("room_fare");
		System.out.println("name = " +hotel_name);
		/*roomVO.setRoom_no(Integer.parseInt(request.getParameter("room_no").trim()));
		roomVO.setHotel_name(hotel_name);
		roomVO.setRoom_type(request.getParameter("room_type"));
		roomVO.setRoom_bedType(request.getParameter("room_bedType"));
		roomVO.setRoom_size(Integer.parseInt(request.getParameter("room_size").trim()));
		roomVO.setRoom_view(request.getParameter("room_view"));
		roomVO.setRoom_fare(Integer.parseInt(request.getParameter("room_fare").trim()));*/
		roomVO.setRoom_no(Integer.parseInt(room_no));
		roomVO.setHotel_name(hotel_name);
		roomVO.setRoom_type(room_type);
		roomVO.setRoom_bedType(room_bedType);
		roomVO.setRoom_size(Integer.parseInt(room_size));
		roomVO.setRoom_view(room_view);
		roomVO.setRoom_fare(Integer.parseInt(room_fare));
		
		mapper.addRoom(roomVO);
		map.put("page", "redirect:roomList");
		
		return map;
	}
}