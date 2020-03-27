package com.hotelSK.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.hotelSK.domain.CommentsVO;
import com.hotelSK.domain.NotUserVO;
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
	public List<RoomVO> roomIdList();
	public int getIdCheck(String user_id);
	public UserVO getIdCheckk(String user_id);
	public void checkInReserv(int res_id);
	public void checkOutReserv(int res_id);
	public ReservationVO getReservation(int res_id);
	public void roomStatusUpdate(int room_id);
	public void cancelReserv(int res_id);
	public List<ReservationVO> hotelSearch(Map<String, String> searchMap);
	public ReservationVO checkReserveOk(Map<String, Object> checkInfo);
	public int hotelReSearch(ReservationVO reservationVO);
	public int hotelReSearch2(ReservationVO reservationVO);
	public void addComments(CommentsVO commentsVO);
	public void makeNotUser(NotUserVO notUserVO);
	public NotUserVO notUser(int res_id);
	public int notUserNo(ReservationVO reservationVO);
	public UserVO getUser(int user_no);
	public List<CommentsVO> commentList(@Param("room_id")int room_id, @Param("page")int page);
	
	public List<Map> testlist(@Param("room_id")int room_id);
	
	
}