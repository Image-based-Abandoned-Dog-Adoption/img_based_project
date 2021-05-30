<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>AbanDog</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="${pageContext.request.contextPath}/assets/img/favicon.ico"
	rel="icon">
<link
	href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,400,500,600,700"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath}/assets/vendor/aos/aos.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/imgupload.css"
	rel="stylesheet">
</head>
<body>

	<!-- ======= Header ======= -->
	<header id="header"
		class="fixed-top d-flex align-items-center header-transparent">
		<div class="container d-flex align-items-center">

			<h1 class="logo me-auto">
				<a href="${pageContext.request.contextPath}/main">AbanDog</a>
			</h1>
			<!-- Uncomment below if you prefer to use an image logo -->
			<!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

			<nav id="navbar" class="navbar order-last order-lg-0">
				<ul>
					<li><a class="nav-link scrollto active"
						href="${pageContext.request.contextPath}/main">Home</a></li>
					<c:choose>
						<c:when test="${loginVO == null}">
							<li class="dropdown"><a href="#"><span>Search
										Dogs</span> <i class="bi bi-chevron-down"></i></a>
								<ul>
									<li><a
										href="${pageContext.request.contextPath}/searchbycategory">Search
											Dogs by category</a></li>
								</ul></li>
						</c:when>
						<c:otherwise>
							<li class="dropdown"><a href="#"><span>Search
										Dogs</span> <i class="bi bi-chevron-down"></i></a>
								<ul>
									<li><a
										href="${pageContext.request.contextPath}/searchbyimage">Search
											Dogs by image</a></li>
									<li><a
										href="${pageContext.request.contextPath}/searchbycategory">Search
											Dogs by category</a></li>
								</ul></li>
						</c:otherwise>
					</c:choose>
					<li class="dropdown"><a href="#"><span>About</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a class="nav-link scrollto"
								href="${pageContext.request.contextPath}/aboutus">About
									AbanDog</a></li>
							<li><a class="nav-link scrollto"
								href="${pageContext.request.contextPath}/aboutdogs">About
									Abandoned dogs</a></li>
							<li><a class="nav-link scrollto" href="#footer">Contact</a></li>
						</ul></li>
					<c:choose>
						<c:when test="${loginVO == null}">
							<li><a class="nav-link scrollto"
								href="${pageContext.request.contextPath}/logIn">Log In</a></li>
						</c:when>
						<c:otherwise>
							<li><a class="nav-link scrollto"
								href="${pageContext.request.contextPath}/mypage?uid=${loginVO.uid}">My
									Page</a></li>
							<li><a class="nav-link scrollto"
								href="${pageContext.request.contextPath}/logout">Log Out</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->

		</div>
	</header>
	<!-- End Header -->


	<!-- ======= Hero Section ======= -->
	<section id="hero" class="clearfix" style="height: 50vh">
		<div class="row justify-content-center align-self-center"
			data-aos="fade-up">
			<div class="col-lg-6 intro-info order-lg-first order-last"
				data-aos="zoom-in" data-aos-delay="100">
				<h2>
					강아지 <span>검색하기</span>
				</h2>
				<h4>이미지를 검색하여 원하는 강아지를 찾아보세요!</h4>
			</div>
		</div>

	</section>
	<!-- End Hero -->

	<main id="main"> <input type="hidden" id="page" value="${page}">
	<input type="hidden" id="gender" value="${gender}"> <input
		type="hidden" id="neuter" value="${neuter}"> <input
		type="hidden" id="location" value="${location}"> <!-- ======= Team Section ======= -->
	<section id="team" class="team section-bg">
		<div class="container" data-aos="fade-up">
			<div class="section-header"></div>
			<form action="imgUploadTest" id="imgUploadFrm" name="imgUploadFrm"
				method="post" enctype="multipart/form-data"
				onsubmit="return validateForm()">
				<div class="row" id="result">
					<script class="jsbin"
						src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
					<div class="file-upload">
						<button class="file-upload-btn" type="button"
							onclick="$('.file-upload-input').trigger( 'click' )">이미지
							추가</button>
						<div class="image-upload-wrap">
							<input class="file-upload-input" type='file' id="imgFile"
								name="imgFile" onchange="readURL(this);" accept="image/*" />
							<div class="drag-text">
								<h3>Drag image here</h3>
							</div>
						</div>
						<div class="file-upload-content">
							<img class="file-upload-image" src="#" alt="your image" />
							<div class="image-title-wrap">
								<button type="button" onclick="removeUpload()"
									class="remove-image">
									Remove <span class="image-title">Uploaded Image</span>
								</button>
							</div>
						</div>
					</div>
					<div style="text-align: center;">
						<input type="submit" value="검색" id="btn">
					</div>
				</div>
			</form>

			<article id="paging" class="paging"></article>

		</div>
	</section>
	<!-- End Team Section --> </main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="section-bg">
		<div class="footer-top">
			<div class="container">

				<div class="row">

					<div class="row">

						<div class="col-sm-4">
							<img src="assets/img/logo.png">
						</div>

						<div class="col-sm-4">
							<div class="footer-info">
								<h3>AbanDog</h3>
								<p>
									이제 사지 말고 입양하세요. <br> 유기견들이 당신을 기다리고 있어요!
								</p>
							</div>
						</div>

						<div class="col-sm-4">
							<div class="footer-links">
								<h4>Contact Us</h4>
								<p>
									중앙대학교 <br> 서울특별시 동작구 흑석동 흑석로 84<br> 대한민국 <br> <strong>Phone:</strong>
									010-5914-9393<br> <strong>Email:</strong>
									b2nyb2st77@gmail.com<br>
								</p>
							</div>

							<div class="social-links">
								<a href="#" class="twitter"><i class="bi bi-twitter"></i></a> <a
									href="#" class="facebook"><i class="bi bi-facebook"></i></a> <a
									href="#" class="instagram"><i class="bi bi-instagram"></i></a>
								<a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
							</div>

						</div>



					</div>

				</div>

			</div>

		</div>

		<div class="container">
			<div class="copyright">
				&copy; Copyright <strong>AbanDog</strong>. All Rights Reserved
			</div>
			<div class="credits">
				<!--
        All the links in the footer should remain intact.
        You can delete the links only if you purchased the pro version.
        Licensing information: https://bootstrapmade.com/license/
        Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Rapid
      -->
				Designed by Soobeen</a>
			</div>
		</div>
	</footer>
	<!-- End  Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script
		src="${pageContext.request.contextPath}/assets/vendor/aos/aos.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/php-email-form/validate.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/purecounter/purecounter.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendor/swiper/swiper-bundle.min.js"></script>

	<!-- Template Main JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/jquery-1.10.0.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery-1.7.1.min.js"
		type="text/javascript"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			/*
			var page = $("input#page").val();
			var gender = $("input#gender").val();
			var neuter = $("input#neuter").val();
			var location = $("input#location").val();
			loadPage(page, gender, neuter, location);
			showPagination();
			 */
		});
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('.image-upload-wrap').hide();
					$('.file-upload-image').attr('src', e.target.result);
					$('.file-upload-content').show();
					$('.image-title').html(input.files[0].name);
				};
				reader.readAsDataURL(input.files[0]);
			} else {
				removeUpload();
			}
		}
		function removeUpload() {
			$('.file-upload-input').val("");
			$('.file-upload-image').attr("src", "#");
			$('.file-upload-input')
					.replaceWith($('.file-upload-input').clone());
			$('.file-upload-content').hide();
			$('.image-upload-wrap').show();
		}
		$('.image-upload-wrap').bind('dragover', function() {
			$('.image-upload-wrap').addClass('image-dropping');
		});
		$('.image-upload-wrap').bind('dragleave', function() {
			$('.image-upload-wrap').removeClass('image-dropping');
		});
		//submit validation
		function validateForm() {
			var x = document.forms["imgUploadFrm"]["imgFile"].value;
			if (x == null || x == "") {
				alert("이미지를 첨부해주세요.");
				return false;
			}
			return true;
		}
		/* 이미지검증 세부페이지의 상세보기로 가기 */
		function view_result_detail() {
			document.imgRecogResultDetailFrm.action = "/imgRecog_result_detail.do";
			document.imgRecogResultDetailFrm.submit();
		};
		/*
		function search(){
			var frm = document.frm;
			var page = frm.page.value;
			var gender = frm.gender.value;
			var neuter = frm.neuter.value;
			var location = frm.location.value;
			
			frm.submit();
			loadPage(page, gender, neuter, location);
			showPagination();
		}
		 */
		/*
		// 페이지네이션
		function showPagination(){
			var html = "<ul>";
			var curPage = parseInt($("input#page").val());
			var gender = parseInt($("input#gender").val());
			var neuter = parseInt($("input#neuter").val());
			var location = parseInt($("input#location").val());
			var calPage = parseInt((curPage-1) / 10); 
			var pagesize = 0;
			var total = ${total};
			var totalPages = parseInt(total / 12) + 1;
			  
			if((calPage+1)*10 > total/12){
				pagesize = total/12 - (calPage)*10 +1;
			}else{
			  	pagesize = 10;
			}
			
			if(calPage != 0) {
				html += "<li class='prev' id='dogPrev'><a></a></li>";
			}
			 
			 for(var i = 1; i <=  pagesize; i++){
				if(curPage == calPage*10 + i){
					html +=   "<li class='num current' id='dogNum'><a>" + (calPage*10 + i) + "</a></li>";	   
				}else{
					html +=   "<li class='num' id='dogNum'><a>" + (calPage*10 + i) + "</a></li>";			   
				}	      
			 }
			    	      
			 if(calPage != parseInt(totalPages / 10)){
			    html += "<li class='next' id='dogNext'><a></a></li>";
			 }
			 html += '</ul>';
			 
			$("#paging").html(html);
			
			$("#dogNum.num").click(function(){   
			   	curPage = parseInt($(this).text());
				$("input#page").val(curPage);
			   	loadPage(curPage, gender, neuter, location);
			   	showPagination();
			});
			
			$("#dogNext.next").click(function(){
				curPage = (calPage + 1) * 10 + 1;
				$("input#page").val(curPage);
				loadPage(curPage, gender, neuter, location);
				showPagination();
			});
			
			$("#dogPrev.prev").click(function(){   
				curPage = (calPage - 1) * 10 + 1;
				$("input#page").val(curPage);
				loadPage(curPage, gender, neuter, location);
				showPagination();
			});
		}
		 */
		/*
		 function loadPage(page, gender, neuter, location) {
		    $.ajax({
		       url : "${pageContext.request.contextPath}/getDogList?page=" + page + "&gender=" + gender + "&neuter=" + neuter + "&location=" + location,
		       type : "get",
		       dataType: 'json',
		       ontentType:  "application/json",
		       mimeType: 'application/json',
		       success : function(data, status) {
		           if(status == "success") {
		               
		               if(updateList(data)) { // 페이지 업데이트
		                  $("input#page").val(page);
		                  $("input#gender").val(gender);
		                  $("input#neuter").val(neuter);
		                  $("input#location").val(location);
		               }
		           }
		       },
		       error: function(data, status, er) {
		           alert("[error] data : " + data + ", status : " + status);
		       }
		       
		    });
		 }
		 */
		/*
		function updateList(jsonObj) {
			 
		 	var result =  '';
		      
		      var count = jsonObj.count;
		      var items = jsonObj.list;
		      
		      if(count == 0){
		   	   result += '<div class="section-header">';
		   	   result += '<h5>검색결과가 없습니다</h5>';
		   	   result += '</div>';
		      }
		      else{
		       for(var i = 0; i < count; i++) {
		    	   
		    	   result += '<div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="100">';
		    	   result += '<div class="member">';
		    	   result += '<a href="dogInfo?cid=' + items[i].cid +'"><img src="' + items[i].img + '" class="dog_img"></a>';
		    	   result += '<div class="member-info">';
		    	   result += '<div class="member-info-content">';
		    	   result += '<h4>' + items[i].kind + ' ' + items[i].color + '</h4>';
		    	   result += '<span>' + items[i].careNm + '</span>';
		    	   result += '<span>' + items[i].age + '</span>';
		    	   result += '<span>';
		    	   if(items[i].sex == 'F'){
		    		   result += '암컷&nbsp';
		    	   } else if(items[i].sex == 'M'){
		    		   result += '수컷&nbsp';
		    	   } else {
		    		   result += '성별 미상&nbsp';
		    	   }
		    	   if(items[i].neuter == 'Y'){
		    		   result += '중성화 O';
		    	   } else if(items[i].neuter == 'N'){
		    		   result += '중성화 X';
		    	   } else {
		    		   result += '중성화여부 미상';
		    	   }
		    	   result += '</span></div></div></div></div>';	
		       }
		      }
		      $("#result").html(result); // 테이블 내용 업데이트
		      
		}
		 */
	</script>

</body>
</html>