<%@page import="com.hotelSK.domain.RoomStatusVO"%>
<%@page import="com.hotelSK.domain.ReservationVO"%>
<%@page import="com.hotelSK.domain.UserVO"%>
<%@page import="com.hotelSK.domain.RoomVO" %>
<%@page import="com.hotelSK.domain.QnaBoardVO" %>
<%@page import="com.hotelSK.domain.QnaComentsVO" %>
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
				UserVO userVO = (UserVO)request.getSession().getAttribute("user");
				QnaBoardVO qnaBoardVO = (QnaBoardVO)request.getSession().getAttribute("qnaBoardVO");
				List<QnaComentsVO> qnaComentsList = (List<QnaComentsVO>)request.getSession().getAttribute("qnaComentsList");
					
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
        <h2 class="text-center">게시글 보기</h2>
        </br>
        
        <form action="<%=request.getContextPath()%>/qnaBoard" name="myform" onsubmit="return send();" method="get">
                <input type="hidden" name="id" value="<%=qnaBoardVO.getUser_id()%>">
          <%if(userVO != null && userVO.getUser_id().equals(qnaBoardVO.getUser_id())){ %>
          <table class="table table-responsive">
            <tr>
            	<th class="success">제목</th>
                <td colspan="4"><%=qnaBoardVO.getBoard_title()%></td>
                <!-- <td><input type="text"  class="form-control" name="qna_title"></td> -->
            </tr>
            <tr>
            	<th class="success">작성자</th>
                <td><%=qnaBoardVO.getUser_id()%></td>
                <th class="success">작성일</th>
                <td><%=qnaBoardVO.getBoard_date().substring(0,16)%></td>
          		<td align="right">
                	<div class="btn-group">
					  <button type="button" class="btn btn-xs dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
					    <span class="glyphicon glyphicon-option-vertical" aria-hidden="true"></span>
					  </button>
					  <ul class="dropdown-menu" role="menu">
					    <li><a href="<%=request.getContextPath()%>/qnaBoard/<%=qnaBoardVO.getBoard_no()%>/write">수정하기</a></li>
					    <li><a href="<%=request.getContextPath()%>/qnaBoard/<%=qnaBoardVO.getBoard_no()%>"
					    id="delBtn">삭제하기</a></li>
					  </ul>
					</div>
				</td>
            </tr>
            <tr>
            	<!-- <th class="success">글 내용</th> -->
                <td colspan="4"><%=qnaBoardVO.getBoard_text() %></td>
                <!-- <td><textarea rows="10" cols="50" name="qna_content" class="form-control"></textarea></td> -->
            </tr>
          </table>
          <%}if(userVO == null || !userVO.getUser_id().equals(qnaBoardVO.getUser_id())){ %>
          <table class="table table-responsive">
            <tr>
            	<th class="success">제목</th>
                <td colspan="3"><%=qnaBoardVO.getBoard_title()%></td>
                <!-- <td><input type="text"  class="form-control" name="qna_title"></td> -->
            </tr>
            <tr>
            	<th class="success">작성자</th>
                <td><%=qnaBoardVO.getUser_id()%></td>
                <th class="success">작성일</th>
                <td><%=qnaBoardVO.getBoard_date().substring(0,16)%></td>
            </tr>
            <tr>
            	<!-- <th class="success">글 내용</th> -->
                <td colspan="4"><%=qnaBoardVO.getBoard_text() %></td>
                <!-- <td><textarea rows="10" cols="50" name="qna_content" class="form-control"></textarea></td> -->
            </tr>
          </table>
          <%} %>
        </form> 
        <!--  여기까지  qna_board 내용 -->
        			<!--  qna_comments 시작 -->
        						<!-- <div class="col-xs-10 col-md-offset-1"> -->
        						<div class="form-group" align="left">
        								
									</br></br><h5><strong>댓글</strong></h5>
											
									<table class="table" id="co_list">
										<!-- 스크립트로 댓글내용 채울 거임 -->
										<%
										if(qnaComentsList.size() != 0){
											for(int i=0; i<qnaComentsList.size(); i++){
												if( (i > 0) &&
														( qnaComentsList.get(i).getCo_group() == qnaComentsList.get(i-1).getCo_group() ) ){ //답글이면
										%>
											<tr id="qnaCoRow<%=qnaComentsList.get(i).getCo_no()%>">
												<td class="col-md-1"></td>
												<td>
											<%}else{ //답글아니면  %>
											<tr id="qnaCoRow<%=qnaComentsList.get(i).getCo_no()%>">
												<td colspan="2">
											<%}%>
												<%if(qnaComentsList.get(i).getCo_text().equals("")){ %>
													삭제된 댓글입니다.
												</td><td></td>
												<%}else{ %>
													<h5><Strong><%=qnaComentsList.get(i).getUser_id()%></Strong></h5>
													<%=qnaComentsList.get(i).getCo_text()%>
													<h5><small><%=qnaComentsList.get(i).getCo_date()%>  <a onclick="co_reply(<%=qnaComentsList.get(i).getCo_no()%>);">답글쓰기</a></small></h5>
												</td>
												<td align="right">
													<div class="btn-group">
													<%if(userVO != null && userVO.getUser_id().equals(qnaComentsList.get(i).getUser_id()) ){ %>
													  <button type="button" class="btn btn-xs dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
													    <span class="glyphicon glyphicon-option-vertical" aria-hidden="true"></span>
													  </button>
													  <ul class="dropdown-menu" role="menu">
													    <li><a onclick="update_qnaCo(<%=qnaComentsList.get(i).getCo_no()%>)">수정하기</a></li>
													    <li><a onclick="delete_qnaCo(<%=qnaComentsList.get(i).getCo_no()%>)">삭제하기</a></li>
													  </ul>
													 <%}%>
													</div>
												</td>
												<%} %>
											</tr>
										<%
											}}
										%>
										
									</table>
								</div>
        						
								<div class="form-group" align="left">
									<label for="exampleInputName2">Comments :)</label>
								</div>
								<div class="form-group">
									<textarea class="form-control" rows="3" id="qna_cotext" placeholder="댓글을 남겨보세요"></textarea>
								</div>
								
								<div class="form-group" align="right">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="button" id="add_qnaCo" class="btn btn-success btn-sm">등록</button>
										<a href="<%=request.getContextPath()%>/qnaBoard" class="btn btn-default btn-sm">목록으로</a>
										<%if(userVO != null){ %>
										<input type='hidden' id='add_user' value='<%=userVO.getUser_id()%>'></input>
										<%} %>
										<input type='hidden' id='reply_flag' value=0></input>
									</div>
								</div>
								
								<div class="form-group" align="center">
								<nav>
								  <ul class="pagination" id="page_list">
								  </ul>
								</nav>
								</div>
								<!-- </div> -->
        <!--  qna_comments 종료 -->
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

		$("#delBtn").click(function() {
			var board_no = <%=qnaBoardVO.getBoard_no()%>;
			 
			$.ajax({
				type : 'DELETE',
				url : '',
				contentType: 'application/json; charset=utf-8',
				dataType : 'json',
				data : JSON.stringify(board_no),
				success : function(data) {
					if (data == 1) { //1은 성공
						alert('게시글이 삭제되었습니다.');
						location.href = '/controller/qnaBoard';
					}
				},
				error : function(request, status, error) {
					console.log("qna delete fail");
					alert('error');
				}
			});
		});
		
		$("#add_qnaCo").click(function() {
			var board_no = <%=qnaBoardVO.getBoard_no()%>;
			
			var user_id = $('#add_user').val();
			var co_text = $('#qna_cotext').val();
			//document.myform.qna_title.focus();
			if(co_text =="" )  //내용체크
			  { alert("내용을 입력해주세요"); documents.getElementsById('qna_cotext').focus(); return false; }
			
			var allData = {
					"user_id" : user_id,
					"co_text" : co_text
				};
			
			$.ajax({
				type : 'POST',
				url : '/controller/qnaComments/'+board_no,
				contentType: 'application/json; charset=utf-8',
				dataType : 'json',
				data : JSON.stringify(allData),
				success : function(data) {
					if (data == 1) { //1은 성공
						alert('댓글이 등록되었습니다.');
						location.href = '/controller/qnaBoard/'+board_no;
					}
				},
				error : function(request, status, error) {
					console.log("comments insert fail");
					alert('error');
				}
			});
		});
		
		function update_qnaCo(co_no){
			alert("up click "+co_no);
		}
		
		function delete_qnaCo(co_no){
			var board_no = <%=qnaBoardVO.getBoard_no()%>;

			$.ajax({
				type : 'DELETE',
				url : '/controller/qnaComments/'+co_no,
				contentType: 'application/json; charset=utf-8',
				dataType : 'json',
				data : JSON.stringify(co_no),
				success : function(data) {
					if (data == 1) { //1은 성공
						alert('댓글이 삭제되었습니다.');
						location.href = '/controller/qnaBoard/'+board_no;
					}else{
						alert('삭제할 수 없는 댓글입니다.');
					}
					
				},
				error : function(request, status, error) {
					console.log("delete fail");
					alert('error');
				}
			});
		}
		
		
		function co_reply(co_no)
		{
			var id = $("#add_user").val();
			var reply_flag = $("#reply_flag").val();
			
			if(reply_flag == 0){ //답변 폼 안열려있냐?
				var html="<tr id='reply_open'><td class='col-md-1'></td><td colspan='2'>";
				html += "";
				html += "<h5><Strong>"+id+"</Strong></h5>";
				html += "<textarea id='reply_text' class='form-control' rows='3' placeholder='댓글을 남겨보세요'></textarea>";
				html += "<button type='button' onclick='add_reply("+co_no+")' class='btn btn-success btn-sm'>등록</button>"
				html += "<button type='button' onclick='replyClose();' class='btn btn-default btn-sm'>취소</button></td></tr>"			
				
				$("#qnaCoRow"+co_no).eq(-1).after(html);
				$("#reply_flag").val(1);
			}else{ //답변폼이 1개 열려있냐? 이전 답변폼 삭제하고 현재 댓글에 추가
					
				$("#reply_open").eq(-1).remove();

				var html="<tr id='reply_open'><td class='col-md-1'></td><td colspan='2'><h5><Strong>"+id+"</Strong></h5>";
				html += "<textarea id='reply_text' class='form-control' rows='3' placeholder='댓글을 남겨보세요'></textarea>";
				html += "<button type='button' onclick='add_reply("+co_no+")' class='btn btn-success btn-sm'>등록</button>"
				html += "<button type='button' onclick='replyClose();' class='btn btn-default btn-sm'>취소</button></td></tr>"			
				
				$("#qnaCoRow"+co_no).eq(-1).after(html);
			}
		}
		
		function add_reply(co_no){
			var board_no = <%=qnaBoardVO.getBoard_no()%>;
			var user_id = $('#add_user').val();
			var co_text = $('#reply_text').val();
			
			if(co_text =="" )  //내용체크
			  { alert("내용을 입력해주세요"); documents.getElementsById('reply_text').focus(); return false; }
			
			var allData = {
					"co_no" : co_no,
					"user_id" : user_id,
					"co_text" : co_text
				};
			
			$.ajax({
				type : 'POST',
				url : '/controller/qnaReply/'+board_no,
				contentType: 'application/json; charset=utf-8',
				dataType : 'json',
				data : JSON.stringify(allData),
				success : function(data) {
					if (data == 1) { //1은 성공
						alert('답글이 등록되었습니다.');
						location.href = '/controller/qnaBoard/'+board_no;
					}
				},
				error : function(request, status, error) {
					console.log("reply insert fail");
					alert('error');
				}
			});
		}
		
		function replyClose(){
			$("#reply_open").eq(0).remove();
			$("#reply_flag").val(0);
		}
		
		
		</script>

</body>
</html>
		<!--function send()
		 {
		  if(document.myform.qna_title.value =="" )  //이름 체크
		  { alert("제목을 입력해주세요"); document.myform.qna_title.focus(); return false; }
		  
		  if(document.myform.password.value =="")
		  { alert("비밀번호를 입력해주세요."); document.myform.password.focus();  return false; }

		  if( document.myform.qna_content.value =="" )
		  { alert("내용울 입력해주세요."); document.myform.qna_content.focus();  return false; }
		 }-->