<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html lang="ko" class="no-js">
<head>

<meta charset="UTF-8"/>
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- SEO :: start ::  -->
<meta name="title" content="글로벌 호텔그룹 SK호텔앤리조트 공식 사이트" />

<link rel="icon" type="image/x-icon"
	href="../content/dam/lotte-hotel/common/favicon/LH-favicon.ico" />
<link rel="shortcut icon" type="image/x-icon"
	href="../content/dam/lotte-hotel/common/favicon/LH-favicon.ico" />
<link rel="apple-touch-icon" sizes="114x114"
	href="../content/dam/lotte-hotel/common/favicon/LH-favicon.png" />

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
<script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

</head>
<body id="fouc" class="   aem-notEditmode"
	data-res-type="global-global-global">
	<div class="root responsivegrid wrapper">
		<div class="aem-Grid aem-Grid--12 aem-Grid--default--12 ">
				<div id="header">
					<div class="s098 s098--brand-class" data-gnb-type="global"
						data-js="gnb" data-active-index="0|0|0"
						data-fixed-space-target=".ly-container">
						<div class="s098__top">
							<span class="s098__logo"> <a href="<%=request.getContextPath()%>/"
								target="_self"> <img
									src="${pageContext.request.contextPath}/resources/content/dam/lotte-hotel/common/logo_lotte_global.png"
									alt="로고-SK호텔&amp;리조트">
							</a>
							</span>
						</div>
						<div class="s098__container-wrap">
							<div class="s098__container" data-js="nav-container">
								<div class="s098__nav">
									<nav class="s098__menu" data-js="iScroll" data-scroll-y="true">
										<div class="s098__wrapper">
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
										</div>
									</nav>
								</div>								
								</div>
							</div>
						</div>
					</div>
				</div>
			<div>
				<div>
				
				<div>
					<br/>
					<br/>
					<br/>
					<br/>
				
				</div>
						<div align="center">
							<form action="<%=request.getContextPath()%>/loginUser" method="post">
								아이디 :  <input type="text" name="user_id" placeholder="아이디" style="border: solid;border-color: gray;"/>
								<br/>
								<br/>
								
								비밀번호 :  <input type="password" name="user_password" placeholder="비밀번호" style="border: solid;border-color: gray;"/>
								<br/>
								<br/>
								<input type="submit" value="로그인"></input><br/>
							</form>
						</div>
				<div>
					<br/>
					<br/>
					<br/>
					<br/>
				
				</div>
				</div>
			</div>
			<footer
				class="is-app--hide aem-GridColumn aem-GridColumn--default--12">
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
					<div class="s101">
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
		
	<script type="text/javascript"> 
				if (!wcs_add) var wcs_add={};
				wcs_add["wa"] = "s_51136df6f418";
				if (!_nasa) var _nasa={};
				wcs.inflow();
				wcs_do(_nasa);
		</script>
	<script type="text/javascript">
		    var roosevelt_params = {
		        retargeting_id:'U7EJPz-u7-c_aDQoB8tnIw00',
		        tag_label:'UB5X3MBBQx-R9G4qXoMBzw'
		    };
		</script>
	<script type="text/javascript"
		src="//adimg.daumcdn.net/rt/roosevelt.js" async></script>
	<!-- 다음 리타겟팅 end -->
	<!-- Facebook Pixel Code -->
	<script>
		 !function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
		 n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
		 n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
		 t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
		 document,'script','https://connect.facebook.net/en_US/fbevents.js');
		  fbq('init', "250268092142782");
		  fbq('track', 'PageView');
		 </script>

	<script>
				fbq('init', '1390261887671720');
				fbq('track', 'PageView');
	</script>	

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-dependencies.min.ACSHASH29195619a128b2e1241c11dd7742c127.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-base.min.ACSHASH05c0b73acf24aa6e3d32172351073812.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/templates/clientlib-basic.min.ACSHASHa36a3f3bae2f6ec9a4180690506659dc.js"></script>
	
</body>
</html>