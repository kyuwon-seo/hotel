<%@page import="com.hotelSK.domain.RoomStatusVO"%>
<%@page import="com.hotelSK.domain.ReservationVO"%>
<%@page import="com.hotelSK.domain.UserVO"%>
<%@page import="com.hotelSK.domain.RoomVO" %>
<%@page import="com.hotelSK.domain.QnaBoardVO" %>
<%@page import="java.util.List"%>
<%@ page session="false"%>
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
      text-align: center;
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
							UserVO userVO = (UserVO)request.getSession().getAttribute("user");
							QnaBoardVO qnaBoardVO = (QnaBoardVO)request.getSession().getAttribute("qnaBoardVO");
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

    <div>

   <div class="row">
    <!-- <div class="col-md-2"></div> -->
    <!-- <div class="col-md-8"> -->
        <h2 class="text-center">게시글 수정</h2>
        </br>
        
        <%-- <form action="<%=request.getContextPath()%>/qnaBoard/<%=qnaBoardVO.getBoard_no()%>" 
        name="myform" onsubmit="return send();" method="POST">
        <input type="hidden" name="_method" value="PUT"/> --%>
          <table class="table table-striped">
            <tr>
                <td>작성자</td>
                <td><%=userVO.getUser_id()%></td>
                <input type="hidden" id="id" name="id" value="<%=userVO.getUser_id()%>">
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" id="qna_title" class="form-control" name="qna_title" 
                value="<%=qnaBoardVO.getBoard_title()%>"></td>
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea rows="10" cols="50" id="qna_text" name="qna_text" 
                class="form-control"><%=qnaBoardVO.getBoard_text()%></textarea></td>
            </tr>
          </table>
          <div id="write">
      		<!-- <input type="submit" value="저장" class="btn btn-default"> -->
      		<input type="button" id="saveBtn" value="저장" class="btn btn-default">
      		<a href="<%=request.getContextPath()%>/qnaBoard/<%=qnaBoardVO.getBoard_no()%>" class="btn btn-default">취소</a>
    	  </div>
          
        <!-- </form> -->
    <!-- </div> -->
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

		function send()
		 {
		  if(document.myform.qna_title.value =="" )  //이름 체크
		  { alert("제목을 입력해주세요"); document.myform.qna_title.focus(); return false; }
		  
		  /* if(document.myform.password.value =="")
		  { alert("비밀번호를 입력해주세요."); document.myform.password.focus();  return false; } */

		  if( document.myform.qna_content.value =="" )
		  { alert("내용울 입력해주세요."); document.myform.qna_content.focus();  return false; }
		  alert("게시글이 수정되었습니다.");
		 }
		
		$("#saveBtn").click(function() {
			console.log('saveClick');
			var board_title = $('#qna_title').val();
			var board_text = $('#qna_text').val();
			var board_no = <%=qnaBoardVO.getBoard_no()%>;

			var allData = {
				"board_title" : board_title,
				"board_text" : board_text
			};
			 
			$.ajax({
				type : 'PUT',
				url : '',
				contentType: 'application/json; charset=utf-8',
				dataType : 'json',
				data : JSON.stringify(allData),
				success : function(data) {
					if (data == 1) { //1은 성공
						alert('게시글이 수정되었습니다.');
						location.href = '/controller/qnaBoard/'+board_no;
					}
				},
				error : function(request, status, error) {
					console.log("qna update fail");
					alert('error');
				}
			});
		})
		
		</script>

</body>
</html>