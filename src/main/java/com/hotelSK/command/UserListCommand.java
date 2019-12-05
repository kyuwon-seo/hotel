package com.hotelSK.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hotelSK.dao.Mapper;
import com.hotelSK.domain.UserVO;

public class UserListCommand implements Command{

	@Override
	public Map<String, Object> command(HttpServletRequest request, Mapper mapper) {
		Map<String, Object> map = new HashMap<>();
		
		List<UserVO> userList = mapper.userList();
		map.put("userList", userList);
		map.put("page", "adminUserList");
		
		return map;
	}

}
