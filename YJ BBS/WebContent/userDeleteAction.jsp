<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.userDTO"%>
<%@ page import="user.userDAO"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>


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

	<%
		String userID = null;

		if (session.getAttribute("userID") != null) {

			userID = (String) session.getAttribute("userID");

		}

		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.');");
			script.println("location.href = 'userLogin.jsp'");
			script.println("</script>");

		}

		userDTO user = new userDAO().getUser(userID); //해당 글가져옴
		if (!userID.equals(user.getUserID())) // 로그인자와 해당 글쓴이 비교 
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이없습니다');");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");

		}

		else {
			userDAO userDAO = new userDAO();
			BbsDAO bbsDAO = new BbsDAO();
			int result = userDAO.delete(userID);
			int result2 = bbsDAO.deleteAll(userID);
			if (result == -1 || result2 == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('탈퇴에 실패했습니다');");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='index.jsp'");
				script.println("</script>");
				session.invalidate();
			}

		}
	%>








</body>
</html>
