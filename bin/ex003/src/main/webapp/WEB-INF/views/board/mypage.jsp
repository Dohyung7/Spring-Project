<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../include/header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width",initial-scale="1">

<style>

.uploadResult {
width: 100%;
background-color: gray;
}

.uploadResult ul {
display: flex;
flex-flow: row;
justify-content: center;
align-items: center;
}

.uploadResult ul li {
list-style: none;
padding: 10px;
}

.uploadResult ul li img {
width: 100px;
}

</style>

<style>

.bigPictureWrapper {
position: absolute;
display: none;
justify-content: center;
align-items: center;
top:0%;
width:100%;
height:100%;
background-color: gray;
z-index: 100;
}

.bigPicture {
position: relative;
display:flex;
justify-content: center;
align-items: center;
}

</style>

<div class="container">
  <div class="row">

   <div class="card col-12" >
   <div class=" card-header">마이페이지
   </div>
     <div class="card-body">
     <form>
     <div class="form-group row">
       <label for="inputEmail3" class="col-sm-3 col-form-label">학번/사번</label>
       <div class="col-sm-9">
         <input type="email" class="form-control" id="inputEmail3" placeholder="학번/사번">
       </div>
     </div>
     <div class="form-group row">
       <label for="inputEmail3" class="col-sm-3 col-form-label">이름</label>
       <div class="col-sm-9">
         <input type="email" class="form-control" id="inputEmail3" placeholder="이름">
       </div>
     </div>
     <div class="form-group row">
       <label for="inputPassword3" class="col-sm-3 col-form-label">비밀번호</label>
       <div class="col-sm-9">
         <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
       </div>
     </div>
     <div class="form-group row">
       <label for="inputPassword3" class="col-sm-3 col-form-label">비밀번호 확인</label>
       <div class="col-sm-9">
         <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
       </div>
     </div>

  </form>
   </div>
  </div>

</div>

   <div class="card-body">

   </div>
   <div class="text-right">
   <button type="submit" class="btn btn-outline-secondary ">수정</button>
   <button type="reset" class="btn btn-outline-secondary ">취소</button>
   </div>




</div>



<!--  <script>
	CKEDITOR.replace( 'editor1' ,{
		filebrowserUploadUrl :"/imageUpload.do"
	});


</script> -->

<script>

$(document).ready(function(e){
 function showUploadResult(uploadResultArr){

  if(!uploadResultArr || uploadResultArr.length == 0){return; }
  var uploadUL = $(".uploadResult ul");
  var str = "";
  $(uploadResultArr).each(function(i, obj){
   if(obj.image){
    var fileCallPath = encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
    str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
    str += "<span>" + obj.fileName+"</span>";
    str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
    str += "<img src='/load/display?fileName="+fileCallPath+"'>";
    str += "</div>";
    str + "</li>";
   } else {
    var fileCallPath = encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");

    str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
    str += "<span>" + obj.fileName+"</span>";
    str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
    str += "<img src='/resources/img/attach.png'></a>";
    str += "</div>";
    str + "</li>";
   }
  });
  uploadUL.append(str);
 }
 var formObj = $("form[role='form']");
 $("button[type='submit']").on("click",function(e){
  e.preventDefault();
  console.log("submit clicked");
  var str ="";
  $(".uploadResult ul li").each(function(i, obj){
   var jobj = $(obj);
   console.dir(jobj);
   console.log(jobj);
   str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
   str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
   str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
   str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
  });
  console.log(str);
  formObj.append(str).submit();
 });

 $(".uploadResult").on("click","button",function(e){

  console.log("delete file");

  var targetFile = $(this).data("file");
  var type = $(this).data("type");
  var targetLi = $(this).closest("li");

  $.ajax({
   url:'/load/deleteFile',
   data: {fileName: targetFile, type:type},
   dataType:'text',
   type: 'POST',
    success: function(result){
     alert(result);
     targetLi.remove();
    }
  });
 });

 var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");//업로드 제한하기  저거는 업로드 할 수 없다
 var maxSize = 524288000; //5MB
 function checkExtension(fileName, fileSize){
  if(fileSize >= maxSize){
   alert("파일 사이즈 초과");00
   return false;
  }

  if(regex.test(fileName)){
   alert("해당 종류의 파일은 업로드할 수 없습니다.");
   return false;
  }
  return true;
 }

 $("input[type='file']").change(function(e){
  var formData = new FormData();
  var inputFile = $("input[name='uploadFile']");
  var files = inputFile[0].files;
  for(var i =0; i<files.length; i++){
   if(!checkExtension(files[i].name, files[i].size)){
    return false;
   }
   formData.append("uploadFile",files[i]);
  }
  $.ajax({
   url: '/load/uploadAjaxAction',
    processData: false,
    contentType: false,
    data: formData,
    type: 'POST',
    dataType:'json',
    success: function(result){
     console.log(result);
     showUploadResult(result);// 업로드 결과 처리 함수 실행
    }
  });
 });
});



</script>