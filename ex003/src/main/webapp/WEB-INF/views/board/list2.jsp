<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@ include file="../include/header.jsp" %>

<style>
table{
  table-layout: fixed;
}
.input-group{
	margin-left:5%;
}

</style>
	<!-- 메인 보드 -->
	<div class="container">
		<div class="row">
			<div class="card col-12" >
			<div class="card-header row">

          <ul class="navbar-nav flex-row" >
              <li class="nav-item" style="padding-left:12px" >
              <a class="nav-link " href="../board/list" onclick="">전체</a>
              </li>
              <li class="nav-item" style="padding-left:12px">
              <a class="nav-link " href="../board/list1" onclick="">1학년</a>
              </li>
              <li class="nav-item" style="padding-left:12px">
              <a class="nav-link " href="../board/list2" onclick="">2학년</a>
              </li>
              <li class="nav-item" style="padding-left:12px">
              <a class="nav-link " href="../board/list3" onclick="">3학년</a>
              </li>
              <li class="nav-item" style="padding-left:12px">
              <a class="nav-link" href="../board/list4" onclick="ga('send', 'event', 'Navbar', 'Community links', 'Themes');"  rel="noopener">4학년</a>
              </li>
            </ul>

            <button id='regBtn' type="button" class="btn btn-light ml-auto">글쓰기</button>
        </div>
			  <!-- <div class="card-header row">
			  	<h5 class="col align-self-start">공지 사항</h5>
			  	<button id='regBtn' type="button" class="btn btn-light col-auto">글쓰기</button>
			  </div> -->
			  <div class="card-body">
	  			  <table class="table table-bordered table-sm table-hover ">
					  <thead>
					    <tr>
					      <th scope="col" colspan="3" class="text-center">번호</th>
					      <th scope="col" colspan="5" class="text-center">제목</th>
					      <th scope="col" colspan="3" class="text-center">작성자</th>
					      <th scope="col" colspan="3" class="text-center">작성일</th>
					      <!--  <th scope="col" colspan="1" class="text-center">수정일</th> -->
					    </tr>
					  </thead>
					  <tbody>
						  <c:forEach items="${list }" var="board">
						  	<tr>
						  		<td scope="row" colspan="3" class="text-center "><c:out value="${board.bno }"/></td> 
						  		<th colspan="5" class="text-center ">
						  			<a class='move ' href='<c:out value="${board.bno }"/>'><c:out value="${board.title }"/></a>
						  			<%--  <span class="badge badge-light"><c:out value="${board.replyCnt }"/></span> --%>
					  			</th>
						  		<td colspan="3" class="text-center "><c:out value="${board.writer }"/></td>
						  		<td colspan="3" class="text-center text-sm"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/></td>
						  		<%-- <td colspan="1" class="text-center "><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }"/></td> --%>
						  	</tr>
						  	
						  </c:forEach>
					  </tbody>  
				</table>
				<form id='searchForm' action="/board/list" method='get'>
				<div class="container">	
					<div class="input-group form-row ">
					<div class="col-4">
  						<select class="custom-select" id="inputGroupSelect04" aria-label="Example select with button addon" name='type'>
						    <option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>선택</option>
						    <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
						    <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
						    <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
						    <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
						    <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자</option>
						    <option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'?'selected':''}"/>>제목 or 내용 or 작성자</option>
  						</select>
					</div>
					<div class="col-5">
						<div class="input-group-append">
							<input type="text" class="form-control" aria-label="Text input with dropdown button" 
							name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'/>
							<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum }"/>'>
							<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount }"/>'>
							
						</div>
						</div>
						<div class="col-3">
						<button class="btn btn-outline-secondary" type="button">검색</button>
						</div>
					</div>
				</div>
				
				</form>
				<br>
				
				
				<nav aria-label="Page navigation example">
				  <ul class="pagination pagination-sm justify-content-center ">
				  	<c:if test="${pageMaker.prev }">
					    <li class="page-item ">
					      <a class="page-link" href="${pageMaker.startPage -1 }">&lt;</a>
					    </li>
				    </c:if>
				    <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
					    <li class="page-item ${pageMaker.cri.pageNum == num ? "active":""} "><a class="page-link " href="${num }">${num }</a></li>
					    <li class="page-item active" aria-current="page">
					    </li>
				    </c:forEach>
				    <c:if test="${pageMaker.next }">
				    <li class="page-item">
				      <a class="page-link" href="${ pageMaker.endPage +1}">&gt;</a>
				    </li>
				    </c:if>
				  </ul>
				</nav>
				
				
				
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title">Modal title</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <p>처리가 완료되었습니다.</p>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				      
				      </div>
				    </div>
				  </div>
	
				</div>
			</div>	
		</div>
		</div>
	</div>
<form id='actionForm' action="/board/list" method='get'>
	<input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum }'>
	<input type='hidden' name='amount' value = '${pageMaker.cri.amount }'>
	<input type='hidden' name='type' value = '<c:out value="${pageMaker.cri.type }"/>'>
	<input type='hidden' name='keyword' value = '<c:out value="${pageMaker.cri.keyword }"/>'>
</form>

<script type="text/javascript">
	 $(document).ready(function(){
		var result = '<c:out value="${result}"/>';
		
		checkModal(result);
		
		history.replaceState({},null,null);
		
		function checkModal(result){
			
			if(result === '' || history.state){
				return;
			}
			if (parseInt(result)>0){
				$(".modal-body").html("게시글" + parseInt(result)+"번이 등록되었습니다.");
			}
			$("#myModal").modal("show");
		}
		
		$("#regBtn").on("click", function(){
			self.location = "/board/register";
		});
		
		var actionForm = $("#actionForm");
		
		$(".page-item a").on("click", function(e){
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$(".move").on("click", function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/board/get");
			actionForm.submit();
		});
		
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click", function(e){
			
			
			if(!searchForm.find("option:selected").val()){
				alert("검색종류를 선택하세요");
				return false;
			}
			
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			
			searchForm.submit();
		});
	});
</script>

	

	

<%@ include file="../include/footer.jsp" %>