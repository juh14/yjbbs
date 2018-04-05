<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.userDAO"%>


<html>
  <head>  
 <meta http-equiv="Content-Type" content="text.html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <title>영진의숲  for yours</title>
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
	
	</style>

 
<%

	String userID = null;

	if(session.getAttribute("userID") != null) {

		userID = (String) session.getAttribute("userID");

	}

/* 	if(userID == null) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('로그인을 해주세요.');");

		script.println("location.href = 'userLogin.jsp'"); 

		script.println("</script>");

		script.close();	

	} */
	
	boolean emailChecked = new userDAO().getUserEmailChecked(userID);

	if(emailChecked == false && userID != null) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("location.href = 'emailSendConfirm.jsp'");

		script.println("</script>");

		script.close();		

		return;

	}

%>	



<!--  header 장식  -->
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
					<a href="#">
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
      <a class = "menuLink" href="#">캠퍼스</a>
	      <ul class="submenu">
	       <li><a class = "submenuLink" href="#">캠퍼스 </a></li>
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
      
      <!--   <li class="topMenuLi">
      <a class = "menuLink" href="#">이달의베스트</a>
	      <ul class="submenu">
	       <li><a class = "submenuLink" href="#">탑메뉴 </a></li>
	       <li><a class = "submenuLink" href="#">오시는길</a></li>
	       <li><a class = "submenuLink" href="#">영진정보</a></li>
	       <li><a class = "submenuLink" href="#">영진신문</a></li>
      	  </ul>   
      </li> -->
      
      
    
     
     </ul>
     </nav>
     
     

	
   <!-- 큰틀 한줄 만들기 -->
   <div style="float:left; width:100%; height:122px; margin-left:120px;"> 
	
	<!--  원래 스누소스  -->	
	<!-- <div style="float:left; width:450px; height:120px; border:1px solid #ccc; margin-right:50px;">
		/147886618/pc_main_center
		<div id='div-gpt-ad-1461987705241-0' style='height:120px; width:450px;'>
		<script type='text/javascript'>
		googletag.cmd.push(function() { googletag.display('div-gpt-ad-1461987705241-0'); });
		</script>
		</div>
	</div>
	 -->
	
	<!-- 서브2 영진대전  -->
	<div style="float:left; width:230px; height:120px; border:1px solid #ccc">
		 <a href="https://www.facebook.com/%EC%98%81%EC%A7%84%EC%A0%84%EB%AC%B8%EB%8C%80%ED%95%99-%EB%8C%80%EC%8B%A0-%EC%A0%84%ED%95%B4%EB%93%9C%EB%A6%BD%EB%8B%88%EB%8B%A4-370654966442058/">
						<img id="aa" src="C:/facebook.jpg";>
					</a>
	</div>
	
	<div style="float:left; width:230px; height:120px; border:1px solid #ccc">
		 <a href="http://cafe.naver.com/ystory4u">
						<img id="aa" src="C:/ystory.jpg";>
					</a>
	</div>
	
	
	<div style="float:left; width:230px; height:120px; border:1px solid #ccc">
		 <a href="https://www.yjc.ac.kr/">
						<img id="aa" src="C:/yjp.jpg";>
					</a>
	</div>
	
		<div style="float:left; width:230px; height:120px; border:1px solid #ccc">
		 <a href="https://everytime.kr/259583">
						<img id="aa" src="C:/everytime.jpg";>
					</a>
	</div>
	
<!--  로그인창  -->


	<div style=" float:left; width:230px; height:120px; border:1px solid #ccc; margin-left:30px;">
		<div style="overflow:hidden;"><div style="*zoom:1;padding:0px 0px 0px 0px !important; padding:none !important;"><!-- colorset의 값에 따라 css 파일을 import 한다 -->
<script type="text/javascript">
    var keep_signed_msg = "브라우저를 닫더라도 로그인이 계속 유지될 수 있습니다.\n\n로그인 유지 기능을 사용할 경우 다음 접속부터는 로그인을 하실 필요가 없습니다.\n\n단, 게임방, 학교 등 공공장소에서 이용 시 개인정보가 유출될 수 있으니 꼭 로그아웃을 해주세요.";
    xAddEventListener(window, "load", function(){ doFocusUserId("fo_login_widget"); });
</script>


<div class="default_login" id="login">
	<!--
	<div class="title_box">
		<b class="title">Member Login</b>
	</div>
	-->
	<div class="list_box" style="padding:3px 13px;">
	<!--<form action="./" method="post" onsubmit="return procFilter(this, widget_login)" id="fo_login_widget"><input type="hidden" name="error_return_url" value="/" /><input type="hidden" name="vid" value="" />-->
	<form ruleset="@login" action="./userLoginAction.jsp" method="post" id="fo_login_widget" class="form" style=" margin:0px; padding:0px;"> 
		<input type="hidden" name="success_return_url" value="http://snulife.com/" />
		<input type="hidden" name="act" value="procMemberLogin" />
		<input type="hidden" name="mid" value="main" />
			<table border="0" cellpadding="3" width="100%">
				<!--<col width="30" align="center"></col>--><col></col><col width="300" align="left"></col>
				
				
				 
				
				
				
				
				<%if(userID == null)
				{%>
				<tr><td colspan=2 style="padding:0px; margin:0px;"><input type="checkbox" name="keep_signed" id="keepid" value="Y" onclick="if(this.checked) return confirm(keep_signed_msg);" />
					<label for="keepid">로그인 유지</label>
				</td></tr>
				
				<tr><!--<td> ID : </td>--><td><input name="userID" type="text" class="input" id="login_form_user_id" tabindex=1 style="width:150px;"/></td><td rowspan="2">
								<input type="submit" value="" class="submit" tabindex=3/>
								</td></tr>
				<tr><!--<td> PW : </td>--><td><input name="userPassword" type="password" class="input" tabindex=2 style="width:150px;"/></td></tr>
				
				<tr><td colspan=2 class="list_button" style="padding:0px; margin:0px;"><a href="./emailFind.jsp">비밀번호찾기<!--아이디/비밀번호 찾기-->
												&nbsp;&nbsp;&nbsp;<span style="color:#ccc">|</span>&nbsp;&nbsp;&nbsp;
												<a href="userRegister.jsp" style="color:#777">회원가입<!--<img src="/widgets/login_info/skins/sejin7940_login_sero/images/default/i_join.gif">--></a><!--<img src="/widgets/login_info/skins/sejin7940_login_sero/images/default/i_help.gif">--></a></td></tr>
				<%}%>
				

		        
		<%if (userID != null)
				{%>
				<label><br><%=userID%>님 반갑습니다.</label>
				<a href="./userMyPage.jsp"><br>마이페이지 가기</a>
				  <a class="dropdown-item" href="userLogout.jsp"><br>로그아웃</a>
					<%}%>
												
			</table>
		</form>
	</div>
	</div>
</div>
</div>

<br><br><br>
</div>
<img src="C:/yuk.jpg">
<div style="float:left; width:100%; height:500px; "> 

<div style="float:left; width:31%; height:500px; border:1px solid #ccc">
		 <a href="#">
						
					</a>
	</div>
	
	<div style="float:left; width:31%; height:500px; border:1px solid #ccc">
		 <a href="#">
						
					</a>
	</div>
	
	<div style="float:left; width:31%; height:500px; border:1px solid #ccc">
		 <a href="#">
						
					</a>
	</div>
	
	
	
	
	</div>
	
	<br><br><br><br><br><br>
<!-- 1번쨰 섹션 -->
	<div style="width:455px; height:300px; border:1px solid black; float:left; margin-top: 10px; margin-right:10px;"><a class="link" href="board.jsp">자유게시판</a><br>
	<div style="width:30px; height:30px; "></div>
	<%
	int pageNumber=1;
	if(request.getParameter("pageNumber")!=null)
	{
		pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
	}

	%>
			<%		
			BbsDAO bbsDAO = new BbsDAO();
			ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
			for (int i=0; i < list.size(); i++){
			%>
				<tr>
				<td><%= list.get(i).getBbsDate().substring(0,11)%></td>
				<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle() %><br></a></td>
				</tr>
				<%
				}
				%>
		</div>
<!-- 2번쨰 섹션 -->
<div style="width:455px; height:300px; border:1px solid green; float:left; margin-top:10px; margin-right:10px;">

</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<!-- 3번쨰 섹션 -->	
<div style="width:455px; height:300px; border:1px solid red; float:left; margin-top: 5px; margin-right:10px;">

</div>

<!-- 4번쨰 섹션 -->
<div style="width:455px; height:300px; border:1px solid green; float:left; margin-top:5px; margin-right:10px;">

</div>



    <script src="./js/jquery.min.js"></script>
    <!-- Popper 자바스크립트 추가하기 -->
    <script src="./js/popper.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->
    <script src="./js/bootstrap.min.js"></script>
    
  </body>

</html>


