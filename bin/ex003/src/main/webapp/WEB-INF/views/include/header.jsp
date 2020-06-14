<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>I.Talk</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap -->
  <link rel="stylesheet" href="../resources/css/bootstrap.min.css">

	<!-- 
	<script src="../../resources/popper/popper.min.js"></script>
	<script src="../../resources/tooltip/tooltip.min.js"></script>
	<script src="../../resources/js/bootstrap.min.js"></script>
 	<script src="../resources/test/bootstrap.min.js"></script>
	<script src="../resources/test/jquery-3.3.1.slim.min.js"></script>
	<script src="../resources/test/popper.min.js"></script> -->
	<!-- <script src="../resources/ckeditor/ckeditor.js"></script> -->
	<!-- <script src="//cdn.ckeditor.com/4.13.0/basic/ckeditor.js"></script> -->
	
	<script src="../../resources/jquery/jquery-3.3.1.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">


 
</head>
<style>
body { padding-top: 70px; }
</style>

	 
		   	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
		   	<div class="container">
					<!-- //아이토크 이미지 -->
					<span> 
						     <span> 
				            <a href="../">
				               <h1 class="text-center">I.TALK</h1>
				            </a>  
        				 </span>
					</span>
		  			
		
		  			 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		   				 <span class="navbar-toggler-icon"></span>
		 			 </button>
		
		
		
		
				    <!-- 공지사항 -->	
		
		  			<div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav mr-auto">
		      		
		      		<li class="nav-item active">
		        			<a class="nav-link" href="#"> <span class="sr-only">(current)</span></a>
		      		</li>
		
		      		<li class="nav-item dropdown">
		        
		        		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" 
		        			aria-haspopup="true" aria-expanded="false">공지사항  </a>
		        	
		        	<div class="dropdown-menu" aria-labelledby="navbarDropdown">
		        		<a class="dropdown-item" href="../board/list">전체 공지사항</a>
		        		<div class="dropdown-divider"></div>
		          		<a class="dropdown-item" href="../board/list1">1학년 공지사항</a>
		          		<a class="dropdown-item" href="../board/list2">2학년 공지사항</a>
		          		<a class="dropdown-item" href="../board/list3">3학년 공지사항</a>
		          		<a class="dropdown-item" href="../board/list4">4학년 공지사항</a>
		        	</div>
		
		        	</li>
				
		        	<!-- 학생 게시판 -->
		
		        	<li class="nav-item dropdown">
		        
		        		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" 
		        			aria-haspopup="true" aria-expanded="false">학생게시판  </a>
		        	
		        	<div class="dropdown-menu" aria-labelledby="navbarDropdown">
		        		<a class="dropdown-item" href="#">학생회</a>
		        		<div class="dropdown-divider"></div>
		          		<a class="dropdown-item" href="#">익명</a>
		        	</div>
		
		        	</li>
		
		        
		        	<!-- 교수 게시판 -->
		
		      		<li class="nav-item">
		        		<a class="nav-link" href="#">교수 게시판  </a>
		     		</li>
		
		     		<!-- 문의  -->
		
		      		<li class="nav-item">
		        		<a class="nav-link" href="../QnA/chatbot">문의   </a>
		     		</li>
		
		     		<!-- 학사 일정 캘린더  -->
		
		      		<!-- <li class="nav-item">
		        		<a class="nav-link" href="#">학사일정  </a>
		     		</li> -->
		
		     		<!-- 셔틀버스   -->
		
		     		<!-- <li class="nav-item">
		        		<a class="nav-link" href="#">셔틀버스   </a>
		     		</li> -->
		     		<div class="dropdown-divider"></div>
		    </ul>
		
		
		    <!-- 오른족 정렬  -->
		    <ul class="navbar-nav my-2 my-lg-0">
		    
		    <li class="nav-item">
		        <a class="nav-link" href="../board/mypage">마이페이지   </a>
		     </li>
		     		
		     		
		     <li class="nav-item">
		     <form role="form" action="/board/modify" method="post">
		     <sec:authorize access="isAuthenticated()">
		        <a class="nav-link" href="/customLogout">로그아웃   </a>
		        </sec:authorize>
		        </form>
		     </li>
		     
		
		     <!-- <li class="nav-item">
		        		<a class="nav-link" href="#">회원가입   </a>
		     		</li> -->
		
		     
		    </ul>
		
		  </div>
		  </div>
		</nav>
		
<body class="hold-transition skin-blue sidebar-mini">