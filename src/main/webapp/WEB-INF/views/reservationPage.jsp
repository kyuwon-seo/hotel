<%@page import="com.hotelSK.domain.RoomVO"%>
<%@page import="com.hotelSK.domain.UserVO" %>
<%@page import="com.hotelSK.domain.CommentsVO"%>
<%@page import="java.util.List"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html lang="ko" class="no-js">
<head>

<meta charset="UTF-8"/>

<!-- SEO :: start ::  -->
<style type="text/css">

#reservButton{
  background:skyblue;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.2;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
#reservButton:hover{
  background:#fff;
  color:skyblue;
}
#reservButton:before,#reservButton:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: skyblue;
  transition:400ms ease all;
}
#reservButton:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
#reservButton:hover:before,#reservButton:hover:after{
  width:100%;
  transition:800ms ease all;
}
</style>
<title>방 목록</title>
<script> window.is_html = false; </script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-dependencies.min.ACSHASHd41d8cd98f00b204e9800998ecf8427e.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-bootstrap.min.ACSHASHced7e598cc2edd16e04783c47b666e32.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-global/ko.min.ACSHASHebf3d1515d2e9ddfb483a4306cd67e14.css"
	type="text/css">
	
<link rel="stylesheet" 
	href="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/templates/clientlib-reservation.min.ACSHASHc768397bcbd09fb2c847fd0888bcb648.css" 
	type="text/css">	
	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-base.min.ACSHASH4ccb8d6a02df325874945957ed5dce59.css"
	type="text/css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/templates/clientlib-basic.min.ACSHASH1576af0810aa8322bb9c8e6df0bb3fe9.css"
	type="text/css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-dependencies/library/common.min.ACSHASH36af1d70dc150bdbe701882416c50a5d.js"></script>
</head>
<body>
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
						<% int commentPage = 1; %>
						<div>
								<% if(request.getSession().getAttribute("user")==null) {
									%>
									<ul class="s098__wrapper--1depth">
									
										<li class="item-area">
											<a href="<%=request.getContextPath()%>/login"
											class="s098__text--1depth s098__text--arrow" target="_self"
											data-js="nav__anchor">로그인</a>
										</li>
										<li class="item-area">
											
											<a href="<%=request.getContextPath()%>/joinPage"
											class="s098__text--1depth s098__text--arrow" target="_self"
											data-js="nav__anchor">회원가입</a>
										</li>
										
									</ul>
								<% 	
									}
								%>
								
								<%if((request.getSession().getAttribute("user")!=null) && (!(request.getSession().getAttribute("user_id").equals("admin")))) {
									%>
									<ul class="s098__wrapper--1depth">
								
										<li class="item-area">
											<a href="<%=request.getContextPath()%>/userInfo"
											class="s098__text--1depth s098__text--arrow" target="_self"
											data-js="nav__anchor">내 정보 보기</a>
										</li>
										<li class="item-area">
											<a href="<%=request.getContextPath()%>/logout"
											class="s098__text--1depth s098__text--arrow" target="_self"
											data-js="nav__anchor">로그아웃</a>
										</li>
										<li class="item-area">
											<a href="<%=request.getContextPath()%>/roomSearchPage"
											class="s098__text--1depth s098__text--arrow" target="_self"
											data-js="nav__anchor">호텔 찾기</a>
										</li>
	
									</ul>
	
								<%
									}
								 %>
								
								<%if((request.getSession().getAttribute("user")!=null) && (request.getSession().getAttribute("user_id").equals("admin"))) {
								%>
									<ul class="s098__wrapper--1depth">
								
										<li class="item-area">
											<a href="<%=request.getContextPath()%>/admin"
											class="s098__text--1depth s098__text--arrow" target="_self"
											data-js="nav__anchor">관리자 페이지로</a>
										</li>
										<li class="item-area">
											<a href="<%=request.getContextPath()%>/logout"
											class="s098__text--1depth s098__text--arrow" target="_self"
											data-js="nav__anchor">로그아웃</a>
										</li>
									</ul>
								<%
									}
								 %>
								 
						</div>
					</div>
				</div>
				<script type="text/javascript" src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/components/common/content/common/d113-reservation-step2/clientlibs/data.min.ACSHASHa1606ab37d6c4603afbf2b618f6a2c45.js"></script>
			
		<div class="d113">
			<div class="d113-wrap" data-js="modal-login-group">
        <div class="d113-hotel">
        <% RoomVO roomVO = (RoomVO)request.getSession().getAttribute("roomVO"); %>
        <% 
        	UserVO userVO = (UserVO)request.getSession().getAttribute("user");
        	if(userVO == null){
        		userVO = new UserVO();
        		userVO.setUser_id(" ");
        	}
        %>
		<%
        String start_date = (String)request.getSession().getAttribute("start_date");
		String end_date = (String)request.getSession().getAttribute("end_date");
		String searchKeyword = (String)request.getSession().getAttribute("searchKeyword");
		int roomAdult = (Integer)request.getSession().getAttribute("roomAdult");
		int roomChild = (Integer)request.getSession().getAttribute("roomChild");
		%>
            <ul>
                <li>
                    <span class="d113-hotel__location"><%=searchKeyword%></span>
                </li>
                <li>
                    <span class="d113-hotel__date"><%=start_date%>~<%=end_date%></span>
                </li>
                <li>
                    <span class="d113-hotel__person">객실 1, 성인 <%=roomAdult %>, 어린이 <%=roomChild %></span>
                </li>
            </ul>
        </div>
			</div>
			
			<div>
				<div id="container" class="ly-container">
				<div align="center">
				
				
				<table>
							<thead>
								<tr>
									<th>&nbsp;&nbsp;&nbsp;</th>
									<th>&nbsp;방 번호 &nbsp;&nbsp;&nbsp;&nbsp;</th>
									
									<th>&nbsp;&nbsp;&nbsp;&nbsp;타입 &nbsp;&nbsp;&nbsp;</th>
									<th>&nbsp;&nbsp;침대 타입 &nbsp;&nbsp;&nbsp;&nbsp;</th>
									
									<th>&nbsp;&nbsp;크기 &nbsp;&nbsp;&nbsp;&nbsp;</th>
									<th>&nbsp;&nbsp;뷰 타입&nbsp;&nbsp;&nbsp;&nbsp;</th>

									<th>&nbsp;&nbsp;요금&nbsp;&nbsp;&nbsp;&nbsp;</th>
									<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
																		
								</tr>
							</thead>
							
							<tbody>
							
					
								<tr>
								<%if(searchKeyword.equals("SK호텔서울")){ %>
								<!--스텐다드 트윈, 디럭스 트윈, 디럭스 더블, 스위트  -->
								    <%if(roomVO.getRoom_type().equals("standard twin")) {
								    	%>
									<td><img style="width: 300px;height: 200px;" src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/standardTwin.jpg"></img></td>
								    	
								   <%	
								    }
								    %> 
								    <%if(roomVO.getRoom_type().equals("deluxe twin")) {
								    	%>
									<td><img style="width: 300px;height: 200px;" src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/deluxeTwin.jpg"></img></td>
								    	
								   <%	
								    }
								    %> 
								    <%if(roomVO.getRoom_type().equals("deluxe double")) {
								    	%>
									<td><img style="width: 300px;height: 200px;" src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/deluxeDouble.jpg"></img></td>
								    	
								   <%	
								    }
								    %> 
								    <%if(roomVO.getRoom_type().equals("suite")) {
								    	%>
									<td><img style="width: 300px;height: 200px;" src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/suite.jpg"></img></td>
								    	
								   <%	
								    }
								}
								if(searchKeyword.equals("SK호텔부산")){ %>
								<!--스텐다드 트윈, 디럭스 트윈, 디럭스 더블, 스위트  -->
								    <%if(roomVO.getRoom_type().equals("standard")) {
								    	%>
									<td><img style="width: 300px;height: 200px;" src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/standardTwin.jpg"></img></td>
								    	
								   <%	
								    }
								    %> 
								    <%if(roomVO.getRoom_type().equals("deluxe")) {
								    	%>
									<td><img style="width: 300px;height: 200px;" src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/busanDeluxe.jpg"></img></td>
								    	
								   <%	
								    }
								    if(roomVO.getRoom_type().equals("suite")) {
								    	%>
									<td><img style="width: 300px;height: 200px;" src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/busanSuite.jpg"></img></td>
								    	
								   <%	
								    }
								}
								if(searchKeyword.equals("SK호텔강원")){ %>
								<!--스텐다드 트윈, 디럭스 트윈, 디럭스 더블, 스위트  -->
								    <%if(roomVO.getRoom_type().equals("standard")) {
								    	%>
									<td><img style="width: 300px;height: 200px;" src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/standardTwin.jpg"></img></td>
								    	
								   <%	
								    }
								    %> 
								    <%if(roomVO.getRoom_type().equals("deluxe")) {
								    	%>
									<td><img style="width: 300px;height: 200px;" src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/busanDeluxe.jpg"></img></td>
								    	
								   <%	
								    }
								    if(roomVO.getRoom_type().equals("suite")) {
								    	%>
									<td><img style="width: 300px;height: 200px;" src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/busanSuite.jpg"></img></td>
								    	
								   <%	
								    }
								}
								    %> 
									<td>&nbsp;&nbsp;<%=roomVO.getRoom_no() %>&nbsp;&nbsp;</td>
									
									<td>&nbsp;<%=roomVO.getRoom_type()%>&nbsp;&nbsp;</td>
									<td>&nbsp;&nbsp;<%=roomVO.getRoom_bedType() %>&nbsp;&nbsp;</td>
									
									<td>&nbsp;&nbsp;<%=roomVO.getRoom_size()%>&nbsp;&nbsp;</td>
									<td>&nbsp;&nbsp;<%=roomVO.getRoom_view()%>&nbsp;&nbsp;</td>
									
									<td>&nbsp;&nbsp;<%=roomVO.getRoom_fare()%>&nbsp;&nbsp;</td>
									
									<td>&nbsp;&nbsp;<a id="reservButton" style="border: solid;" href="<%=request.getContextPath()%>/makeReservation?room_id=<%=roomVO.getRoom_id()%>&check_in=<%=start_date%>&check_out=<%=end_date%>&room_type=<%=roomVO.getRoom_type()%>&room_fare=<%=roomVO.getRoom_fare()%>&hotel_name=<%=searchKeyword%>">예약하기</a></td>
								 </tr>
							
							</tbody>
						</table>
						</br></br>
						<div class="container">
						<hr class="my-2">
					
							<form class="form-horizontal" id="commentForm" name="commentForm" method="post">
							<div class="col-xs-10 col-md-offset-1">
								<div class="form-group" align="left">
									<label for="exampleInputName2">Comments :)</label>
								</div>
								<div class="form-group">
									<textarea class="form-control" rows="3" id="comment" name="comment" placeholder="댓글을 입력하세요"></textarea>
								</div>
								
								<div class="form-group" align="right">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="button" id="add_co" name="add_co" class="btn btn-success btn-sm">등록</button>
									</div>
								</div>
								
								<div class="form-group" align="left">
									<table class="table" id="co_list">
										<!-- 스크립트로 댓글내용 채울 거임 -->
									</table>
								</div>
								
								<div class="form-group" align="center">
								<nav>
								  <ul class="pagination" id="page_list">
								  
								  </ul>
								  <input type='hidden' id='startPage' name='startPage' value=1></input>
								  <input type='hidden' id='endPage' name='endPage' value=5></input>
								</nav>
								</div>
								</div>
							</form>
						</div>
						
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
	<!-- 댓글 작성 insert -->
	<script>
	
			function pagenation(data) { //보여질 페이지 번호->data =클릭페이지
				
				var sPage = $('#startPage').val();
				sPage *= 1; //숫자로 변경
				var ePage = $('#endPage').val();
				ePage *= 1;
				console.log("data is "+data+" s : "+sPage+ " e : "+ePage);
				
				if(data == -1){
					if(sPage > 5){
						sPage -= 5;
						var cPage = sPage;  //클릭페이지
					}else{
						sPage = 1;
						var cPage = sPage;
					}
				}else if(data == -2){
					if(ePage > 4){
						sPage += 5;
						var cPage = sPage;  //클릭페이지
					}
				}else{
					var cPage = data;  //클릭페이지
				}
				console.log("after is "+data+" s : "+sPage+ " e : "+ePage);
				//var cPage = data;  //클릭페이지
				getCommentList(cPage);
				
				var html="";
				html += "<li><a href='javascript:void(0);' onclick='pagenation(-1)' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>"			
				for(i=0; i<5; i++){ //번호나열
					p = sPage + i;  // ex)1,2,..5
					if(p == cPage){// 클릭페이지,보여질페이지 활성화 
						html += "<li class='active'> <a href='javascript:void(0);' onclick='pagenation("+p+")'>"+p+"<span class='sr-only'>(current)</span></a></li>"						
					}else{
						html += "<li><a href='javascript:void(0);' onclick='pagenation("+p+")'>"+p+"</a></li>"						
					}
				}//for
				html += "<li> <a href='javascript:void(0);' onclick='pagenation(-2)' aria-label='Next'> <span aria-hidden='true'>&raquo;</span> </a> </li>"

				$('#startPage').val(sPage);
				$("#page_list").html(html);
			}//func

		$("#add_co").click(function() {
			var co_txt = $('#comment').val();
			var room_id = '<%=roomVO.getRoom_id()%>';
			var allData = {
				"co_txt" : co_txt,
				"room_id" : room_id
			};

			$.ajax({
				type : 'GET',
				url : 'addComment',
				dataType : 'json',
				data : allData,
				success : function(data) {
					if (data == 1) { //1은 성공
						$("#comment").val("");
						getCommentList(1);
					}
				},
				error : function(request, status, error) {
					console.log("댓글 insert fail");
					alert('로그인 후 이용해주세요');
				    location.href = 'login';
				}
			});
		})

		/* 초기 페이지 로딩시 댓글 불러오기 */
		window.onload = function() {
			console.log("초기 함수 시작");
			//getCommentList(1);
			pagenation(1);
		};

		/* 댓글 불러오기 */
		function getCommentList(data) {

			var room_id = '<%=roomVO.getRoom_id()%>';
			 var page = data;
			 page *= 1;
			 var clickPage = '<%=commentPage%>';
			 var obj = {"page": page, "room_id": room_id};
			 
			 $.ajax({
		        type:'POST',
		        url : 'commentList',
		        data: JSON.stringify(obj),
		        contentType: "application/json",
		        success: function(data){

		        	console.log(data);
		        	var html="";
		        	var own_id = '<%=userVO.getUser_id()%>';
		        	
		        	if(data.length > 0){
		                for(i=0; i<data.length; i++){
				        	html += "<tr>";
							html += "<td>";
							html += "<h5>"+data[i].user_id+"</br><small>"+data[i].co_txt+"</small></h5>";
							html += "</td>";
							html += "<td align='right'>";
							if( data[i].user_id == own_id ){
								html += "<button>삭제</button>";
							}
							html += "</td>";
							html += "</tr>";
			                }
			        	}else {
			                html += "<tr>";
							html += "<td>";
							html += "<h5><string>등록된 댓글이 없습니다.</strong></h5>";
							html += "</td>";
							html += "</tr>";
			            }
		                
					$("#co_list").html(html);
					
	            },
	        
		        error:function(request,status,error){
		            
		       }
			})
	    }
	
		</script>


	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-dependencies.min.ACSHASH29195619a128b2e1241c11dd7742c127.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-base.min.ACSHASH05c0b73acf24aa6e3d32172351073812.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/templates/clientlib-basic.min.ACSHASHa36a3f3bae2f6ec9a4180690506659dc.js"></script>
</body>
</html>