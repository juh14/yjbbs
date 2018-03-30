<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text.html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>영진의숲 for yours</title>
<!-- 부트스트랩 CSS파일 링크하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- 부트스트랩 커스텀 CSS 추가하기 -->
<link rel="stylesheet" href="./css/custom.css" />
<!-- 제이쿼리 자바스크립트 추가하기 -->

</head>
<body>

	<%					// radiovalue 있는 부분 다 추가
		String userID = null;

		if (session.getAttribute("userID") != null) {

			userID = (String) session.getAttribute("userID");

		}
		
		String radiovalue = null; 

		if (request.getParameter("radiovalue") != null) {
			radiovalue = request.getParameter("radiovalue");
		}
		radiovalue = (String) request.getParameter("radiovalue");

		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.');");
			script.println("location.href = 'userLogin.jsp'");
			script.println("</script>");

		}

		else {
			if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력안된 사항이 있습니다..');");
				script.println("history.back()");
				script.println("</script>");
			}

			else {
				BbsDAO bbsDAO = new BbsDAO();

				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());

				if (radiovalue.equals("a"))
					bbsDAO.setAnonymousUser(bbsDAO.CheckBbsNum());
				else
					bbsDAO.unsetAnonymousUser(bbsDAO.CheckBbsNum());

				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다');");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='board.jsp'");
					script.println("</script>");
				}
			}
		}
	%>








</body>
</html>
