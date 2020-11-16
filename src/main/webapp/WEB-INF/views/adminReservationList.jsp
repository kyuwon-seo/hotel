<%@page import="com.hotelSK.domain.RoomStatusVO"%>
<%@page import="com.hotelSK.domain.ReservationVO"%>
<%@page import="com.hotelSK.domain.UserVO"%>
<%@page import="com.hotelSK.domain.RoomVO" %>
<%@page import="com.hotelSK.domain.PageNationVO" %>
<%@page import="java.util.List"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko" class="no-js">

<head>
<meta charset="UTF-8"/>
<style type="text/css">

#reservButton {
	background: skyblue;
	color: #fff;
	border: none;
	position: relative;
	height: 60px;
	font-size: 1.2;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

#reservButton:hover {
	background: #fff;
	color: skyblue;
}

#reservButton:before, #reservButton:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: skyblue;
	transition: 400ms ease all;
}

#reservButton:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

#reservButton:hover:before, #reservButton:hover:after {
	width: 100%;
	transition: 800ms ease all;
}
</style>
<title>예약 현황 관리</title>

<script>
        window.is_html = false;
    </script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-dependencies.min.ACSHASHd41d8cd98f00b204e9800998ecf8427e.css"
	type="text/css">

<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-bootstrap.min.ACSHASHced7e598cc2edd16e04783c47b666e32.css"
	type="text/css"> --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-global/ko.min.ACSHASHebf3d1515d2e9ddfb483a4306cd67e14.css"
	type="text/css">
	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-base.min.ACSHASH4ccb8d6a02df325874945957ed5dce59.css"
	type="text/css">
<%--<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/templates/clientlib-basic.min.ACSHASH1576af0810aa8322bb9c8e6df0bb3fe9.css"
	type="text/css"> --%>
	
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	type="text/css"/>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-dependencies/library/common.min.ACSHASH36af1d70dc150bdbe701882416c50a5d.js">
</script>
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js">
	</script>

	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fullcalendar.css"
	type="text/css"/>
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/daygrid.css"
	type="text/css"/>
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/timegrid.css"
	type="text/css"/>

	
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/moment.js">
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/fullcalendar.js">
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/daygrid.js">
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/interaction.js">
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/timegrid.js">
	</script>
	

</head>

<body>
							<% 
							List<ReservationVO> reservationList = (List<ReservationVO>)request.getSession().getAttribute("reservationVO");
							List<UserVO> userList = (List<UserVO>)request.getSession().getAttribute("userList");
							List<RoomVO> roomIdList = (List<RoomVO>)request.getSession().getAttribute("roomVO");
							
							PageNationVO pageNo = new PageNationVO(1,1,5);
							session.setAttribute("pageNo", pageNo);
							%>
							
							<input type="hidden" id="first-room-id" value="<%=roomIdList.get(0).getRoom_id()%>">
							<input type="hidden" id="first-room-no" value="<%=roomIdList.get(0).getRoom_no() %> 객실">
							
							
<!-- make-modal class -->							
<div class="modal fade" id="makeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">비회원 예약</h4>
      </div>
      <div class="modal-body">
        
        <div class="row">
           <div class="col-md-4">
            <label for="recipient-name" class="control-label">객실번호</label>
           </div>
           <div class="col-md-8" id="make-no"> </div>
        </div></br>
        <div class="row">
           <div class="col-md-4">
            <label for="recipient-name" class="control-label">입실일자</label>
           </div>
           <div class="col-md-8" id="make-start">
            <!-- <input type="text" class="form-control" id="recipient-name"> -->
           </div>
        </div>
        <div class="row">
           <div class="col-md-4">
            <label for="recipient-name" class="control-label">퇴실일자</label>
           </div>
           <div class="col-md-8" id="make-end">
            <!-- <input type="text" class="form-control" id="recipient-name1"> -->
           </div>
        </div></br>
        <div class="row">
          <div class="col-md-4">
            <label for="recipient-name" class="control-label">성함</label>
          </div>
          <div class="col-md-8">
            <input type="text" class="form-control" id="make-name" placeholder="홍길동">          
          </div>
        </div>
        <div class="row">
          <div class="col-md-4">
            <label for="recipient-name" class="control-label">연락처</label>
          </div>
          <div class="col-md-8">
            <input type="text" class="form-control" id="make-phone" placeholder="01012341234">
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="makeModalClick">예약하기</button>
      </div>
    </div>
  </div>
</div>  <!-- make-modal class -->

<!-- reserv-modal class -->							
<div class="modal fade" id="reserveModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">예약 정보</h4>
      </div>
      <div class="modal-body">
        <form>
        <div class="row">
           <div class="col-md-4">
            <label for="recipient-name" class="control-label">객실번호</label>
            <input type="hidden" id="reserve-id" value="">
           </div>
           <div class="col-md-8" id="reserve-no"> </div>
        </div></br>
        <div class="row">
           <div class="col-md-4">
            <label for="recipient-name" class="control-label">입실일자</label>
           </div>
           	<div class="col-md-8" id="reserve-start">
           </div>
        </div>
        <div class="row">
           <div class="col-md-4">
            <label for="recipient-name" class="control-label">퇴실일자</label>
           </div>
           	<div class="col-md-8" id="reserve-end">
           </div>
        </div></br>
        <div class="row">
          <div class="col-md-4">
            <label for="recipient-name" class="control-label">성함</label>
          </div>
          	<div class="col-md-8" id="reserve-name">          
          </div>
        </div>
        <div class="row">
          <div class="col-md-4">
            <label for="recipient-name" class="control-label">연락처</label>
          </div>
          	<div class="col-md-8" id="reserve-phone">
          </div>
        </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="delModalClick">예약취소</button>
      </div>
    </div>
  </div>
</div>  <!-- reserv-modal class -->
							

<div>
				<div>
					<div>
						<div class="s098__top">
							<span class="s098__logo"> 
								<a href="<%=request.getContextPath()%>/"> 
									<img src="${pageContext.request.contextPath}/resources/content/dam/lotte-hotel/common/logo_lotte_global.png" alt="로고-SK호텔&amp;리조트">
								</a>
							</span>
						</div>
						<div>
					<ul class="s098__wrapper--1depth">

						<li class="item-area"><a
							href="<%=request.getContextPath()%>/reservationList"
							class="s098__text--1depth s098__text--arrow" target="_self"
							data-js="nav__anchor">예약 관리</a></li>
						<li class="item-area"><a
							href="<%=request.getContextPath()%>/userList"
							class="s098__text--1depth s098__text--arrow" target="_self"
							data-js="nav__anchor">회원 목록</a></li>
						<li class="item-area"><a
							href="<%=request.getContextPath()%>/roomList"
							class="s098__text--1depth s098__text--arrow" target="_self"
							data-js="nav__anchor">객실 목록</a></li>
							<li class="item-area"><a
							href="<%=request.getContextPath()%>/qnaBoard"
							class="s098__text--1depth s098__text--arrow" target="_self"
							data-js="nav__anchor">질문 목록</a></li>
						<li class="item-area"><a
							href="<%=request.getContextPath()%>/home"
							class="s098__text--1depth s098__text--arrow" target="_self"
							data-js="nav__anchor">메인 페이지</a></li>
					</ul>
						</div>
						</div>
						</div>

<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/components/common/content/common/d113-reservation-step2/clientlibs/data.min.ACSHASHa1606ab37d6c4603afbf2b618f6a2c45.js"></script> --%>
			<div>
				<div id="container" class="ly-container">
					<div align="center">
				
				<!-- <div class="table-responsive"> -->
				<div></br>
				<div class="row">
					<div class="col-md-2">
						
   					</div>
   					
				<div class="col-md-8">
						<!-- Single button -->
						<div align='left'>
						<div class="btn-group">
						  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" 
						  	aria-expanded="false" id="dropbtn">객실검색 <span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu" role="menu">
						    <%for(int i=0; i<roomIdList.size(); i++){%>
							<li><button type="button" name="roomBtn" value=<%=roomIdList.get(i).getRoom_id() %>>
								<%=roomIdList.get(i).getRoom_no() %> 객실</button>
							</li>
							<%if(i != (roomIdList.size()-1) ){ %>
								<li class="divider"></li>
							<%}}%>
						  </ul>
						</div></div>
						
						<div id='calendar'></div>
						
					</div>
				<div class="col-md-2"></div>
			</div>
		</div>	<!--  -->
		</br></br></br>
		<!-- <div class="table-responsive"> -->
			<%-- <div>
			<div class="row">
			  <div class="col-md-1"></div>
			<div class="col-md-10">
			<table class="table table-hover">
						<tbody>
								<tr class="info">
									<th>회원</th>
									<th>호텔 지점</th>
									<th>방 타입</th>
									<th>체크인</th>
									<th>체크아웃</th>
									<th>요금</th>
									<th></th>																		
								</tr>
						
							<%for(int i=0 ; i<reservationList.size(); i++) {
								%>
								<tr>
									
									<td><span><%=reservationList.get(i).getRes_id()%></span></td>
									
								<%for(int j=0; j<userList.size(); j++){ 
									if(reservationList.get(i).getUser_no() == userList.get(j).getUser_no()){
								%>
									<td><span><%=userList.get(j).getUser_name() %></span></td>
								<%} } %>
									<!-- <td><span>&nbsp;&nbsp;</span></td> -->
									<td><span><%=reservationList.get(i).getHotel_name()%></span></td>
									<!-- <td><span>&nbsp;&nbsp;</span></td> -->
									<td><span><%=reservationList.get(i).getRoom_type()%></span></td>
									<!-- <td><span>&nbsp;&nbsp;</span></td> -->
									<td><span><%=reservationList.get(i).getCheckIn()%></span></td>
									<!-- <td><span>&nbsp;&nbsp;</span></td> -->
									<td><span><%=reservationList.get(i).getCheckOut()%></span></td>
									<!-- <td><span>&nbsp;&nbsp;</span></td> -->
									<td><span><%=reservationList.get(i).getRoom_fare()%></span></td>
									<!-- <td><span>&nbsp;&nbsp;</span></td> -->
									<td><span><a id="reservButton" href="<%=request.getContextPath()%>/adminCancel2?res_id=<%=reservationList.get(i).getRes_id()%>">예약 취소</a></span></td>
								
								</tr>
							
							<%	
							}
							 %>
							
							</tbody>
						</table>
						</div>
				<div class="col-md-1"></div>
				</div>
				</div> --%> 
		<!-- 									 -->

<div>



</br></br>
</br></br></br></br>
</div>
</div>
</div>
</div>
<footer
				class="is-app--hide aem-GridColumn aem-GridColumn--default--12">
		
				<div>
					<div class="s100">
						<div class="s100__inner">
						
							<div class="s100__desktop">
								<div class="s100__info">
									
									<div class="s100-address">
										<em class="s100-address__item"> ㈜호텔SK</em>
										<address class="s100-address__item">100-721, 서울특별시
											중구 을지로 30</address>
										<p class="s100-address__item"></p>
									</div>
								</div>
								
							</div>
							<div class="footer-address">
								<span class="footer-address__brand"> ㈜호텔SK</span>
								<address>
									<span class="footer-address__title">주소</span> <span>100-721,
										서울특별시 중구 을지로 30</span>
								</address>
							</div>
						</div>
					</div>
				</div>

				<div>
					<div class="s102">
						<div class="footer-info">
							<div class="footer-info--mob">
								<div class="footer-company">
									<span class="footer-company__item"> <span
										class="footer-company__title">대표이사</span> 서규원
									</span> <span class="footer-company__item"> <span
										class="footer-company__title">사업자등록번호</span> 104-81-25980
									</span> <span class="footer-company__item"> <a
										href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1048125980&apv_perm_no="
										target="_blank" title="새창"> <span
											class="footer-company__title">통신판매신고번호</span> 중구02802호
									</a>
									</span>
								</div>
								<div class="footer-policy">
									<a href="/global/ko/terms/support/privacy-policy.html"
										target="_self"
										class="footer-policy__item footer-policy__item--mob">개인정보처리방침</a>

									<a href="/global/ko/terms/support/policy.html" target="_self"
										class="footer-policy__item footer-policy__item--mob">영상정보처리기기운영·관리방침</a>

								</div>
							</div>
							<div class="footer-info--web">
								<div class="footer-policy">
									<a href="/global/ko/terms/support/privacy-policy.html"
										target="_self" class="footer-policy__item">개인정보처리방침</a> <a
										href="/global/ko/terms/support/policy.html" target="_self"
										class="footer-policy__item">영상정보처리기기운영·관리방침</a> <a
										href="/global/ko/terms/support/terms-of-use.html"
										target="_self" class="footer-policy__item">이용약관</a> <a
										href="/global/ko/member/membership/privilege-rewards-terms.html"
										target="_self" class="footer-policy__item">프리빌리지 리워드 회원약관</a>
								</div>
								<div class="footer-company">
									<span class="footer-company__item"> <span
										class="footer-company__title">대표이사</span> 서규원
									</span> <span class="footer-company__item"> <span
										class="footer-company__title">사업자등록번호</span> 104-81-25980
									</span> <span class="footer-company__item"> <a
										href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1048125980&apv_perm_no="
										target="_blank" title="새창"> <span
											class="footer-company__title">통신판매신고번호</span> 중구02802호
									</a>
									</span>
								</div>
							</div>						
						</div>
					</div>
				</div>
			</footer>
			</div>
			
		<script>
		
			var roomBtnNo = $("#first-room-id").val();
			var roomSelect = $("#first-room-no").val();
		
		   document.addEventListener('DOMContentLoaded', function(){
			var calendarEl = document.getElementById('calendar');
			
			  var calendar = new FullCalendar.Calendar(calendarEl, {
			
			    plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
			    defaultView: 'dayGridMonth',
			    selectable: true,
			    defaultDate: new Date(),
			   
			    header: {
			      left: 'today',
			      center: 'title',
			      right: 'prev,next'
			      },
			    dateClick: function(info) {
			    	dayClick(info);
			    	},
			    select: function(info) {
			    	var start = parseStart(info.startStr);
			    	var end = parseEnd(info.endStr);
			    	
			    	if(start<end){ //select가 1박 이상이면
			    		daySelect(info);
			    	}
			    	
			    	},
			      events: {
	  			    url: 'eventList',
	  			    method: 'GET',
	  			    extraParams:function() { // a function that returns an object
	  			      return {
	  			        room_id: roomBtnNo
	  			      }; 
	  			    }
			      }
		      
			  }); // end new fullcalendar
			  calendar.render();

			//객실번호 클릭시 calendar 리프레쉬
			  $("[name=roomBtn]").click(function() {
					roomBtnNo = $(this).val();
					console.log('no', roomBtnNo);
					
					roomSelect = $(this).text();
					$("#dropbtn").html(roomSelect+' <span class="caret"></span>');
					
					calRefresh();
				});
			
			  function dayClick(info){ //예약이 있으면 dialog 없으면 alert
				  var allData = {
						"room_id" : roomBtnNo,
						"check_day" : info.dateStr
					};
				  $.ajax({
						type : 'GET',
						url : 'checkReserve',
						//dataType : 'json',
						data : allData,
				        contentType: "application/json",
						success : function(data) {
								
							if(data == null || data == ""){ //예약이 있으면 null
								alert('1박 이상 선택해주세요.'); //예약이 없으면 경고
							}
							else{
								var chkin = data.checkIn.split(' ');
								var chkout = data.checkOut.split(' ');
								$('#reserveModal').on('show.bs.modal', function (event) {
									$('#reserve-id').val(data.res_id);
									$('#reserve-no').text(roomSelect);
									$('#reserve-start').text(chkin[0]);
									$('#reserve-end').text(chkout[0]);
									$('#reserve-name').text(data.user_name);
									$('#reserve-phone').text(data.user_phone);
								});
								$('#reserveModal').modal('show'); //예약이 있으면 dialog
							}
						},
						error : function(request, status, error) {
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
						
					});
			  }; //end dayClick(info)
			  
			  function daySelect(info){ //start ~ end 날짜에 예약 있으면 alert 없으면 dialog
				  var allData = {
					  "room_id" : roomBtnNo,
					  "start_day" : info.startStr,
					  "end_day" : info.endStr
					  };
				  $.ajax({
						type : 'GET',
						url : 'checkSelect',
						dataType : 'json',
						data : allData,
						success : function(data) {
							
							if (data == 0) { //예약이 없으면 0
								
								$('#makeModal').on('show.bs.modal', function (event) {
									$('#make-no').text(roomSelect);
									$('#make-start').text(info.startStr);
									
									var make_e = parseEnd(info.endStr);
									
									$('#make-end').text(make_e.yyyymmdd());
								});
							
								$('#makeModal').modal('show'); //예약이 없으면 dialog
							}
							else{
								alert('이미 예약된 날짜입니다.'); //예약이 있으면 경고
							}
						},
						error : function(request, status, error) { }
						
					});
			  }
			  $("#delModalClick").click(function(){
				  //reserve-id값 받아서 넘긴다.
				  var allData = {"res_id" : $('#reserve-id').val()};
				  //controller에서 해당 예약건 delete
				  $.ajax({
					  type : 'POST',
						url : 'adminCancel',
						dataType : 'json',
						data : allData,
						success : function(data) {
							if(data == 1){ //1이면 성공
								alert('예약이 취소되었습니다.');
								$('#reserveModal').modal("hide");
								calRefresh();
							}else{
								alert('이미 취소된 예약입니다.');
							}
						},
						error : function(request, status, error) { }
				  })
				  //alert and 모달 close and refetch
			  });
			  
			  $("#makeModalClick").click(function() {
					var allData = {
							  "room_id" : roomBtnNo,
							  "start_day" : $('#make-start').text(),
							  "end_day" : $('#make-end').text(),
							  "u_name" : $('#make-name').val(),
							  "u_phone" : $('#make-phone').val()
							  };
					
						  $.ajax({
								type : 'GET',
								url : 'makeReserveModal',
								dataType : 'json',
								data : allData,
								success : function(data) {
									
									if (data == 1) { //예약완료
										alert('예약이 완료되었습니다.');
										$('#makeModal').modal("hide");
										calRefresh();
									}
									else if(data == 0){
										alert('이미 예약된 객실입니다.'); //예약이 있으면 경고
										$('#makeModal').modal("hide");
									}
									else{
										alert('성함과 연락처를 적어주세요.');
									}
								},
								error : function(request, status, error) { }
								
							});
				});
			  
			  function calRefresh() {
				  calendar.refetchEvents();
				  calendar.render();
			  }
			  
			}); // end document.addEventListener
		   
			function parseStart(str) {
			    var y = str.substr(0, 4);
			    var m = str.substr(5, 2);
			    var d = str.substr(8, 2);
			    
			    return new Date(y,m-1,d);
			}
			function parseEnd(str) {
			    var y = str.substr(0, 4);
			    var m = str.substr(5, 2);
			    var d = str.substr(8, 2);
			    
			    return new Date(y,m-1,d-1);
			}
			Date.prototype.yyyymmdd = function() {
			      var yyyy = this.getFullYear().toString();
			      var mm = (this.getMonth() + 1).toString();
			      var dd = this.getDate().toString();
			      return  yyyy + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + (dd[1] ? dd : "0" + dd[0]);
			  }
			
			
			
			  
		</script>
		
<%-- 	
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-dependencies.min.ACSHASH29195619a128b2e1241c11dd7742c127.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-base.min.ACSHASH05c0b73acf24aa6e3d32172351073812.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/templates/clientlib-basic.min.ACSHASHa36a3f3bae2f6ec9a4180690506659dc.js"></script>
 --%>

</body>
</html>