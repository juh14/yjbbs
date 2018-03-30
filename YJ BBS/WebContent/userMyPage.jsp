<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="user.userDTO"%>
<%@ page import="user.userDAO"%>
<%@ page import="java.io.PrintWriter"%>


<html>
<head>
 <meta http-equiv="Content-Type" content="text.html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <title>영진의숲  마이페이지</title>
    <!-- 부트스트랩 CSS파일 링크하기 -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <!-- 부트스트랩 커스텀 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/custom.css" />
    <!-- 제이쿼리 자바스크립트 추가하기 -->
</head>
<body>
<style>
a {
	text-decoration: none;
	color : #000000
	 }
	
	.submenuLink {
	 float: left; margin-right:30px; padding: 0px 20px;  text-decoration: none; 
	 }


	#topMenu {
	margin-left:120px; 
	margin-right:120px;
	height:30px;
	background-color:3C6E8E;
	}
	
	#topMenu ul{
	list-style-type:none;
	margin:0px;
	padding:0px; }
	 
	 #topMenu ul li{
	color:white;
	back-ground-clor:#2d2d2d;
	float:left;
	line-height:30px;
	vertical-align:middle;
	text-align:center;
	position: relative;
	
	 }
	 
.menuLink, .submenuLink { 
 text-decoration:none;
 display: block; 
  width: 150px; 
font-size: 12px; 
font-weight: bold; 
  }


	.menulink {
	color:black;
	}
	
	
.submenuLink {

 color: #2d2d2d; 
 background-color: white;
  border: solid 1px black; 
  margin-top: -1px; /* 위 칸의 하단 테두리와 아래칸의 상단 테두리가 겹쳐지도록 설덩 */
   }
  
.submenu { position: absolute; 
 height: 0px;  
 overflow : hidden; /* 실 내용이 높이보다 커지면 해당 내용 감춤 */ 
 transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */ 
 -webkit-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 크롬/사파라ㅣ) */ 
 -moz-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 파폭) */ 
 -o-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 오페라) */
  }

.topMenuLi:hover .submenu 
{  height: 123px;  }

 .submenuLink:hover
  {color: red; 
   background-color: #dddddd;
  }



	ul {
	list-style-type:none;}
	nav li { display:inline; }
	nav li a { float: left;}
	
	

	#topMenu .menuLink:hover {color: #4d4d4d; }

   .nav-link
   {
   margin-left:900px;
 
   }
   
   .nav-link2
   {
   margin-left:30px;
   }
	
	.default_login
	{
	
	}
	
	#aa
	{
	width:230px; height:118px;
	}
	
	#bl
	{
	color: #000000;
	text-decoration : none;
	}
	</style>
	
<%
	String userID = null;
	
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
		
	
	if (request.getParameter("userID")!=null)
	{
		 userID = request.getParameter("userID");
	}
	 
	if( userID == null )
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다');");
		script.println("location.href = 'view.jsp'"); 
		script.println("</script>");
	
	}
	
	userDTO user = new userDAO().getUser(userID); 
	
	%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="index.jsp">영진의 숲 웹 사이트 </a>
      
      
      
   		<div id="navbar" class="collapse navbar-collapse">
   			<ul class="navbar-nav mr-auto">
   			  			 	<li class="nav item active">
   						<a class="nav-link" href="index.jsp">메인</a>
  			 	</li>
  			 	
   				 <li class="nav-item dropdown">
		           		 <a class="nav-link2 dropdown-toggle" id="dropdown" data-toggle="dropdown">
		              	회원 관리
		            </a>
		             <div class="dropdown-menu" aria-labelledby="dropdown">
		             
		             <!--  회원로그인 비로그인에따라 보여주는 형태 변경  -->
		        <%
		        
		        if(userID == null) {%>

              <a class="dropdown-item" href="userLogin.jsp">로그인</a>

              <a class="dropdown-item" href="userRegister.jsp">회원가입</a>

<%} else {

%>

              <a class="dropdown-item" href="userLogout.jsp">로그아웃</a>

<%
	}
%>
		           </div>
		           
				</li>
   			</ul>
   	
   	
   	
   	  <!-- 검색창
   	   <form action="./index.jsp" method="get" class="form-inline my-2 my-lg-0">
          <input type="text" name="search" class="form-control mr-sm-2" placeholder="내용을 입력하세요.">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
      </form>
       -->


   	
   	</div>
    </nav>
    
    
     
     
     
     
     
     <!--  대문에 영진사진 삽입  -->
 <div id="logo" style=" position:relative; width:100%; text-align:center; ">
					<a href="http://localhost:8080/YJ_BBS/index.jsp">
						<img src="C:/yjf.jpg">
					</a>
				</div>
				

     	 
    <nav id="topMenu">
      
     <ul>
        <li class="topMenuLi">
      <a class = "menuLink" href="#">학교정보</a>
	      <ul class="submenu">
	       <li><a class = "submenuLink" href="#">학교정보 </a></li>
	       <li><a class = "submenuLink" href="#">오시는길</a></li>
	       <li><a class = "submenuLink" href="#">영진정보</a></li>
	       <li><a class = "submenuLink" href="#">영진신문</a></li>
      	  </ul>   
      </li>
      
         <li class="topMenuLi">
      <a class = "menuLink" href="#">건의</a>
	      <ul class="submenu">
	       <li><a class = "submenuLink" href="#">건의 </a></li>
	       <li><a class = "submenuLink" href="#">공지사항</a></li>
	       <li><a class = "submenuLink" href="#">영숲건의</a></li>
	       <li><a class = "submenuLink" href="board.jsp">학생회에</a></li>
      	  </ul>   
      </li>
      
     <li class="topMenuLi">
      <a class = "menuLink" href="#">게시판</a>
	      <ul class="submenu">
	       <li><a class = "submenuLink" href="#">게시판 </a></li>
	       <li><a class = "submenuLink" href="#">소개</a></li>
	       <li><a class = "submenuLink" href="#">나눔</a></li>
	       <li><a class = "submenuLink" href="#">공유</a></li>
	       <li><a class = "submenuLink" href="#">질문</a></li>
	       <li><a class = "submenuLink" href="#">장터</a></li>
	       <li><a class = "submenuLink" href="#">소개팅</a></li>
	       <li><a class = "submenuLink" href="#">스포츠</a></li>
      	  </ul>   
      </li>
      
         <li class="topMenuLi">
      <a class = "menuLink" href="#">장터</a>
	      <ul class="submenu">
	       <li><a class = "submenuLink" href="#">장터 </a></li>
	       <li><a class = "submenuLink" href="#">판매</a></li>
	       <li><a class = "submenuLink" href="#">구매</a></li>
	       <li><a class = "submenuLink" href="#">나눔</a></li>
      	  </ul>   
      </li>
      
         <li class="topMenuLi">
      <a class = "menuLink" href="#">모임</a>
	      <ul class="submenu">
	       <li><a class = "submenuLink" href="#">모임 </a></li>
	       <li><a class = "submenuLink" href="#">동아리</a></li>
	       <li><a class = "submenuLink" href="#">스포츠</a></li>
	       <li><a class = "submenuLink" href="#">소개팅</a></li>
      	  </ul>   
      </li>
      
        <li class="topMenuLi">
      <a class = "menuLink" href="#">공부</a>
	      <ul class="submenu">
	       <li><a class = "submenuLink" href="#">공부 </a></li>
	       <li><a class = "submenuLink" href="#">자격증정보</a></li>
	       <li><a class = "submenuLink" href="#">취업</a></li>
	       <li><a class = "submenuLink" href="#">진로</a></li>
      	  </ul>   
      </li>
      
        <li class="topMenuLi">
      <a class = "menuLink" href="#">자취생</a>
	      <ul class="submenu">
	       <li><a class = "submenuLink" href="#">탑메뉴 </a></li>
	       <li><a class = "submenuLink" href="#">오시는길</a></li>
	       <li><a class = "submenuLink" href="#">영진정보</a></li>
	       <li><a class = "submenuLink" href="#">영진신문</a></li>
      	  </ul>   
      </li>
      
        <li class="topMenuLi">
      <a class = "menuLink" href="#">이달의베스트</a>
	      <ul class="submenu">
	       <li><a class = "submenuLink" href="#">탑메뉴 </a></li>
	       <li><a class = "submenuLink" href="#">오시는길</a></li>
	       <li><a class = "submenuLink" href="#">영진정보</a></li>
	       <li><a class = "submenuLink" href="#">영진신문</a></li>
      	  </ul>   
      </li>
      
      
     
     </ul>
     </nav>
   
   	<div class="container">
			<div class="row">
			
			<table class="table table-striped" style="text-align:center; boarder:1px solid #dddddd">
			<thead>
			<tr>
				<th colspan="3" style="background-clor:#eeeeee; text-align:center;">마이페이지</th>
			</tr>
			</thead>
				<tbody>
				<tr>
					<td style="width:20%;">아이디</td>
					<td colspan="2"><%= user.getUserID() %>
				<tr>
					<td >비밀번호 </td>
					<td colspan="2"><%= user.getUserPassword() %></td> 					
				</tr>
				
				<tr>
					<td >이름 </td>
					<td colspan="2"><%= user.getUserName() %></td> 					
				</tr>
				
				<tr>
					<td >닉네임 </td>
					<td colspan="2"><%= user.getUserNick() %></td> 					
				</tr>
				<tr>
					<td >이메일 </td>
					<td colspan="2"><%= user.getUserEmail() %></td> 					
				</tr>
				

					
				
				</tbody>
			
			</table>
				
				
				<a href="userUpdate.jsp" class="btn btn-primary pull-right">정보 수정</a>
				<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="userDeleteAction.jsp" class ="btn btn-primary pull-right">회원 탈퇴</a>
				
		
			</div>
			</div>
			
			  <script src="./js/jquery.min.js"></script>
    <!-- Popper 자바스크립트 추가하기 -->
    <script src="./js/popper.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->
    <script src="./js/bootstrap.min.js"></script>
    </body>
    </html>
    
     
