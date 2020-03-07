package com.hotelSK.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hotelSK.dao.Mapper;
import com.hotelSK.domain.UserVO;

public class UserIdChkCommand implements Command{

	@Override
	public Map<String, Object> command(HttpServletRequest request, Mapper mapper) {
		String id = request.getParameter("id");
		UserVO userVO= mapper.getIdCheckk(id);
		String result = "";
		if (userVO == null) {
			result = "";
		}
		else {
			result = "";
		}
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("result", result);
		
		return map;
	}
	

}
