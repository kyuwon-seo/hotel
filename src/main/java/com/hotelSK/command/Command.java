package com.hotelSK.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hotelSK.dao.Mapper;

public interface Command {
	public Map<String,Object> command(HttpServletRequest request,Mapper mapper);
	
}
