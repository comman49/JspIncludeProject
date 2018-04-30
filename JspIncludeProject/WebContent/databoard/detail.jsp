<%@page import="com.sist.databoard.dao.DataBoardVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.databoard.dao.DataBoardDAO"%>
<jsp:useBean id="dao" class="com.sist.databoard.dao.DataBoardDAO"></jsp:useBean>
<%
String strNo = request.getParameter("no");
String strPage = request.getParameter("page");

DataBoardVO vo = dao.databoardDetailData(Integer.parseInt(strNo));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src='http://code.jquery.com/jquery.js'></script>
<script type="text/javascript">
$(function() {
	$('#delBtn').click(function() {
		var txt = $('#delBtn').text();
		if (txt == '삭제') {
			$('#del').show();
			$('#delBtn').text("취소");
		} else {
			$('#del').hide();
			$('#delBtn').text("삭제");
		}
	})
});
</script>
</head>
<body>
  <section>
	<header>
		<h2>내용보기</h2>
	</header>
	         <table class="table table-hover">
            <tr>
               <td width=20% class="text-center warning">번호</td>
               <td width=30% class="text-center"><%=vo.getNo() %></td>
               <td width=20% class="text-center warning">작성일</td>
               <td width=30% class="text-center"><%=vo.getRegdate() %></td>
            </tr>

            <tr>
               <td width=20% class="text-center warning">이름</td>
               <td width=30% class="text-center"><%=vo.getName() %></td>
               <td width=20% class="text-center warning">조회수</td>
               <td width=30% class="text-center"><%=vo.getHit() %></td>
            </tr>

            <tr>
               <td width=20% class="text-center warning">제목</td>
               <td colspan="3" class="text-left"><%=vo.getSubject() %></td>
            </tr>

            <tr>
               <td colspan="4" class="text-left" valign="top" height="200"><%=vo.getContent()%></td>
            </tr>
            <%
            if(vo.getFilesize() !=  0) {
            %>
            	<tr>
	            	<td width=20% class="text-center warning">첨부파일</td>
	            	<td colspan="3" class="text-left">
	            		<a href="../databoard/download.jsp?fn<%=vo.getFilename()%>"><%=vo.getFilename() %></a>(<%=vo.getFilesize() %>)Bytes
	            	</td>
            	</tr>
            <%
            }
            %>

         </table>
         <table class="table">
            <tr>
               <td class="text-right"><a href="#"></a> 
               <a href="main.jsp?mode=4&dno=3" class="btn btn-sm btn-primary">수정</a>
               <a href="#" class="btn btn-sm btn-info" id=delBtn>삭제</a>
               <a href="main.jsp?mode=4&page=<%=strPage %>" class="btn btn-sm btn-danger">목록</a>
            </tr>
            <tr id=del style="display:none">
            	<td class='text-right'>
            		<!-- detail.jsp는 main.jsp에 include 되어있기 때문에 main.jsp의 위치를 기준으로 이동할 문서의 경로를 지정해야한다. -->
            		<form action='../databoard/delete_ok.jsp'>
		            	비밀번호 : <input type=password name=pwd size=10 required>
		            	<input type="submit" value=삭제 class='btn btn-sm btn-danger'>
		            	<input type="hidden" name=no value=<%=strNo %>>
		            	<input type="hidden" name=page value=<%=strPage %>>
	            	</form>
            	</td>
            </tr>
         </table>
  </section>
</body>
</html>