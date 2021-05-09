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
  <link href="${pageContext.request.contextPath}/assets/img/favicon.ico" rel="icon">
  <link href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,400,500,600,700" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
</head>
<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center header-transparent">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="${pageContext.request.contextPath}/main">AbanDog</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="nav-link scrollto active" href="${pageContext.request.contextPath}/main">Home</a></li>
          <li class="dropdown"><a href="#"><span>Search Dogs</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="${pageContext.request.contextPath}/searchbyimage">Search Dogs by image</a></li>
              <li><a href="${pageContext.request.contextPath}/searchbycategory">Search Dogs by category</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="#"><span>About</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
	          <li><a class="nav-link scrollto" href="${pageContext.request.contextPath}/aboutus">About Us</a></li>
	          <li><a class="nav-link scrollto" href="${pageContext.request.contextPath}/aboutdogs">About Abandoned dogs</a></li>
	          <li><a class="nav-link scrollto" href="#footer">Contact</a></li>
            </ul>
          </li>
          <c:choose>
          	<c:when test="${loginVO == null}">
	          <li><a class="nav-link scrollto" href="${pageContext.request.contextPath}/logIn">Log In</a></li>  	
          	</c:when>
          	<c:otherwise>
          	  <li><a class="nav-link scrollto" href="${pageContext.request.contextPath}/mypage?uid=${loginVO.uid}">My Page</a></li>
          	  <li><a class="nav-link scrollto" href="${pageContext.request.contextPath}/logout">Log Out</a></li>
          	</c:otherwise>
          </c:choose>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
<c:choose>
	<c:when test="${loginVO == null}">
		<script type="text/javascript">
			alert("로그인이 필요합니다.");
			location.href='logIn';	
		</script>
	</c:when>
	<c:otherwise>
	
	  <!-- ======= Hero Section ======= -->
	  <section id="hero" class="clearfix" style="height:50vh">
	      <div class="row justify-content-center align-self-center" data-aos="fade-up">
	        <div class="col-lg-6 intro-info order-lg-first order-last" data-aos="zoom-in" data-aos-delay="100">
	          <h2><span>${loginVO.name }</span>님의 마이페이지</h2>
	          <h4>회원님의 정보와 저장한 강아지들을 확인하실 수 있습니다.</h4>
	        </div>
	      </div>
	
	  </section><!-- End Hero -->
	  
	  <main id="main">
	  
	<!-- ======= Team Section ======= -->
    <section id="team" class="team section-bg">
      <div class="container" data-aos="fade-up">
        <div class="row">
        
        <div class="col-sm-4"></div>
        <div class="col-sm-4">
	        <div class="form">
	
	           <form name="joinfrm" action="updtMember" method="post" role="form" class="php-email-form">
	             <div class="form-group">
	               <input type="text" name="name" class="form-control" id="name" value="${loginVO.name }" readonly>
	             </div>
	             <div class="form-group mt-3">
			        <input type="email" class="form-control" name="email" id="email" value="${loginVO.email }" readonly>
	             </div>
	             <div class="form-group mt-3">
		          	<input type="text" class="form-control" name="id" id="id" value="${loginVO.id }" readonly>
	             </div>
	             <div class="form-group mt-3">
	               <input type="password" class="form-control" name="pw" id="pw" placeholder="비밀번호">
	             </div>
	             <div class="form-group mt-3">
	               <input type="password" class="form-control" name="pw2" id="pw2" placeholder="비밀번호확인" >
	             </div>
	
	             <div class="my-3">

	             </div>
	
	             <div class="text-center"><button type="button" onclick="checkAll()">수정</button></div>
	           </form>
	
	         </div>
         </div>
         
         <div class="col-sm-4"></div>

        </div>		

      </div>
    </section><!-- End Team Section -->
    
    <!-- ======= Team Section ======= -->
    <section id="team" class="team section-bg">
      <div class="container" data-aos="fade-up">
          <div class="section-header">
          	<h3>저장한 강아지 목록</h3>
          </div>
          <br><br>
        <div class="row">
        
		<input type="hidden" id="page" value="${page}">
		  
        <div class="row" id="result"></div>
        
        <article id="paging" class="paging"></article>
	</div>

      </div>
    </section><!-- End Team Section -->
	
	  </main><!-- End #main -->
	
	</c:otherwise>
</c:choose>


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
                  <p>이제 사지 말고 입양하세요. <br> 유기견들이 당신을 기다리고 있어요!</p>
                </div>
              </div>

              <div class="col-sm-4">
                <div class="footer-links">
                  <h4>Contact Us</h4>
                  <p>
                                   중앙대학교 <br>
                                   서울특별시 동작구 흑석동 흑석로 84<br>
                                   대한민국 <br>
                    <strong>Phone:</strong> 010-5914-9393<br>
                    <strong>Email:</strong> b2nyb2st77@gmail.com<br>
                  </p>
                </div>
                
                <div class="social-links">
                  <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                  <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                  <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
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
  </footer><!-- End  Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/assets/vendor/aos/aos.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/php-email-form/validate.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/purecounter/purecounter.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
  
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.0.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  
  <script>
  function checkAll(){
	  	var frm = document.joinfrm;
		var name = $("input#name").val();
		var pw = $("input#pw").val();
		var pw2 = $("input#pw2").val();
		
		var RegExp = /^[a-zA-z0-9]{4,12}$/;
		
		if (!RegExp.test(pw)) {
          alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다");
          document.getElementById("pw").focus();
      	} else if(pw != pw2){
			alert("비밀번호가 일치하지 않습니다.");
			document.getElementById("pw").focus();
		} else {
			frm.submit();
			alert("회원님의 정보가 수정되었습니다!");
		}		
	  
}
  $(document).ready(function(){
		var page = $("input#page").val();
	    loadPage(page);
	   	showPagination();
	 });
	
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
	
	// 페이지네이션
	function showPagination(){
		var html = "<ul>";
		var curPage = parseInt($("input#page").val());
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
		   	loadPage(curPage);
		   	showPagination();
		});
		
		$("#dogNext.next").click(function(){
			curPage = (calPage + 1) * 10 + 1;
			$("input#page").val(curPage);
			loadPage(curPage);
			showPagination();
		});
		
		$("#dogPrev.prev").click(function(){   
			curPage = (calPage - 1) * 10 + 1;
			$("input#page").val(curPage);
			loadPage(curPage);
			showPagination();
		});
	}
	 function loadPage(page) {
	    $.ajax({
	       url : "${pageContext.request.contextPath}/getMyDogList?page=" + page + "&uid=" + ${loginVO.uid},
	       type : "get",
	       dataType: 'json',
	       ontentType:  "application/json",
	       mimeType: 'application/json',
	       success : function(data, status) {
	           if(status == "success") {
	               if(updateList(data)) { // 페이지 업데이트
	                  $("input#page").val(page);
	               }
	           }
	       },
	       error: function(data, status, er) {
	           alert("[error] data : " + data + ", status : " + status);
	       }
	       
	    });
	 }
	 
	 function updateList(jsonObj) {
	 	 
	  	var result =  '';
	       
	       var count = jsonObj.count;
	       var items = jsonObj.list;
	       
	       if(count == 0){
	    	   result += '<div class="section-header">';
	    	   result += '<h5>저장한 강아지가 없습니다</h5>';
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
	</script>
  
</body>
</html>