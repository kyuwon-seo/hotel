<%@page import="com.hotelSK.domain.RoomStatusVO"%>
<%@page import="com.hotelSK.domain.ReservationVO"%>
<%@page import="com.hotelSK.domain.UserVO"%>
<%@page import="com.hotelSK.domain.RoomVO" %>
<%@page import="com.hotelSK.domain.QnaBoardVO" %>
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
<!--  -->
    #list {
      text-align: center;
    }
   
    #write {
      text-align: right;
    }
     
    /* Bootstrap 수정 */
    .table > thead {
      background-color: #b3c6ff;
    }
    /* .table > thead > tr > th {
      text-align: center;
    } */
    .table-hover > tbody > tr:hover {
      background-color: #e6ecff;
    }
    /* .table > tbody > tr > td {
      text-align: center;
    } */
    .table > tbody > tr > #title {
      text-align: left;
    }
     
    div > #paging {
      text-align: center;
    }
<!--  -->


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
							List<UserVO> userList = (List<UserVO>)request.getSession().getAttribute("userList");
							List<QnaBoardVO> qnaBoardList = (List<QnaBoardVO>)request.getSession().getAttribute("qnaBoardList");
							PageNationVO pageNo = (PageNationVO)session.getAttribute("pageNo");
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
					<%
						if (request.getSession().getAttribute("user") == null) {
					%>
					<ul class="s098__wrapper--1depth">

						<li class="item-area"><a
							href="<%=request.getContextPath()%>/login"
							class="s098__text--1depth s098__text--arrow" target="_self"
							data-js="nav__anchor">로그인</a></li>
						<li class="item-area"><a
							href="<%=request.getContextPath()%>/joinPage"
							class="s098__text--1depth s098__text--arrow" target="_self"
							data-js="nav__anchor">회원가입</a></li>
						<li class="item-area"><a
							href="<%=request.getContextPath()%>/qnaBoard"
							class="s098__text--1depth s098__text--arrow" target="_self"
							data-js="nav__anchor">문의하기</a></li>

					</ul>
					<%
						}
					%>

					<%
						if ((request.getSession().getAttribute("user") != null)
								&& (!(request.getSession().getAttribute("user_id").equals("admin")))) {
					%>
					<ul class="s098__wrapper--1depth">

						<li class="item-area"><a
							href="<%=request.getContextPath()%>/userInfo"
							class="s098__text--1depth s098__text--arrow" target="_self"
							data-js="nav__anchor">내 정보 보기</a></li>
						<li class="item-area"><a
							href="<%=request.getContextPath()%>/qnaBoard"
							class="s098__text--1depth s098__text--arrow" target="_self"
							data-js="nav__anchor">문의하기</a></li>
						<li class="item-area"><a
							href="<%=request.getContextPath()%>/logout"
							class="s098__text--1depth s098__text--arrow" target="_self"
							data-js="nav__anchor">로그아웃</a></li>

					</ul>

					<%
						}
					%>

					<%
						if ((request.getSession().getAttribute("user") != null)
								&& (request.getSession().getAttribute("user_id").equals("admin"))) {
					%>
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
					<%
						}
					%>
				</div>
						
						</div>
						</div>

			<div>
				<div id="container" class="ly-container">
					<div align="center">
				
				<!-- <div class="table-responsive"> -->
				<div></br>
				<div class="row">
					<div class="col-md-2">
						
   					</div>
   					
				<div class="col-md-8">
						<div id="container">
<!-- sadfsadf -->
   
    <div id="list">
      <h2>Q&A</h2>
    </div>
     
    <div id="write">
      <a href="<%=request.getContextPath()%>/qnaBoard/write"
      	class="btn btn-default">글쓰기</a>
    </div>
     
    <div>
      <!-- <table class="table table-striped table-bordered table-hover"> -->
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <th width="5%">번호</th>
            <th width="60%">제목</th>
            <th width="10%">작성자</th>
            <th width="15%">작성일</th>
          </tr>
        </thead>
        <tbody>
        	<%-- <%for(int i=0; i<qnaBoardList.size(); i++){ %> --%>
        	<%for(int i=0; i<10; i++){ %>
        		<tr>
        			<td><%=qnaBoardList.get(i).getBoard_no()%></td>
        		<%if(qnaBoardList.get(i).getCnt() == 0){ %>
        			<td><a href="<%=request.getContextPath()%>/qnaBoard/<%=qnaBoardList.get(i).getBoard_no()%>">
        					<%=qnaBoardList.get(i).getBoard_title()%></a></td>
        		<%}else{ %>
        			<td><a href="<%=request.getContextPath()%>/qnaBoard/<%=qnaBoardList.get(i).getBoard_no()%>">
        					<%=qnaBoardList.get(i).getBoard_title()+" ["+qnaBoardList.get(i).getCnt()+"]"%></a></td>
        		<%} %>
        			<td><%=qnaBoardList.get(i).getUser_id()%></td>
        			<td><%=qnaBoardList.get(i).getBoard_date()%></td>
        		</tr>
        	<%} %>
        </tbody>
      </table>
       
      <!-- Paging 처리 -->
      <div class="text-center">
        <nav>
		  <ul class="pagination" id="page_list">
		  
			  <li>
			  	<a onclick='pagenation(-1)' aria-label='Previous'>
			  		<span aria-hidden='true'>&laquo;</span>
			  	</a>
			  </li>		
			
			  <li class='active'> 
			  	<a onclick='pagenation("+p+")'><%=pageNo.getClickPage()%>
			  		<span class='sr-only'>(current)</span>
			  	</a>
			  </li>						
			<%for(int i=pageNo.getStartPage(); i<pageNo.getEndPage(); i++){ %>  
			  <li><a onclick='pagenation(<%=i+1%>)'><%=i+1%></a></li>
			<%} %>
			  <li> <a onclick='pagenation(-2)' aria-label='Next'> <span aria-hidden='true'>&raquo;</span> </a> </li>

		  </ul>
		  <input type='hidden' id='startPage' name='startPage' value=<%=pageNo.getStartPage() %>></input>
		  <input type='hidden' id='endPage' name='endPage' value=<%=pageNo.getEndPage() %>></input>
		</nav>
      	
      </div>
    </div>
  </div> 
<!-- sadfsadf -->  			
					</div>
				<div class="col-md-2"></div>
			</div>
		</div>	<!--  -->
		</br></br></br>
		

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

	function pagenation(data) { //보여질 페이지 번호->data =클릭페이지
		
		var startPage = $('#startPage').val();
		startPage *= 1; //숫자로 변경
		var endPage = $('#endPage').val();
		endPage *= 1;
		console.log("data is "+data+" s : "+startPage+ " e : "+endPage);
		
		if(data == -1){
			if(startPage > 5){
				startPage -= 5;
				var clickPage = startPage;  //클릭페이지
			}else{
				startPage = 1;
				var clickPage = startPage;
			}
		}else if(data == -2){
			if(endPage > 4){
				startPage += 5;
				var clickPage = startPage;  //클릭페이지
			}
		}else{
			var clickPage = data;  //클릭페이지
		}
		console.log("after is "+data+" s : "+startPage+ " e : "+endPage);
		var pageNationVO = {
				clickPage: clickPage,
				startPage: startPage,
				endPage: endPage
		};
		sessionStorage.setItem("pageNationVO", pageNationVO);
		location.href='qnaBoard';
	
	}//func

		
</script>

</body>
</html>