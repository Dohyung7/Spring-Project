<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>룰루랄라</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap -->
  <link rel="stylesheet" href="../resources/css/bootstrap.min.css">

  <!-- <script src="../../resources/jquery/jquery-3.3.1.min.js"></script>
  <script src="../../resources/popper/popper.min.js"></script> -->
  <script src="../../resources/tooltip/tooltip.min.js"></script>
 <!--  <script src="../../resources/js/bootstrap.min.js"></script> -->
   <script src="../resources/test/bootstrap.min.js"></script>
  <script src="../resources/test/jquery-3.3.1.slim.min.js"></script>
  <script src="../resources/test/popper.min.js"></script>
  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">


 
</head>
<body class="hold-transition skin-blue sidebar-mini">

<style>

   /* Bordered form */
   form {
     height:700px;
     font-size: 1.5em;
     border: 3px solid #f1f1f1;

   }





/* Full-width inputs */
input[type=text], input[type=password] {
  width: 100%;
  padding: 1% 2%;
  margin: 0.1%;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

h1{
  text-align:center;
  color:#273276;
}


/* Set a style for all buttons */
button {
  font-size:0.85em;
  background-color: #273276;
  color: white;
  margin: 5px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}



/* Add padding to containers */
.container {

  position:relative;
  top:20%;
  width:70%;
  padding: 1%;
}

  input{
     font-size: 0.5em;

  }




</style>

	<form  role="form" method='post' action="/login">
    <div class="container">
      <h1 >I,TALK</h1>
<fieldset>
      <label  for="uname"><b class="font-weight-bold h5 ">학번</b></label>
         <input class="form-control"  type="text" placeholder="Enter Username" name="username" required
             style="margin-bottom: 2%" autofocus>

      <label for="psw"><b class="font-weight-bold h5 "   style="margin-top: 2%" >비밀번호</b></label>
         <input class="form-control" type="password" placeholder="Enter Password" name="password" required value=""><br>

      <button class="login" style="margin-top:5%">Login</button>

      <label >
        <input type="checkbox" name="remember-me" >
        <a class="h6">자동로그인</a>
      </label>
      <input type="hidden" name="${_csrf.parameterName}"
        value="${_csrf.token}" />
      </fieldset>

    </div>
 </form>



	<!-- jQuery -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/resources/dist/js/sb-admin-2.js"></script>
  <script>
  
  
  
  
  $(".btn-success").on("click", function(e){
    
    e.preventDefault();
    $("form").submit();
    
  });
  
  </script>
  
<c:if test="${param.logout != null}">
      <script>
      $(document).ready(function(){
      	alert("로그아웃하였습니다.");
      });
      </script>
</c:if>  

<%@ include file="include/footer.jsp" %>
