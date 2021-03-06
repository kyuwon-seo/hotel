<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.hotelSK.domain.RoomVO"%>
<%@page import="com.hotelSK.domain.PageNationVO" %>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="ko" class="no-js">

<head>
<meta charset="UTF-8">

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

<title>객실 정보 업데이트</title>

<script>
        window.is_html = false;
    </script>

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
	href="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-base.min.ACSHASH4ccb8d6a02df325874945957ed5dce59.css"
	type="text/css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/templates/clientlib-basic.min.ACSHASH1576af0810aa8322bb9c8e6df0bb3fe9.css"
	type="text/css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-dependencies/library/common.min.ACSHASH36af1d70dc150bdbe701882416c50a5d.js"></script>
	
<script type="text/javascript">
function roomAdd(){
	location.href="<%=request.getContextPath()%>/roomAddPage";
}
</script>

</head>
<body>
				<%
					PageNationVO pageNo = new PageNationVO(1,1,5);
					session.setAttribute("pageNo", pageNo);
				%>

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
<div align="center">
</br></br></br>

<div class="table-responsive">
<div class="row">
  <div class="col-md-2"></div>
<div class="col-md-8">
<table class="table table-hover">
	<% request.setCharacterEncoding("utf-8"); %>
	<% List<RoomVO> list = (List<RoomVO>)request.getSession().getAttribute("roomList"); %>
	<tbody>
		<tr class="info">
			<!-- <th>방 id</th> -->
			<th>호텔 지점</th>
			<th>객실 번호</th>
			<th>객실 타입</th>
			<th>침대 타입</th>
			<th>크기</th>
			<th>뷰 타입</th>
			<th>요금</th>
			<th></th>
		</tr>
	
		<% for(int i=0; i<list.size(); i++ ) {
			%>
			<tr>
				<%-- <td><%=list.get(i).getRoom_id()%></td> --%>
				<td><%=list.get(i).getHotel_name()%></td>
				<td><%=list.get(i).getRoom_no()%></td>
				<td><%=list.get(i).getRoom_type()%></td>
				<td><%=list.get(i).getRoom_bedType()%></td>
				<td><%=list.get(i).getRoom_size()%></td>
				<td><%=list.get(i).getRoom_view()%></td>
				<td><%=list.get(i).getRoom_fare()%></td>
				<td>
				<span><a id="reservButton" href="<%=request.getContextPath()%>/admin_room_info?room_id=<%=list.get(i).getRoom_id()%>">객실 정보</a></span>
				</td>	
			</tr>	
		<%	
		}
		%>
	</tbody>
	</table>
	</div>
		<div class="col-md-2"></div>
		</div>
		</div>
	
	<br/>
	
	<a><button onclick="roomAdd()">객실 추가</button></a>

	</br></br></br></br></br></br>
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
<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-dependencies.min.ACSHASH29195619a128b2e1241c11dd7742c127.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-base.min.ACSHASH05c0b73acf24aa6e3d32172351073812.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/templates/clientlib-basic.min.ACSHASHa36a3f3bae2f6ec9a4180690506659dc.js"></script>

</body>
</html>