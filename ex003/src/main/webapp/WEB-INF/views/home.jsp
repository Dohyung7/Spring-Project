<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@ include file="include/header.jsp" %>


	<!--  <div class="container" style="margin-top:1%">
			<div class="jumbotron">
				<h1 class="text-center">컴퓨터공학과</h1>
				<h1 class="text-center">I.TALK</h1>
							
			</div>
		</div>-->

		<!-- 컴퓨터 공학과 게시판 밑에 줄  -->
		<div class="dropdown-divider" \></div>

		<!-- 서비스 목록 아이콘 버튼  -->

		<style >
			.img1{width: 100%; height: 250px;} /*첫번쨰 이미지*/

			.img2{width: 100%; height: 250px;} /*두번쨰 이미지*/

			.img3{width: 100%; height: 250px;} /*세번쨰 이미지*/

			.img4{width: 100%; height: 250px;} /*네번쨰 이미지*/

		</style>

<!-- 서비스 목록 첫번째 줄 두개 -->
		<div class="container" style="margin-top:1%">

			<div class="row">



				<div class="col-6 " style="background-color:white;" >
				<figure class="figure " >
				  <a href="../board/list"><button class="btn aaaa" id="btn" type="button"><img class="btn-img" src="../resources/img/notice.png" style="max-width: 30%; height: auto;"></button>
				  <figcaption class="figure-caption text-center" >공지 사항</figcaption></a>
				</figure>

				</div>


				<div class="col-6" style="background-color: light;">
				<figure class="figure">
				  <a href="../board/list"><button class="btn" id="btn" type="button"><img class="btn-img" src="../resources/img/friendship.png" style="max-width: 30%; height: auto;"></button>
				  <figcaption class="figure-caption text-center">게시판</figcaption></a>
				</figure>


				</div>





				<div class="col-6" style="background-color: light;">
				<figure class="figure">
				  	<a href="../QnA/chatbot"><button class="btn" id="btn" type="button"><img class="btn-img" src="../resources/img/chat.png" style="max-width: 30%; height: auto;"></button>
				  <figcaption class="figure-caption text-center">QnA</figcaption></a>
				</figure>

				</div>

        <div class="col-6" style="background-color: light;">
				<figure class="figure">
				  	<a href="https://www.shinhan.ac.kr"><button class="btn" id="btn" type="button"><img class="btn-img" src="../resources/img/school.png" style="max-width: 30%; height: auto;"></button>
				  <figcaption class="figure-caption text-center">신한대학교 홈페이지</figcaption></a>
				</figure>

				</div>


        <div class="col-6" style="background-color: light;">
				<figure class="figure">
				  	<a href="http://stins.shinhan.ac.kr/irj/portal"><button class="btn" id="btn" type="button"><img class="btn-img" src="../resources/img/system.png" style="max-width: 30%; height: auto;"></button>
				  <figcaption class="figure-caption text-center">종합정보시스템</figcaption></a>
				</figure>

				</div>


        <div class="col-6" style="background-color: light;">
				<figure class="figure">
				  	<a href="https://cyber.shinhan.ac.kr/login.php"><button class="btn" id="btn" type="button"><img class="btn-img" src="../resources/img/cybercampus.png" style="max-width: 30%; height: auto;"></button>
				  <figcaption class="figure-caption text-center">사이버 캠퍼스</figcaption></a>
				</figure>

				</div>

        <div class="col-6" style="background-color: light;">
				<figure class="figure">
				  	<a href="http://lib.shinhan.ac.kr/lib/"><button class="btn" id="btn" type="button"><img class="btn-img" src="../resources/img/library.png" style="max-width: 30%; height: auto;"></button>
				  <figcaption class="figure-caption text-center">중앙 도서관</figcaption></a>
				</figure>

				</div>


        <div class="col-6" style="background-color: light;">
				<figure class="figure">
				  	<a href="http://sh.certpia.com"><button class="btn" id="btn" type="button"><img class="btn-img" src="../resources/img/certificate.png" style="max-width: 30%; height: auto;"></button>
				  <figcaption class="figure-caption text-center">인터넷 증명서</figcaption></a>
				</figure>

				</div>

      </div>
    </div>





	<div class="dropdown-divider" \ style="margin-top:1%"></div>







<%@ include file="include/footer.jsp" %>