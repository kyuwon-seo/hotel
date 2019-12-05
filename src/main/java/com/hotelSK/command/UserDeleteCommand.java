package com.hotelSK.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hotelSK.dao.Mapper;

public class UserDeleteCommand implements Command{

	@Override
	public Map<String, Object> command(HttpServletRequest request, Mapper mapper) {
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		//String user_id = request.getParameter("user_id");
		mapper.deleteUser(user_id);
		Map<String, Object> map = new HashMap<>();
		map.put("page", "home");
		session.invalidate();
		return map;
	}
}
