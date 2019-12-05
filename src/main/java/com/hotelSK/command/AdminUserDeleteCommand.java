package com.hotelSK.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hotelSK.dao.Mapper;

public class AdminUserDeleteCommand implements Command {
	@Override
	public Map<String, Object> command(HttpServletRequest request, Mapper mapper) {

		String user_id = request.getParameter("user_id");
		mapper.deleteUser(user_id);
		Map<String, Object> map = new HashMap<>();
		map.put("page", "redirect:userList");

		return map;
	}
}
