package com.hotelSK.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hotelSK.dao.Mapper;
import com.hotelSK.domain.UserVO;

public class JoinCommand implements Command{

	@Override
	public Map<String, Object> command(HttpServletRequest request, Mapper mapper) {
		
		UserVO userVO = new UserVO();
		userVO.setUser_id(request.getParameter("user_id"));
		userVO.setUser_password(request.getParameter("user_pw"));
		userVO.setUser_name(request.getParameter("user_name"));
		userVO.setUser_email(request.getParameter("user_email"));
		userVO.setUser_date(request.getParameter("user_birth"));
		
		mapper.joinUser(userVO);
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("result", 1);
		return map;
	}
}