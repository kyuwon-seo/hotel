package com.hotelSK.dao;

import java.util.List;
import java.util.Map;

import com.hotelSK.domain.ReservationVO;
import com.hotelSK.domain.RoomStatusVO;
import com.hotelSK.domain.RoomVO;
import com.hotelSK.domain.UserVO;

public interface Mapper {
	public UserVO loginUser(Map<String, String> loginMap);
	public void joinUser(UserVO userVO);
	public List<ReservationVO> checkReserv(int user_no);
	public void deleteUser(String user_id);
	public void deleteRoom(int room_id);
	public List<UserVO> userList();
	public List<RoomVO> roomList();
	public List<RoomVO> roomList2(String searchKeyword);
	public void addRoom(RoomVO roomVO);
	public RoomVO roomInfo(int room_id);
	public void roomUpdate(RoomVO roomVO);
	public void makeReservation(ReservationVO reservationVO);
	public void reservStatus(RoomStatusVO roomStatusVO);
	public List<RoomStatusVO> roomStatusList();
	public List<ReservationVO> reservationList();
	public UserVO getIdCheck(String id);
	public void checkInReserv(int res_id);
	public void checkOutReserv(int res_id);
	public ReservationVO getReservation(int res_id);
	public void roomStatusUpdate(int room_id);
	public void cancelReserv(int res_id);
	public List<ReservationVO> hotelSearch(Map<String, String> searchMap);

	
	
}