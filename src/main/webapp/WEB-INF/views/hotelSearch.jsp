<%@page import="com.hotelSK.domain.PageNationVO" %>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html lang="ko" class="no-js">
<head>

<meta charset="UTF-8"/>

<!-- SEO :: start ::  -->

<title>글로벌 호텔그룹 SK호텔앤리조트 공식 사이트</title>
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
								<% if(request.getSession().getAttribute("user") == null) {
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
										<li class="item-area">
											<a href="<%=request.getContextPath()%>/roomSearchPage"
											class="s098__text--1depth s098__text--arrow" target="_self"
											data-js="nav__anchor">호텔 찾기</a>
										</li>
										<li class="item-area"><a
											href="<%=request.getContextPath()%>/qnaBoard"
											class="s098__text--1depth s098__text--arrow" target="_self"
											data-js="nav__anchor">문의하기</a>
										</li>
									</ul>
								<% 	
								}
								%>
								
								<%if(request.getSession().getAttribute("user")!=null) {
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
										<li class="item-area"><a
											href="<%=request.getContextPath()%>/qnaBoard"
											class="s098__text--1depth s098__text--arrow" target="_self"
											data-js="nav__anchor">문의하기</a>
										</li>
	
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
							<form action="<%=request.getContextPath()%>/joinUser" method="post">
								아이디 :  <input type="text" name="user_id" placeholder="아이디" style="border: solid;border-color: gray;"/>
								<br/>
								<br/>
								
								비밀번호 :  <input type="password" name="user_pw"  placeholder="비밀번호" style="border: solid;border-color: gray;"/>
								<br/>
								<br/>
								
								이름 :  <input type="text" name="user_name" placeholder="이름" style="border: solid;border-color: gray;"/>
								<br/>
								<br/>
								
								이메일 :  <input type="email" name="user_email" placeholder="이메일" style="border: solid;border-color: gray;"/>
								<br/>
								<br/>
								
								생년월일 :  <input type="date" name="user_birth" placeholder="생년월일" style="border: solid;border-color: gray;"/>
								<br/>
								<br/>
								
								
								<input type="submit" value="회원가입"></input><br/>
							</form>
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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-dependencies.min.ACSHASH29195619a128b2e1241c11dd7742c127.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-base.min.ACSHASH05c0b73acf24aa6e3d32172351073812.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/templates/clientlib-basic.min.ACSHASHa36a3f3bae2f6ec9a4180690506659dc.js"></script>
</body>
</html>