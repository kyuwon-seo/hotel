package com.hotelSK.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hotelSK.dao.Mapper;
import com.hotelSK.domain.UserVO;

public class LoginCommand implements Command{

	@Override
	public Map<String, Object> command(HttpServletRequest request, Mapper mapper) {
		String user_id = request.getParameter("user_id");
		String user_password = request.getParameter("user_password");
		
		Map<String, String> loginMap = new HashMap<String,String>();
		loginMap.put("user_id", user_id);
		loginMap.put("user_password", user_password);
		UserVO userVO = mapper.loginUser(loginMap);
		Map<String, Object> map = new HashMap<>();
		map.put("page", "home");
		map.put("user", userVO);
		return map;
	}

	

}
