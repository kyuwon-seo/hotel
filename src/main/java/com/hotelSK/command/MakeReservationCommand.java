package com.hotelSK.command;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.transaction.annotation.Transactional;

import com.hotelSK.dao.Mapper;
import com.hotelSK.domain.ReservationVO;
import com.hotelSK.domain.RoomStatusVO;
import com.hotelSK.domain.UserVO;

@Transactional
public class MakeReservationCommand implements Command{

	@Override
	public Map<String, Object> command(HttpServletRequest request, Mapper mapper) {
		
		//예약가능한지 다시 조회하고 예약처리하자!
		int room_id = Integer.parseInt(request.getParameter("room_id"));
		String room_type = (String)(request.getParameter("room_type"));
		String room_fare = (String)(request.getParameter("room_fare"));
		String checkIndate = request.getParameter("check_in");
		String checkOutDate = request.getParameter("check_out");
		String hotel_name = (String)(request.getParameter("hotel_name"));
		
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("user");
		ReservationVO reservationVO = new ReservationVO();
		reservationVO.setCheckIn(checkIndate); // 입력 받는 날짜로 변경
		reservationVO.setCheckOut(checkOutDate); // 입력 받는 날짜로 변경
		reservationVO.setPersonal("none");
		reservationVO.setUser_no(userVO.getUser_no());
		reservationVO.setRoom_id(room_id);
		reservationVO.setRoom_type(room_type);
		reservationVO.setRoom_fare(room_fare);
		reservationVO.setHotel_name(hotel_name);
		RoomStatusVO roomStatusVO = new RoomStatusVO();
		roomStatusVO.setRoom_id(room_id);
		roomStatusVO.setRoomsts("reserv");
		
		Date d = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		roomStatusVO.setDate(d.toString());
		
		Map<String, Object> map = new HashMap<String,Object>();
		
		if (mapper.hotelReSearch(reservationVO) == 0) { // 해당 날짜에 예약된 방이 0이면
			mapper.makeReservation(reservationVO);
			mapper.reservStatus(roomStatusVO);
			map.put("page", "redirect:userInfo");
		}else {
			map.put("page", "home");
		}
		
		return map;
	}
}
