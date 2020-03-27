package com.hotelSK.command;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotelSK.dao.Mapper;
import com.hotelSK.domain.NotUserVO;
import com.hotelSK.domain.ReservationVO;
import com.hotelSK.domain.RoomStatusVO;
import com.hotelSK.domain.RoomVO;
import com.hotelSK.domain.UserVO;

@Transactional("transactionManager")
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
		
		if ( (mapper.hotelReSearch(reservationVO)==0) && (mapper.hotelReSearch2(reservationVO)==0) ) { // 해당 날짜에 예약된 방이 0이면
			mapper.makeReservation(reservationVO);
			mapper.reservStatus(roomStatusVO);
			map.put("page", "redirect:userInfo");
		}else {
			map.put("page", "home");
		}
		
		return map;
	}
	
	public int make(HttpServletRequest request, Mapper mapper, 
			int room_id, String checkIn, String checkOut, String nuser_name, String nuser_phone) {
		
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("user");
		if(userVO==null) {
			System.out.println("세션정보 x 로그인필요");
			
			return 0;
		}
		
		//비회원 예약 정보
		ReservationVO reservationVO = new ReservationVO();
		RoomVO roomVO = mapper.roomInfo(room_id);
	
		reservationVO.setRoom_type(roomVO.getRoom_type());
		reservationVO.setRoom_fare( Integer.toString(roomVO.getRoom_fare()) );
		reservationVO.setHotel_name(roomVO.getHotel_name());
		reservationVO.setUser_no(userVO.getUser_no());
		reservationVO.setRoom_id(room_id);
		reservationVO.setCheckIn(checkIn); // 입력 받는 날짜로 변경
		reservationVO.setCheckOut(checkOut);
		reservationVO.setPersonal("none");
		
		int cnt = mapper.hotelReSearch(reservationVO);
		int cnt2 = mapper.hotelReSearch2(reservationVO);
		if( cnt!=0 || cnt2!=0 ) { //예약 불가능하면
			return 0;
		}
		
		mapper.makeReservation(reservationVO);
		
		//비회원 정보
		NotUserVO notUserVO = new NotUserVO();
		int r_id = mapper.notUserNo(reservationVO);
		
		notUserVO.setRes_id(r_id);
		notUserVO.setNuser_name(nuser_name);
		notUserVO.setNuser_phone(nuser_phone);
		
		mapper.makeNotUser(notUserVO);

		return 1;
	}
}
