package com.hotelSK.command;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hotelSK.dao.Mapper;
import com.hotelSK.domain.ReservationVO;
import com.hotelSK.domain.RoomVO;
import com.hotelSK.domain.UserVO;

public class UserInfoCommand implements Command {

	@Override
	public Map<String, Object> command(HttpServletRequest request, Mapper mapper) {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("user");
		
		Map<String, Object> map = new HashMap<>();
		List<ReservationVO> reservationList = mapper.checkReserv(userVO.getUser_no());

		map.put("page", "userInfo");
		map.put("reservationVO", reservationList);
		
		return map;
	}

}
