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
		if (txt == '����') {
			$('#del').show();
			$('#delBtn').text("���");
		} else {
			$('#del').hide();
			$('#delBtn').text("����");
		}
	})
});
</script>
</head>
<body>
  <section>
	<header>
		<h2>���뺸��</h2>
	</header>
	         <table class="table table-hover">
            <tr>
               <td width=20% class="text-center warning">��ȣ</td>
               <td width=30% class="text-center"><%=vo.getNo() %></td>
               <td width=20% class="text-center warning">�ۼ���</td>
               <td width=30% class="text-center"><%=vo.getRegdate() %></td>
            </tr>

            <tr>
               <td width=20% class="text-center warning">�̸�</td>
               <td width=30% class="text-center"><%=vo.getName() %></td>
               <td width=20% class="text-center warning">��ȸ��</td>
               <td width=30% class="text-center"><%=vo.getHit() %></td>
            </tr>

            <tr>
               <td width=20% class="text-center warning">����</td>
               <td colspan="3" class="text-left"><%=vo.getSubject() %></td>
            </tr>

            <tr>
               <td colspan="4" class="text-left" valign="top" height="200"><%=vo.getContent()%></td>
            </tr>
            <%
            if(vo.getFilesize() !=  0) {
            %>
            	<tr>
	            	<td width=20% class="text-center warning">÷������</td>
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
               <a href="main.jsp?mode=4&dno=3" class="btn btn-sm btn-primary">����</a>
               <a href="#" class="btn btn-sm btn-info" id=delBtn>����</a>
               <a href="main.jsp?mode=4&page=<%=strPage %>" class="btn btn-sm btn-danger">���</a>
            </tr>
            <tr id=del style="display:none">
            	<td class='text-right'>
            		<!-- detail.jsp�� main.jsp�� include �Ǿ��ֱ� ������ main.jsp�� ��ġ�� �������� �̵��� ������ ��θ� �����ؾ��Ѵ�. -->
            		<form action='../databoard/delete_ok.jsp'>
		            	��й�ȣ : <input type=password name=pwd size=10 required>
		            	<input type="submit" value=���� class='btn btn-sm btn-danger'>
		            	<input type="hidden" name=no value=<%=strNo %>>
		            	<input type="hidden" name=page value=<%=strPage %>>
	            	</form>
            	</td>
            </tr>
         </table>
  </section>
</body>
</html>