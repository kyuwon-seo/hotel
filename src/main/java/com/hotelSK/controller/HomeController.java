package com.hotelSK.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotelSK.command.AdminRoomDeleteCommand;
import com.hotelSK.command.AdminRoomInfoCommand;
import com.hotelSK.command.AdminRoomUpdateCommand;
import com.hotelSK.command.AdminUserDeleteCommand;
import com.hotelSK.command.JoinCommand;
import com.hotelSK.command.LoginCommand;
import com.hotelSK.command.MakeReservationCommand;
import com.hotelSK.command.RoomAddCommand;
import com.hotelSK.command.RoomListCommand;
import com.hotelSK.command.UserDeleteCommand;
import com.hotelSK.command.UserInfoCommand;
import com.hotelSK.command.UserListCommand;
import com.hotelSK.dao.Mapper;
import com.hotelSK.domain.CommentVO;
import com.hotelSK.domain.CommentsVO;
import com.hotelSK.domain.ReservationVO;
import com.hotelSK.domain.RoomStatusVO;
import com.hotelSK.domain.RoomVO;
import com.hotelSK.domain.UserVO;

import sun.print.resources.serviceui;

@Controller
public class HomeController {
	
	@Autowired
	private Mapper mapper;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale,Model model) {
		
			
		return "home";
	}
	
	
	@RequestMapping(value="/home")
	public String homePage() {
		System.out.println("workd");
		return "home";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		return "logout";
	}
	
	@RequestMapping(value="idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("userId") String user_id) {
		System.out.println("idCheck 시작");
		return mapper.getIdCheck(user_id);
	}
	
	@RequestMapping(value="addComment", method=RequestMethod.GET)
	@ResponseBody
	public int addComment(HttpServletRequest request, 
			@RequestParam(value="room_id") int room_id, @RequestParam(value="co_txt") String co_txt) {
		System.out.println("start comment insert co_txt is "+co_txt);
		//u_no, r_id, c_txt
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("user");
		CommentsVO commentsVO = new CommentsVO();
		commentsVO.setRoom_id(room_id);
		commentsVO.setCo_txt(co_txt);
		commentsVO.setUser_id(userVO.getUser_id());
		
		if(commentsVO.getCo_txt().equals("")) {
			return 0;
		}
		mapper.addComments(commentsVO);
		
		return 1;
	}
	// 전달할떈 rEsponsbody  받을때는 인자앞에 rEquestbody 넣자.
	@RequestMapping(value="commentList", method=RequestMethod.POST)
	@ResponseBody
	public List<CommentsVO> commentList(@RequestBody HashMap<String, Object> map) {
		System.out.println("commentLIST" + map);

		//String p = (String)map.get("page");
		String r = (String)map.get("room_id");
		//int page = Integer.parseInt(p);
		int page = (Integer)map.get("page");
		int room_id = Integer.parseInt(r);
		page -= 1;
		if(page > 0) page *= 5;
		
		List<CommentsVO> commentsList = mapper.commentList(room_id, page);
		
		return commentsList;
	}
	
	@RequestMapping(value="checkIn")
	public String checkIn(HttpServletRequest request) {
		int res_id = Integer.parseInt(request.getParameter("res_id"));
		mapper.checkInReserv(res_id);
		return "home";
	}
	
	@RequestMapping(value="checkOut")
	public String checkOut(HttpServletRequest request) {
		int res_id = Integer.parseInt(request.getParameter("res_id"));
		mapper.checkOutReserv(res_id);
		ReservationVO reservationVO = mapper.getReservation(res_id);
		int room_id = reservationVO.getRoom_id();
		mapper.roomStatusUpdate(room_id);
		
		return "home";
	}
	
	@RequestMapping(value="/cancel")
	public String cancel(HttpServletRequest request) {
		int res_id = Integer.parseInt(request.getParameter("res_id"));
		mapper.cancelReserv(res_id);
		
		return "redirect:userInfo";
	}
	
	@RequestMapping(value="/adminCancel")
	public String adminCancel(HttpServletRequest request) {
		int res_id = Integer.parseInt(request.getParameter("res_id"));
		mapper.cancelReserv(res_id);
		
		return "redirect:reservationList";
	}
	
	@RequestMapping(value="hotelSearch")
	public String hotelSearch(HttpServletRequest request) {
		String period = request.getParameter("period");
		String searchKeyword = request.getParameter("searchKeyword");
	
		int roomAdult1 = Integer.parseInt(request.getParameter("roomAdult1"));
		int roomAdult2 = Integer.parseInt(request.getParameter("roomAdult2"));
		int roomAdult3 = Integer.parseInt(request.getParameter("roomAdult3"));
		int roomChild1 = Integer.parseInt(request.getParameter("roomChild1"));
		int roomChild2 = Integer.parseInt(request.getParameter("roomChild2"));
		int roomChild3 = Integer.parseInt(request.getParameter("roomChild3"));
		int roomAdult = roomAdult1 + roomAdult2 + roomAdult3;
		int roomChild = roomChild1 + roomChild2 + roomChild3;
		
		String[] periodArr = period.split("~");
		Map<String, String> searchMap = new HashMap<>();
		searchMap.put("start_date", periodArr[0]);
		searchMap.put("end_date", periodArr[1]);
		List<ReservationVO> canNotReservList = mapper.hotelSearch(searchMap);
		List<RoomVO> roomList = mapper.roomList2(searchKeyword);
		
		for (int j = 0; j < roomList.size(); j++) {
			if (canNotReservList.size() > 0) {
				for (int i = 0; i < canNotReservList.size(); i++) {
					if (roomList.get(j).getRoom_id() == canNotReservList.get(i).getRoom_id()) {
						roomList.remove(j);
					}
				}					
			}
			else {
				break;
			}
		}
		HttpSession session = request.getSession();
		session.setAttribute("roomList", roomList);
		session.setAttribute("start_date", periodArr[0]);
		session.setAttribute("end_date", periodArr[1]);
		session.setAttribute("searchKeyword", searchKeyword);
		session.setAttribute("roomAdult", roomAdult);
		session.setAttribute("roomChild", roomChild);
		
		return "roomList";
	}
	
	
	
	@RequestMapping(value="/hotelIntro")
	public String hotelIntro() {
		return "hotelIntro";
	}
	
	@RequestMapping(value="/joinUser", method = RequestMethod.POST)
	public String joinUser(HttpServletRequest request) {
		JoinCommand joinCommand = new JoinCommand();
		joinCommand.command(request, mapper); 
		//int result = (Integer) map.get("result");
		return "home";
	}
	
	@RequestMapping(value="/loginUser", method=RequestMethod.POST)
	public String loginUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LoginCommand loginCommand = new LoginCommand();
		Map<String,Object> map = loginCommand.command(request, mapper);
		
		String page = (String)map.get("page");
		
		UserVO userVO = (UserVO)map.get("user");
		if(userVO == null) {
			System.out.println("fail");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요.'); location.href='login';</script>"); 
			out.flush();
			//return "login";
		}
		if(userVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", userVO);
			session.setAttribute("user_id", userVO.getUser_id());
			session.setAttribute("user_birth", userVO.getUser_date());
			session.setAttribute("user_email", userVO.getUser_email());
			session.setAttribute("user_name", userVO.getUser_name());
		}
		return page;
	}
	
	@RequestMapping(value="/checkReservation")
	public String checkReservation() {
		return "home";
	}
	
	@RequestMapping(value = "/reservationList")
	public String reservationList(HttpServletRequest request) {
		List<ReservationVO> reservationList = mapper.reservationList();
		List<UserVO> userList = mapper.userList();
		
		HttpSession session = request.getSession();
		session.setAttribute("reservationVO", reservationList);
		session.setAttribute("userList", userList);
		
		return "adminReservationList";
	}
	
	@RequestMapping(value = "/roomAddPage")
	public String roomAddPage() {
		return "roomAddPage";
	}
	
	@RequestMapping(value="/admin_room_info")
	public String room_info(HttpServletRequest request) {
		AdminRoomInfoCommand adminRoomInfoCommand = new AdminRoomInfoCommand();
		Map<String, Object> map = adminRoomInfoCommand.command(request, mapper);
		String page = (String)map.get("page");
		RoomVO roomVO = (RoomVO)map.get("roomVO");
		HttpSession session = request.getSession();
		session.setAttribute("roomVO", roomVO);
		return page;
	}
	
	@RequestMapping(value="/adminRoomDelete")
	public String adminRoomDelete(HttpServletRequest request) {
		AdminRoomDeleteCommand adminRoomDeleteCommand = new AdminRoomDeleteCommand();
		Map<String, Object> map = adminRoomDeleteCommand.command(request, mapper);
		String page = (String)map.get("page");
		
		return page;
	}
	
	@RequestMapping(value="/roomAdd",method=RequestMethod.POST)
	public String roomAdd(HttpServletRequest request) {
		
		RoomAddCommand roomAddCommand = new RoomAddCommand();
		Map<String, Object> map = roomAddCommand.command(request, mapper);
		String page = (String)map.get("page");
		
		return page;
	}
	
	@RequestMapping(value="/roomUpdate")
	public String roomUpdate(HttpServletRequest request) {
		
		AdminRoomUpdateCommand adminRoomUpdateCommand = new AdminRoomUpdateCommand();
		Map<String, Object> map = adminRoomUpdateCommand.command(request, mapper); 
		String page = (String)map.get("page");
		return page;
	}
	
	@RequestMapping(value = "/roomList")
	public String roomList(HttpServletRequest request) {
		
		RoomListCommand roomListCommand = new RoomListCommand();
		Map<String, Object> map = roomListCommand.command(request, mapper);
		String page = (String) map.get("page");
		List<RoomVO> roomList = (List<RoomVO>)map.get("roomList"); 
		HttpSession session = request.getSession();
		session.setAttribute("roomList", roomList);
		return page;
	}
	
	@RequestMapping(value = "/userList")
	public String userList(HttpServletRequest request) {
		UserListCommand userListCommand = new UserListCommand();
		Map<String, Object> map = userListCommand.command(request, mapper);
		String page = (String)map.get("page");
		List<UserVO> userList = (List<UserVO>)map.get("userList");
		HttpSession session = request.getSession();
		session.setAttribute("userList", userList);
		return page;
	}
	
	
	@RequestMapping(value="/admin")
	public String admin() {
		return "admin";
	}
	
	@RequestMapping(value="userDelete")
	public String userDelete(HttpServletRequest request) {
		UserDeleteCommand userDeleteCommand = new UserDeleteCommand();
		Map<String, Object> map = userDeleteCommand.command(request, mapper);
		String page = (String)map.get("page");
		return page;
	}
	
	@RequestMapping(value="adminUserDelete")
	public String adminUserDelete(HttpServletRequest request) {
		AdminUserDeleteCommand adminUserDeleteCommand = new AdminUserDeleteCommand();
		Map<String, Object> map = adminUserDeleteCommand.command(request, mapper);
		String page = (String)map.get("page");
		return page;
	}
	
	@RequestMapping(value="/makeReservation")
	public String makeReservation(HttpServletRequest request, HttpServletResponse response) throws IOException{
		/*if(request.getSession().getAttribute("user")==null) {  //인터셉터 처리헀음
			return "login";
		}*/
		
		MakeReservationCommand makeReservationCommand = new MakeReservationCommand();
		Map<String, Object> map = makeReservationCommand.command(request, mapper);
		String page = (String)map.get("page");
		if(page.equals("home")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 예약된 객실입니다.'); location.href='home';</script>"); 
			out.flush();
		}
		/*
		int room_id = Integer.parseInt(request.getParameter("room_id"));
		String room_type = (String)(request.getParameter("room_type"));
		String room_fare = (String)(request.getParameter("room_fare"));
		String checkIndate = request.getParameter("check_in");
		String checkOutDate = request.getParameter("check_out");
		String hotel_name = (String)(request.getParameter("hotel_name"));
		
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("user");
		ReservationVO reservationVO = new ReservationVO();
		reservationVO.setCheckIn(checkIndate); // 입력 받는 날짜로 변경
		reservationVO.setCheckOut(checkOutDate); // 입력 받는 날짜로 변경
		reservationVO.setPersonal("none");
		reservationVO.setUser_no(userVO.getUser_no());
		reservationVO.setRoom_id(room_id);
		reservationVO.setRoom_type(room_type);
		reservationVO.setRoom_fare(room_fare);
		reservationVO.setHotel_name(hotel_name);
		RoomStatusVO roomStatusVO = new RoomStatusVO();
		roomStatusVO.setRoom_id(room_id);
		roomStatusVO.setRoomsts("reserv");
		
		Date d = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		roomStatusVO.setDate(d.toString());
		
		mapper.makeReservation(reservationVO);
		mapper.reservStatus(roomStatusVO);*/
		
		return page;
	}
	
	
	@RequestMapping(value="/reservationPage")
	public String reservationPage(HttpServletRequest request) {
		int room_id = Integer.parseInt(request.getParameter("room_id"));
		RoomVO roomVO = mapper.roomInfo(room_id);
		HttpSession session = request.getSession();
		session.setAttribute("roomVO", roomVO);	
		
		return "reservationPage";
	}

	@RequestMapping(value="/userInfo")
	public String userInfo(HttpServletRequest request) {
		UserInfoCommand userInfoCommand = new UserInfoCommand();
		Map<String, Object> map = userInfoCommand.command(request, mapper);
		String page = (String)map.get("page");
		List<ReservationVO> reservationList = (List<ReservationVO>)map.get("reservationVO");
		
		HttpSession session = request.getSession();
		session.setAttribute("reservationVO", reservationList);
		return page;
	}
	
	@RequestMapping(value="/joinPage")
	public String joinPage() {
		return "join";
	}
	
	@RequestMapping(value="/roomSearchPage")
	public String roomSearch(HttpServletRequest request) {
		List<RoomVO> roomList = mapper.roomList();
		HttpSession session = request.getSession();
		session.setAttribute("roomList", roomList);
		
		return "roomList";
	}
	
	
	//챗봇 만들어보자 ~!
	/*@RequestMapping(value="/keyboard", method=RequestMethod.GET)
	public String keyboard() {
		
		System.out.println("/keyboard");
		
		JSONObject jobjBtn = new JSONObject();
		ArrayList<String> btns = new ArrayList<>();
		
		btns.add("SK호텔 홈페이지 찾아가기");
		btns.add("체크인, 체크아웃 문의");
		btns.add("찾아오시는 길");
		
		jobjBtn.put("type", "buttons");
		jobjBtn.put("buttons", btns);
		
		return jobjBtn.toJSONString();
	}
	
	@RequestMapping(value="/message", method=RequestMethod.POST, headers="Accept=application/json")
	@ResponseBody
	public String message(@RequestBody JSONObject resObj) {
		System.out.println("/message");
		System.out.println(resObj.toJSONString());
		
		String content;
		content = (String) resObj.get("content");
		JSONObject jobjRes = new JSONObject();
		JSONObject jobjText = new JSONObject();
		JSONObject jobjmesBtn = new JSONObject();
		JSONObject jobjBtn = new JSONObject();
		
		ArrayList<String> btns = new ArrayList<>();
		btns.add("테스트");
		jobjBtn.put("type", "buttons");
		jobjBtn.put("buttons", btns);
		
		if(content.contains("SK호텔 홈페이지 찾아가기")) {
			jobjText.put("text", "반가워요! 아래의 링크를 통해\r\n" + 
					"SK호텔을 방문해주세요 ^^");
			jobjmesBtn.put("label", "SK호텔 홈페이지");
			jobjmesBtn.put("url", "http://18.221.244.234:8080/hotel/");
		}
		else if(content.contains("체크인, 체크아웃 문의")) {
			jobjText.put("text", "저희 SK호텔은 PM 2:00 부터 \r\n" + 
					"입실 가능하며 익일 AM 11:00 에 퇴실을 기준으로 하고 있습니다.\r\n" + 
					"아래의 링크를 통하여 로그인 후 객실 예약이 가능합니다.");
			jobjmesBtn.put("label", "예약하기");
			jobjmesBtn.put("url", "http://18.221.244.234:8080/hotel/");
		}
		else if(content.contains("찾아오시는 길")) {
			jobjText.put("text", "저희 SK호텔로 찾아오시는 \r\n" + 
					"길은 100-721, 서울특별시 중구 \r\n" + 
					"을지로 30 이며 2호선 을지로 \r\n" + 
					"입구역 7번, 8번 출구를 이용하여 찾아오실 수 있습니다.");
			
			jobjmesBtn.put("url", "/resources/content/dam/lotte-hotel/common/logo_lotte_global.png");
		}
		jobjRes.put("message", jobjText);
		jobjRes.put("keyboard", jobjBtn);
		
		return jobjRes.toJSONString();
	}*/
	
	
	
}
