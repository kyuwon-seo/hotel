<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html lang="ko" class="no-js">
<head>

<meta charset="UTF-8" />

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
	
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>

<body>
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
							data-js="nav__anchor">관리자 페이지</a></li>
						<li class="item-area"><a
							href="<%=request.getContextPath()%>/logout"
							class="s098__text--1depth s098__text--arrow" target="_self"
							data-js="nav__anchor">로그아웃</a></li>
					</ul>
					<%
						}
					%>


				</div>
			</div>
		</div>

		<div>
			<div id="container" class="ly-container">
				<div
					class="responsivegrid aem-GridColumn aem-GridColumn--default--12">
					<div class="aem-Grid aem-Grid--12 aem-Grid--default--12 ">
						<div
							class="s001-main-image-or-video aem-GridColumn aem-GridColumn--default--12">
							<div class="s001  common-spacing-bottom--l">
								<div class="s001__inner">
									<div class="s001-slider__wrap">
										<div class="s001-slider">
											<div class="s001-slider__item">
												<p class="s001-slider__content s001-slider__content--white">
													<span class="s001-slider__eyebrow"></span> <strong
														class="s001-slider__headline"></strong> <strong
														class="s001-slider__subcopy"></strong>
												</p>
												<div class="s001-slider__background">
													<img
														src="${pageContext.request.contextPath}/resources/content/dam/lotte-hotel/global/main/180809-1-2000-mai-global.jpg.thumb.1920.1920.jpg"
														alt="SK호텔글로벌-메인-메인이미지-뉴욕펠리스사진" class="slick-retina"
														data-mobile="/content/dam/lotte-hotel/global/main/180809-1-2000-mai-global.jpg.thumb.768.768.jpg"
														data-tablet="/content/dam/lotte-hotel/global/main/180809-1-2000-mai-global.jpg.thumb.1440.1440.jpg"
														data-web="/content/dam/lotte-hotel/global/main/180809-1-2000-mai-global.jpg.thumb.1920.1920.jpg" />
												</div>
											</div>

											<div class="s001-slider__item">
												<p class="s001-slider__content s001-slider__content--white">
													<span class="s001-slider__eyebrow"></span> <strong
														class="s001-slider__headline"></strong> <strong
														class="s001-slider__subcopy"></strong>
												</p>
												<div class="s001-slider__background">
													<img
														src="${pageContext.request.contextPath}/resources/content/dam/lotte-hotel/global/main/180809-2-2000-mai-global.jpg.thumb.768.768.jpg"
														alt="SK호텔글로벌-메인-메인이미지-수영장사진" class="slick-retina"
														data-mobile="/content/dam/lotte-hotel/global/main/180809-2-2000-mai-global.jpg.thumb.768.768.jpg"
														data-tablet="/content/dam/lotte-hotel/global/main/180809-2-2000-mai-global.jpg.thumb.1440.1440.jpg"
														data-web="/content/dam/lotte-hotel/global/main/180809-2-2000-mai-global.jpg.thumb.1920.1920.jpg" />
												</div>
											</div>
											<div class="s001-slider__item">
												<p class="s001-slider__content s001-slider__content--white">
													<span class="s001-slider__eyebrow"></span> <strong
														class="s001-slider__headline"></strong> <strong
														class="s001-slider__subcopy"></strong>
												</p>
												<div class="s001-slider__background">
													<img
														src="${pageContext.request.contextPath}/resources/content/dam/lotte-hotel/global/main/180809-3-2000-mai-global.jpg.thumb.768.768.jpg"
														alt="SK호텔글로벌-메인-메인이미지-호텔입구사진" class="slick-retina"
														data-mobile="/content/dam/lotte-hotel/global/main/180809-3-2000-mai-global.jpg.thumb.768.768.jpg"
														data-tablet="/content/dam/lotte-hotel/global/main/180809-3-2000-mai-global.jpg.thumb.1440.1440.jpg"
														data-web="/content/dam/lotte-hotel/global/main/180809-3-2000-mai-global.jpg.thumb.1920.1920.jpg" />
												</div>
											</div>
										</div>
									</div>

									<div class="s001-form">
										<script type="text/javascript"
											src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/components/common/content/common/d001-g-reservation-bar/clientlibs/data.min.ACSHASHf63e303b369763f5da1d1c7a71021fc2.js"></script>
										<!-- <div class="d001-g-reservation-bar">
												<div class="d001" data-type="basic">
													<form action="/global/ko.data.html" method="get"
														id="gReservationBarForm" name="gReservationBarForm">
														<input type="hidden" name="countryCode" value="" /> 
														<input type="hidden" name="cityCode" value="" /> 
														<input type="hidden" name="primaryLangID" value="K" /> 
														<input type="hidden" name="langCode" value="ko" />
													</form>
												</div>
											</div> -->


										<div class="d001-g-reservation-bar  ">
											<div class="d001" data-type="basic">
												<form action="<%=request.getContextPath()%>/hotelSearch"
													method="get" id="gReservationBarForm"
													name="gReservationBarForm">
													<input type="hidden" name="countryCode" value="" /> <input
														type="hidden" name="cityCode" value="" /> <input
														type="hidden" name="primaryLangID" value="K" /> <input
														type="hidden" name="langCode" value="ko" />
													<fieldset>
														<legend class="screen--out">호텔 조건 검색</legend>
														<h1 class="d001__title">SK 호텔</h1>
														<div class="d001-search">
															<div class="d001-search__item hotel" data-hotel="wrap">
																<label for="reservation-hotel" class="hotel__title">방문
																	도시 또는 호텔명</label> <input type="hidden" name="hotelCode"
																	data-form="hotel" value="" data-startdate="2018-10-30"
																	data-enddate="2018-12-29">

																<div class="input">
																	<div class="input__wrap input__wrap--text">
																		<span class="input__placeholder"
																			id="phd-reservation-hotel">SK호텔을 찾아보세요</span> <input
																			name="searchKeyword" type="text"
																			class="o-input o-input--text" id="reservation-hotel"
																			title="방문 도시 또는 호텔명"
																			aria-describedby="phd-reservation-hotel"
																			data-hotel="field">
																		<button type="button" class="input__removetext">삭제</button>
																	</div>
																</div>
																<div class="d001-search__panel" data-hotel="panel">
																	<div class="d001-search__layer d001-hotel"
																		data-hotel="list">
																		<ul class="d001-hotel__country" data-js="megaMenu">
																			<li class="d001-hotel__item" data-js="megaMenu__item">
																				<a href="#" class="d001-hotel__anchor is-active"
																				data-js="megaMenu__anchor">한국</a>
																				<div class="d001-hotel__list" data-js="scroll">
																					<ul>
																						<li><a href="#" class="d001-hotel__anchor"
																							data-code="kr|LTSG|2|1|/seoul-signiel/ko.html"
																							data-name="SK호텔서울">SK호텔서울</a></li>

																						<li><a href="#" class="d001-hotel__anchor"
																							data-code="kr|LTSE|2|1|/seoul-hotel/ko.html"
																							data-name="SK호텔부산">SK호텔부산</a></li>

																						<li><a href="#" class="d001-hotel__anchor"
																							data-code="kr|LTWO|2|1|/world-hotel/ko.html"
																							data-name="SK호텔강원">SK호텔강원</a></li>

																						<li><a href="#" class="d001-hotel__anchor"
																							data-code="kr|LTJE|4|3|/jeju-hotel/ko.html"
																							data-name="SK호텔제주">SK호텔제주</a></li>
																					</ul>
																				</div>
																			</li>

																			<li class="d001-hotel__item" data-js="megaMenu__item">
																				<a href="#" class="d001-hotel__anchor"
																				data-js="megaMenu__anchor">미국</a>
																				<div class="d001-hotel__list" data-js="scroll">
																					<ul>
																						<!-- <li>
									                                                            <a href="#" class="d001-hotel__anchor" data-code="us|LTGU|2|2|/guam-hotel/ko.html" data-name="롯데호텔괌">롯데호텔괌</a>
									                                                        </li>
									                                                    
									                                                        <li>
									                                                            <a href="#" class="d001-hotel__anchor" data-code="us|LTNY|2|2|https://www.lottenypalace.com/" data-name="롯데뉴욕팰리스">롯데뉴욕팰리스</a>
									                                                        </li> -->
																					</ul>
																				</div>
																			</li>

																			<li class="d001-hotel__item" data-js="megaMenu__item">
																				<a href="#" class="d001-hotel__anchor"
																				data-js="megaMenu__anchor">러시아</a>
																				<div class="d001-hotel__list" data-js="scroll">
																					<ul>
																						<!-- <li>
									                                                            <a href="#" class="d001-hotel__anchor" data-code="ru|LTMO|3|2|/moscow-hotel/ko.html" data-name="롯데호텔모스크바">롯데호텔모스크바</a>
									                                                        </li>
									                                                    
									                                                        <li>
									                                                            <a href="#" class="d001-hotel__anchor" data-code="ru|LTSP|3|2|/stpetersburg-hotel/ko.html" data-name="롯데호텔상트페테르부르크">롯데호텔상트페테르부르크</a>
									                                                        </li>
									                                                    
									                                                        <li>
									                                                            <a href="#" class="d001-hotel__anchor" data-code="ru|LTSM|3|2|/samara-hotel/ko.html" data-name="롯데호텔사마라">롯데호텔사마라</a>
									                                                        </li>
									                                                    
									                                                        <li>
									                                                            <a href="#" class="d001-hotel__anchor" data-code="ru|LTMV|3|2|http://www.lottehotelvladivostok.com/ko/" data-name="롯데호텔블라디보스토크">롯데호텔블라디보스토크</a>
									                                                        </li> -->
																					</ul>
																				</div>
																			</li>

																			<li class="d001-hotel__item" data-js="megaMenu__item">
																				<a href="#" class="d001-hotel__anchor"
																				data-js="megaMenu__anchor">일본</a>
																				<div class="d001-hotel__list" data-js="scroll">
																					<ul>
																						<!-- <li>
									                                                            <a href="#" class="d001-hotel__anchor" data-code="jp|LTAR|4|2|/arai-resort/ko.html" data-name="롯데아라이리조트">롯데아라이리조트</a>
									                                                        </li> -->
																					</ul>
																				</div>
																			</li>

																			<li class="d001-hotel__item" data-js="megaMenu__item">
																				<a href="#" class="d001-hotel__anchor"
																				data-js="megaMenu__anchor">베트남</a>
																				<div class="d001-hotel__list" data-js="scroll">
																					<ul>
																						<!--     <li>
									                                                            <a href="#" class="d001-hotel__anchor" data-code="vn|LTHA|3|2|/hanoi-hotel/ko.html" data-name="롯데호텔하노이">롯데호텔하노이</a>
									                                                        </li>
									                                                    
									                                                        <li>
									                                                            <a href="#" class="d001-hotel__anchor" data-code="vn|LTHO|2|2|/saigon-hotel/ko.html" data-name="롯데레전드호텔사이공">롯데레전드호텔사이공</a>
									                                                        </li> -->
																					</ul>
																				</div>
																			</li>

																		</ul>
																	</div>
																	<div class="d001-search__layer d001-keyword"
																		data-hotel="keyword" data-js="scroll">
																		<div class="d001-keyword__wrap">
																			<strong class="d001-keyword__title">나라 및 도시</strong>
																			<div class="d001-keyword__result"
																				data-hotel="keyword-map">
																				<!--
									                                        검색결과 없음
									                                    -->
																				<p class="d001-keyword__empty">검색된 지역이 없습니다.</p>
																				<!--
									                                        //검색결과 없음
									                                    -->
																				<!--
									                                        검색결과 있음
									                                    -->
																				<ul>
																					<li class="d001-keyword__item"><a href="#"
																						class="d001-keyword__anchor"
																						data-code="hotel_3_1,hotel_3_2"
																						data-name="대한민국, 서울">대한민국, <mark>서울</mark>(10)
																					</a></li>
																				</ul>
																			</div>
																			<!--
									                                    //검색결과 있음
									                                -->
																			<strong class="d001-keyword__title">호텔명</strong>
																			<div class="d001-keyword__result"
																				data-hotel="keyword-hotel">
																				<!--
									                                        검색결과 없음
									                                    -->
																				<p class="d001-keyword__empty">검색된 호텔이 없습니다.</p>
																				<!--
									                                        //검색결과 없음
									                                    -->
																				<!--
									                                        검색결과 있음
									                                    -->
																				<ul>
																					<li class="d001-keyword__item"><a href="#"
																						class="d001-keyword__anchor" data-code="hotel_1_1"
																						data-name="롯데호텔서울">롯데호텔 <mark>서울</mark>
																					</a></li>
																					<li class="d001-keyword__item"><a href="#"
																						class="d001-keyword__anchor" data-code="hotel_1_2"
																						data-name="시그니엘서울">시그니엘 <mark>서울</mark>
																					</a></li>
																					<li class="d001-keyword__item"><a href="#"
																						class="d001-keyword__anchor" data-code="hotel_1_3"
																						data-name="시그니엘서울">시그니엘 <mark>서울</mark>
																					</a></li>
																					<li class="d001-keyword__item"><a href="#"
																						class="d001-keyword__anchor" data-code="hotel_1_4"
																						data-name="시그니엘서울">시그니엘 <mark>서울</mark>
																					</a></li>
																				</ul>
																				<!--
									                                        //검색결과 있음
									                                    -->
																			</div>
																		</div>
																	</div>
																	<!--
									                            //layer : 키워드 입력 시
									                        -->
																</div>
															</div>
															<!--
									                    //호텔 검색
									                -->
															<!--
									                    달력 검색
									                -->
															<div class="d001-search__item date" data-period="wrap">
																<div class="date__col">
																	<strong class="date__title">체크인</strong> <span
																		class="date__day" data-period="start-date">28</span> <span
																		class="date__month"> <span
																		data-period="start-month">5월</span> <br> <span
																		data-period="start-day">화요일</span>
																	</span>
																</div>
																<span class="date__stay"> <span
																	data-period="night">1</span>박
																</span>
																<div class="date__col">
																	<strong class="date__title">체크아웃</strong> <span
																		class="date__day" data-period="end-date">29</span> <span
																		class="date__month"> <span
																		data-period="end-month">5월</span> <br> <span
																		data-period="end-day">화요일</span>
																	</span>
																</div>
																<input type="hidden" name="period" data-form="period"
																	value="2018-10-30~2018-10-31"> <a href="#"
																	data-period="handler" title="레이어 팝업"
																	class="date__anchor"> <span class="screen--out">체크인
																		체크아웃 기간을 선택해주세요</span>
																</a>

																<div data-period="panel"
																	class="d001-search__layer d001-calendar">
																	<div class="calendar" data-inline="true"
																		data-language="ko" data-format="YYYY-MM-DD"
																		data-period="calendar" data-title="달력"
																		aria-live="polite" aria-atomic="true">
																		<input type="hidden">
																	</div>
																	<button type="button" data-period="panel__close"
																		class="d001-calendar__close">
																		<span class="screen--out">레이어 닫기</span>
																	</button>
																</div>
															</div>
															<!--
									                    // 달력 검색
									                -->
															<!--
									                    객실 및 인원 선택
									                -->
															<div class="d001-search__item person" data-people="wrap">
																<div class="person__col">
																	<strong class="person__text">객실수</strong> <span
																		class="person__number" data-people="view-room">1</span>
																</div>
																<div class="person__col">
																	<strong class="person__text">성인</strong> <span
																		class="person__number" data-people="view-adult">1</span>
																</div>
																<div class="person__col">
																	<a href="#" class="person__text person__text--children"
																		title="레이어 팝업" data-modal="children">어린이</a> <span
																		class="person__number" data-people="view-children">0</span>
																	<!--
									        modal size class
									
									        c-modal--size1  // 소
									        c-modal--size2  // 중
									        c-modal--size3  // 대
									
									        예 ) <section id="id" class="c-modal ## 모달사이즈 클래스 ##" ~~~ >
									     -->
																	<section
																		class="c-modal d001-modal-children c-modal--size1"
																		tabindex="-1" role="dialog"
																		aria-labelledby="unique_id-1">
																		<div class="c-modal__wrap" role="document">
																			<header class="c-modal__head">
																				<h2 class="c-modal__title" id="unique_id-1">어린이
																					연령정보</h2>
																			</header>
																			<div class="c-modal__body" tabindex="-1">
																				<div class="c-modal__scroll">
																					<div class="c-modal__content">
																						<div class="d001-children">
																							<table>
																								<caption>
																									<span class="screen--out">어린이 연령정보 목록</span>
																								</caption>
																								<tbody>
																									<tr>
																										<th scope="row">어린이 <span
																											class="d001-children__age">( 만3~5세 )</span>
																										</th>
																										<td>롯데아라이리조트</td>
																									</tr>
																									<tr>
																										<th scope="row">어린이 <span
																											class="d001-children__age">( 만4~12세 )</span>
																										</th>
																										<td><strong class="d001-children__title">한국</strong>
																											시그니엘서울 / 롯데호텔서울 / 롯데호텔월드 / 롯데호텔부산 / 롯데호텔제주 /
																											롯데호텔울산 / L7명동 / L7강남 / L7홍대 / 롯데시티호텔마포 /
																											롯데시티호텔김포공항 / 롯데시티호텔제주 / 롯데시티호텔대전 / 롯데시티호텔구로 /
																											롯데시티호텔울산 / 롯데시티호텔명동 <strong
																											class="d001-children__title">해외</strong>
																											롯데레전드호텔사이공 / 롯데호텔하노이 / 롯데호텔양곤 / 롯데뉴욕팰리스 /
																											롯데호텔모스크바 / 롯데호텔상트페테르부르크 / 롯데호텔사마라 /
																											롯데호텔블라디보스토크 / 롯데시티호텔타슈켄트팰리스</td>
																									</tr>
																									<tr>
																										<th scope="row">어린이 <span
																											class="d001-children__age">( 만5~11세 )</span>
																										</th>
																										<td>롯데호텔괌</td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																				</div>
																			</div>
																			<div class="c-modal__foot"></div>
																			<button type="button" class="c-modal__close"
																				data-dismiss="cancel">
																				<span class="screen--out">레이어 닫기</span>
																			</button>
																		</div>
																	</section>
																</div>
																<!--
									                        [D] a태그의 data-pattern="" i18n처리
									                    -->
																<a href="#" class="person__anchor" data-people="handler"
																	title="레이어 팝업"> <span class="screen--out">객실
																		및 인원 선택</span>
																</a>
																<!--
									                        [D] 객실,성인,어린이
									                    -->
																<input type="hidden" name="people" data-form="people"
																	value="">
																<div class="d001-search__layer d001-person"
																	data-people="panel">
																	<div class="d001-person__head">
																		<strong class="d001-person__title">객실 - 투숙인원</strong>
																		<div class="d001-person__info">
																			<span class="d001-person__info-item">선택가능 객실
																				3개</span>
																		</div>
																	</div>
																	<ul class="d001-person__list" data-people-group="basic">
																		<li class="d001-person__item" data-people="item">
																			<em class="d001-person__subtitle"> <span>객실
																					1</span>
																		</em>
																			<div class="d001-person__count">
																				<div class="c-counter" data-js="counter">
																					<button type="button"
																						class="c-counter__button c-counter__button--decrease"
																						data-js="counter__decrease"></button>
																					<input name="roomAdult1" type="number"
																						class="c-counter__field" data-js="counter__number"
																						value="0" min="1" max="2" title="성인"
																						readonly="readonly"> <span
																						class="c-counter__view" data-js="counter__view"
																						aria-hidden="true"></span>
																					<button type="button"
																						class="c-counter__button c-counter__button--increase"
																						data-js="counter__increase"></button>
																				</div>
																			</div>
																			<div class="d001-person__count">
																				<div class="c-counter" data-js="counter">
																					<button type="button"
																						class="c-counter__button c-counter__button--decrease"
																						data-js="counter__decrease"></button>
																					<input name="roomChild1" type="number"
																						class="c-counter__field" data-js="counter__number"
																						value="0" min="0" max="1" title="어린이"
																						readonly="readonly"> <span
																						class="c-counter__view" data-js="counter__view"
																						aria-hidden="true"></span>
																					<button type="button"
																						class="c-counter__button c-counter__button--increase"
																						data-js="counter__increase"></button>
																				</div>
																			</div>
																		</li>
																		<li class="d001-person__item" data-people="item">
																			<em class="d001-person__subtitle"> <span>객실
																					2</span>
																		</em>
																			<div class="d001-person__count">
																				<div class="c-counter" data-js="counter">
																					<button type="button"
																						class="c-counter__button c-counter__button--decrease"
																						data-js="counter__decrease"></button>
																					<input name="roomAdult2" type="number"
																						class="c-counter__field" data-js="counter__number"
																						value="0" min="0" max="2" title="성인"
																						readonly="readonly"> <span
																						class="c-counter__view" data-js="counter__view"
																						aria-hidden="true"></span>
																					<button type="button"
																						class="c-counter__button c-counter__button--increase"
																						data-js="counter__increase"></button>
																				</div>
																			</div>
																			<div class="d001-person__count">
																				<div class="c-counter" data-js="counter">
																					<button type="button"
																						class="c-counter__button c-counter__button--decrease"
																						data-js="counter__decrease"></button>
																					<input name="roomChild2" type="number"
																						class="c-counter__field" data-js="counter__number"
																						value="0" min="0" max="1" title="어린이"
																						readonly="readonly"> <span
																						class="c-counter__view" data-js="counter__view"
																						aria-hidden="true"></span>
																					<button type="button"
																						class="c-counter__button c-counter__button--increase"
																						data-js="counter__increase"></button>
																				</div>
																			</div>
																		</li>
																		<li class="d001-person__item" data-people="item">
																			<em class="d001-person__subtitle"> <span>객실
																					3</span>
																		</em>
																			<div class="d001-person__count">
																				<div class="c-counter" data-js="counter">
																					<button type="button"
																						class="c-counter__button c-counter__button--decrease"
																						data-js="counter__decrease"></button>
																					<input name="roomAdult3" type="number"
																						class="c-counter__field" data-js="counter__number"
																						value="0" min="0" max="2" title="성인"
																						readonly="readonly"> <span
																						class="c-counter__view" data-js="counter__view"
																						aria-hidden="true"></span>
																					<button type="button"
																						class="c-counter__button c-counter__button--increase"
																						data-js="counter__increase"></button>
																				</div>
																			</div>
																			<div class="d001-person__count">
																				<div class="c-counter" data-js="counter">
																					<button type="button"
																						class="c-counter__button c-counter__button--decrease"
																						data-js="counter__decrease"></button>
																					<input name="roomChild3" type="number"
																						class="c-counter__field" data-js="counter__number"
																						value="0" min="0" max="1" title="어린이"
																						readonly="readonly"> <span
																						class="c-counter__view" data-js="counter__view"
																						aria-hidden="true"></span>
																					<button type="button"
																						class="c-counter__button c-counter__button--increase"
																						data-js="counter__increase"></button>
																				</div>
																			</div>
																		</li>
																	</ul>
																	<ul class="d001-person__list" data-people-group="email">
																		<li class="d006-person__item" data-people="item">
																			<em class="d006-person__subtitle"><span>객실</span></em>
																			<div class="d006-person__count">
																				<div class="c-counter" data-js="counter">
																					<button type="button"
																						class="c-counter__button c-counter__button--decrease"
																						data-js="counter__decrease"></button>
																					<input name="roomCnt" type="number"
																						class="c-counter__field" data-js="counter__number"
																						value="1" min="1" max="3" title="객실"
																						readonly="readonly"> <span
																						class="c-counter__view" data-js="counter__view"
																						aria-hidden="true"></span>
																					<button type="button"
																						class="c-counter__button c-counter__button--increase"
																						data-js="counter__increase"></button>
																				</div>
																			</div>
																		</li>
																		<li class="d006-person__item" data-people="item">
																			<em class="d006-person__subtitle"><span>성인</span></em>
																			<div class="d006-person__count">
																				<div class="c-counter" data-js="counter">
																					<button type="button"
																						class="c-counter__button c-counter__button--decrease"
																						data-js="counter__decrease"></button>
																					<input name="adultCnt" type="number"
																						class="c-counter__field" data-js="counter__number"
																						value="1" min="1" title="성인" readonly="readonly">
																					<span class="c-counter__view"
																						data-js="counter__view" aria-hidden="true"></span>
																					<button type="button"
																						class="c-counter__button c-counter__button--increase"
																						data-js="counter__increase"></button>
																				</div>
																			</div>
																		</li>
																		<li class="d006-person__item" data-people="item">
																			<em class="d006-person__subtitle"><span>어린이</span></em>
																			<div class="d006-person__count">
																				<div class="c-counter" data-js="counter">
																					<button type="button"
																						class="c-counter__button c-counter__button--decrease"
																						data-js="counter__decrease"></button>
																					<input name="childCnt" type="number"
																						class="c-counter__field" data-js="counter__number"
																						value="0" min="0" title="어린이" readonly="readonly">
																					<span class="c-counter__view"
																						data-js="counter__view" aria-hidden="true"></span>
																					<button type="button"
																						class="c-counter__button c-counter__button--increase"
																						data-js="counter__increase"></button>
																				</div>
																			</div>
																		</li>
																	</ul>
																	<button type="button" class="d001-person__close"
																		data-people="panel__close">
																		<span class="screen--out">레이어 닫기</span>
																	</button>
																</div>
															</div>
															<!--
									                    //객실 및 인원 선택
									                -->
														</div>
														<!--
									                프로모션코드 : 호텔 입력 전
									            -->
														<div
															class="d001-promotion d001-promotion--default is-active"
															data-promotion="wrap-map">
															<a href="#" class="d001-promotion__anchor" title="레이어 팝업"
																data-promotion="handler">프로모션 코드</a>
															<div class="d001-promotion__panel" data-promotion="panel">
																<p class="d001-promotion__info" tabindex="0">프로모션
																	코드를 사용하실 호텔을 지정하신 후 코드를 입력해주세요.</p>
															</div>
														</div>
														<!--
									                프로모션코드 : 호텔 입력 전
									            -->
														<!--
									                프로모션코드 : 호텔 입력 후
									            -->
														<div class="d001-promotion d001-promotion--select"
															data-promotion="wrap-hotel">
															<a href="#" class="d001-promotion__anchor" title="레이어 팝업"
																data-promotion="handler"> <span>프로모션 코드</span>
															</a>
															<div class="d001-promotion__panel d001-promotion__code"
																data-promotion="panel" data-validation="true">
																<div data-js="combobox">
																	<select name="reservDivn" id="select-promotion"
																		title="분류 선택" class="combobox combobox--1">
																		<option value="CORPORATE">Corporate</option>
																		<option value="TRAVEL_AGENT">Travel Agency</option>
																	</select>
																</div>
																<div class="d001-promotion__input">
																	<div class="input">
																		<div class="input__wrap input__wrap--text">
																			<input name="specialCode" type="text"
																				class="o-input o-input--text"
																				id="input_promotion_code" title="코드 입력"
																				data-only="engNum">
																			<button type="button" class="input__removetext">삭제</button>
																		</div>
																	</div>
																	<button type="button" class="d001-promotion__confirm">
																		<span>코드확인</span>
																	</button>
																</div>
																<button type="button" class="d001-promotion__close"
																	data-promotion="panel__close">
																	<span class="screen--out">레이어 닫기</span>
																</button>
															</div>
														</div>
														<!--
									                //프로모션코드 : 호텔 입력 후
									            -->
														<button type="submit" class="d001__button">검색</button>
													</fieldset>
												</form>
											</div>

										</div>


									</div>







								</div>
							</div>

						</div>
					</div>
					<!-- 	
<fieldset>
<textarea style="border: solid;border-color: gray;" id="messageWindow" rows="7" 
cols="40" readonly="true">메뉴의 번호를 입력해주세요.
1.입실시간
2.찾아오시는 길

</textarea>
        <br/>
        <input type="text" id="msg" style="border: solid;border-color: gray;"/>
		<button id="btnSend" style="border: solid;border-color: gray;">Send Message</button>
</fieldset>
-->
					<div
						class="s004-main-promotion aem-GridColumn aem-GridColumn--default--12">

						<div class="s004 common-spacing-top--l common-spacing-bottom--l">
							<div
								class="s125-main-seo-copy aem-GridColumn aem-GridColumn--default--12">

								<h3 class="s004__title">호텔 소개</h3>

								<div class="s125-main-seo-copy">
									<div
										class="s125 common-spacing-top--m common-spacing-bottom--m">
										<p class="s125__copy">SK호텔앤리조트는 한국에서 가장 큰 호텔그룹으로 아시아를 넘어
											세계로 뻗어가는 글로벌 호텔로서 전세계 어디에서나 한결같이 품격 있는 서비스와 시설로 고객에게 깊은 감동을
											주는 브랜드를 지향하고 있습니다. SK호텔앤리조트에서는 균형 있는 라이프스타일을 추구하며 품격의 가치를 아는
											고객 분들을 위해 세련되고 안락한 객실과 세심한 배려가 묻어나는 고품격 호텔 서비스를 준비하고 있습니다. 호텔
											레스토랑과 라운지, 바에서 제공되는 최고급 요리는 즐거운 경험을 제공하며 다양한 부대시설은 비즈니스와 레저를
											모두 즐기고 싶어하시는 고객 분들을 만족 시키는데 부족함이 없습니다. SK호텔, SK시티호텔, S7호텔,
											시그니엘 및 SK리조트를 특별한 가격과 구성으로 만나보실 수 있는 호텔 패키지, 특별 혜택 이벤트 및
											프로모션을 공식사이트에서 확인해보세요.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div
						class="s003-g-main-pr aem-GridColumn aem-GridColumn--default--12">

						<div class="s003  common-spacing-bottom--l">

							<div class="s003__inner">
								<h2 class="s003__title">SK호텔의 새로운 경험</h2>
								<div class="s003__list s003__column s003__column--4-small"
									data-modal="group">

									<div class="s003__col">


										<div class="card-item card-type card-type--video">
											<div class="card-item__inner">
												<div class="card-item__content">


													<a class="card-item__anchor" href="javascript:void(0);"
														data-type="video" data-vendor="youtube"
														data-video="AaKBY-yMy7o" title="레이어 열기"> <img src=""
														data-src="${pageContext.request.contextPath}/resources/content/dam/lotte-hotel/global/main/180713-1-560-mai-global.jpg"
														alt="SK호텔글로벌-메인-시그니엘서울사진" class="card-item__img" /> <span
														class="card-item__play" aria-hidden="true"></span>
													</a>
												</div>
											</div>
										</div>

										<div class="card-item card-type card-type--text">
											<div class="card-item__inner">
												<div class="card-item__content">

													<div class="card-item__tbox black">
														<em class="card-item__title">Culinary R&amp;D Center</em>
														<p class="card-item__text">
															국경과 장르를 뛰어넘는 메뉴 개발을 통해 <br />새로운 외식 문화 창출
														</p>
													</div>


												</div>
											</div>
										</div>


									</div>

									<div class="s003__col">
										<div class="card-item card-type card-type--text">
											<div class="card-item__inner">
												<div class="card-item__content">
													<img src=""
														data-src="${pageContext.request.contextPath}/resources/content/dam/lotte-hotel/global/main/180917-402-mai-GLOBAL.jpg"
														alt="NCSI" class="card-item__img" />
													<div class="card-item__tbox black">
														<em class="card-item__title">NCSI 호텔부문 1위 선정</em>
														<p class="card-item__text">한국생산성본부 주관 2018
															국가고객만족도(NCSI) 호텔부문 2년 연속 1위 선정</p>
													</div>


												</div>
											</div>
										</div>
										<div class="card-item card-type card-type--image">
											<div class="card-item__inner">
												<div class="card-item__content">
													<a href="/seoul-hotel/ko/rooms/executive-tower.html"
														class="card-item__link" target="_self"> <img src=""
														data-src="${pageContext.request.contextPath}/resources/content/dam/lotte-hotel/global/main/180713-2-560-mai-global.jpg"
														alt="SK호텔글로벌-메인-SK호텔서울EXECUTIVE TOWER객실사진"
														class="card-item__img" />
													</a>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
					<div
						class="s005-main-membership-benefit aem-GridColumn aem-GridColumn--default--12">
						<div class="s005  common-spacing-bottom--l">
							<div class="s005__container">
								<div class="s005__inner">
									<h2 class="s005__title">SK호텔 멤버십 혜택</h2>
									<div class="s005__content">
										<div class="s005-item">
											<div class="s005-item__image">
												<img
													src="${pageContext.request.contextPath}/resources/content/dam/lotte-hotel/common/member/180716-1-53-pc-mai-lottehotel.png"
													alt="메인-맴버십혜택">
											</div>
											<p class="s005-item__text">회원 전용 이벤트를 누려보세요.</p>
										</div>

										<div class="s005-item">
											<div class="s005-item__image">
												<img
													src="${pageContext.request.contextPath}/resources/content/dam/lotte-hotel/common/member/180716-2-53-pc-mai-lottehotel.png"
													alt="메인-맴버십혜택">
											</div>
											<p class="s005-item__text">멤버십 회원만을 위해 할인된 가격을 제공합니다.</p>
										</div>

										<div class="s005-item">
											<div class="s005-item__image">
												<img
													src="${pageContext.request.contextPath}/resources/content/dam/lotte-hotel/common/member/180716-3-53-pc-mai-lottehotel.png"
													alt="메인-맴버십혜택">
											</div>
											<p class="s005-item__text">포인트를 적립하고, 현금처럼 실용적으로 사용하세요.</p>
										</div>
									</div>
									<div class="s005__cta">
										<a href="/global/ko/member/membership/privilege-rewards.html"
											target="_self" class="s005__button"> <span
											class="s005__button--text">SK호텔 멤버십 가입하기</span>
										</a>
									</div>
								</div>
							</div>
						</div>

					</div>


				</div>
			</div>

		</div>
	</div>
	<footer class="is-app--hide aem-GridColumn aem-GridColumn--default--12">

		<div>
			<div class="s100">
				<div class="s100__inner">

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
								class="footer-company__title">사업자등록번호</span> 101-81-25960
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

	<!-- socket -->
	<script>
		$(document).ready(function() {
			console.log('Info: connection start');
			$('#btnSend').on('click', function(evt) {
				evt.preventDefault();
				if (socket.readyState !== 1)
					return;
				let msg = $('input#msg').val();
				socket.send(msg);
			});
			connect();
		});
	</script>
	<!-- <script>
		var socket = null;
		function connect() {
			var text = document.getElementById("messageWindow");
			var ws = new WebSocket(
					"ws://localhost:8080/controller/replyEcho?bno=1234");
			socket = ws;

			ws.onopen = function() {
				console.log('Info: connection opened');
			};

			ws.onmessage = function(event) {
				console.log("ReceiveMessage: ", event.data + '\n');
				text.value += event.data + "\n";
			};

			ws.onclose = function(event) {
				console.log('Info: connection closed');
				setTimeout(function() {
					connect();
				}, 1000);
			};
			ws.onerror = function(err) {
				console.log('Info: connection err', err);
			};
		}
	</script> -->

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-dependencies.min.ACSHASH29195619a128b2e1241c11dd7742c127.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/clientlib-base.min.ACSHASH05c0b73acf24aa6e3d32172351073812.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/etc.clientlibs/lottehotel/clientlibs/templates/clientlib-basic.min.ACSHASHa36a3f3bae2f6ec9a4180690506659dc.js"></script>
</body>
</html>