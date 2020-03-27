<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<meta name="title" content="글로벌 호텔그룹 SK호텔앤리조트 공식 사이트" />

<link rel="icon" type="image/x-icon"
	href="../content/dam/lotte-hotel/common/favicon/LH-favicon.ico" />
<link rel="shortcut icon" type="image/x-icon"
	href="../content/dam/lotte-hotel/common/favicon/LH-favicon.ico" />
<link rel="apple-touch-icon" sizes="114x114"
	href="../content/dam/lotte-hotel/common/favicon/LH-favicon.png" />


<title>관리자 페이지</title>


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

<script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>
<!-- <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script> -->

<script type="text/javascript">
	function userList() {
		location.href="<%=request.getContextPath()%>/userList";
	}
	function roomList() {
		location.href="<%=request.getContextPath()%>/roomList";
	}
	function reservationList() {
		location.href="<%=request.getContextPath()%>/reservationList";
	}
	function home() {
		location.href="<%=request.getContextPath()%>/";
	}
</script>

</head>
<body id="fouc" class="   aem-notEditmode"
	data-res-type="global-global-global">
	<div>
		<div>
			<div>
				<div class="s098__top">
					<span class="s098__logo"> <a
						href="<%=request.getContextPath()%>/"> <img
							src="${pageContext.request.contextPath}/resources/content/dam/lotte-hotel/common/logo_lotte_global.png"
							alt="로고-SK호텔&amp;리조트">
					</a>
					</span>
				</div>
			</div>
		</div>
  
		<div align="center">

			<br />
			<br />
			<br />
			<br />
			<br />
			<button onclick="userList()">▶ 회원 목록 보기 ◀</button>
			<br /> <br />

			<button onclick="roomList()">▶ 객실 목록 보기 ◀</button>
			<br /> <br />

			<button onclick="reservationList()">▶ 예약 목록 보기 ◀</button>
			<br /> <br />

			<button onclick="home()">▶ 홈으로 ◀</button>
			<br /> <br />
			<div>
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
			</div>
		</div>
	
		
		
	
	
	<footer class="is-app--hide aem-GridColumn aem-GridColumn--default--12">
		<div>
			<div class="s100">
				<div class="s100__inner">
					<div class="s100__mobile">
						<div class="s100-link" style="display: none;">
							<a href="/global/ko/member/login.html"
								class="s100-link__item before-login-show">로그인</a> <a
								href="/global/ko/member/sign-up.html"
								class="s100-link__item before-login-show">회원가입</a> <a href="#"
								class="s100-link__item js-Logout after-login-show">로그아웃</a> <a
								href="/global/ko/member/my-membership.html"
								class="s100-link__item after-login-show">마이 페이지</a> <a
								href="https://itunes.apple.com/kr/app/lotte-hotels-resorts/id1063239345?mt=8"
								class="s100-link__item">APP다운</a>
						</div>
					</div>
					<div class="s100__desktop">
						<div class="s100__info">

							<div class="s100-address">
								<em class="s100-address__item"> ㈜호텔SK</em>
								<address class="s100-address__item">100-721, 서울특별시 중구
									을지로 30</address>
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
			<div class="s101"></div>
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
								href="/global/ko/terms/support/terms-of-use.html" target="_self"
								class="footer-policy__item">이용약관</a> <a
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