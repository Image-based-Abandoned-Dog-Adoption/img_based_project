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
	          <li><a class="nav-link scrollto" href="${pageContext.request.contextPath}/aboutus">About AbanDog</a></li>
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


  <!-- ======= Hero Section ======= -->
  <section id="hero" class="clearfix" style="height:50vh">
      <div class="row justify-content-center align-self-center" data-aos="fade-up">
        <div class="col-lg-6 intro-info order-lg-first order-last" data-aos="zoom-in" data-aos-delay="100">
          <h2><span>?????????</span></h2>
          <h4>????????? ??? ????????? ??????????????? ???????????????!</h4>
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
	
	           <form name="joinfrm" method="post" role="form" class="php-email-form">
	             <div class="form-group">
	               <input type="text" name="id" class="form-control" id="id" placeholder="?????????" required="">
	             </div>
	             <div class="form-group mt-3">
	               <input type="password" class="form-control" name="pw" id="pw" placeholder="????????????" required="">
	             </div>
	
	             <div class="my-3">

	             </div>
	
	             <div class="text-center"><button type="button" onclick="checkLogin()">Log In</button></div>
	           </form>
	
	         </div>
         </div>
         
         <div class="col-sm-4"></div>

        </div>

      </div>
    </section><!-- End Team Section -->
	    
    <section id="about" class="about">
    	      
      <div class="container" data-aos="fade-up">
        <div class="row">

          <div class="col-sm-4">
            <div class="about-content" data-aos="fade-left" data-aos-delay="100">
              <h5>???????????? ????????????????</h5>
              
              <form name="findidfrm" method="post" role="form" class="php-email-form">
              	<div class="row">
					<div class="col-sm-9">
		             <div class="form-group">
		               <input type="text" name="name" class="form-control" id="name" placeholder="??????" required="">
		             </div>

		             <div class="form-group mt-3">
		               <input type="text" name="email" class="form-control" id="email" placeholder="?????????" required="">
		             </div>
	
		             <div class="my-3">
	
		             </div>
	             

	             	<div class="text-center"><button id="btn3" type="button" onclick="findID()">Find ID</button></div>
				
					</div>
				
				</div>	           
	           </form>

            </div>
          </div>
          
           <div class="col-sm-4">
            <div class="about-content" data-aos="fade-left" data-aos-delay="100">
              <h5>??????????????? ????????????????</h5>
              
              <form name="findpwfrm" method="post" role="form" class="php-email-form">
                <div class="row">
					<div class="col-sm-9">
		             <div class="form-group">
		               <input type="text" name="name" class="form-control" id="name2" placeholder="??????" required="">
		             </div>
		            
		             <div class="form-group mt-3">
		               <input type="text" name="email" class="form-control" id="email2" placeholder="?????????" required="">
		             </div>
		             <div class="form-group mt-3">
		               <input type="text" name="id" class="form-control" id="id2" placeholder="?????????" required="">
		             </div>
	
	             <div class="my-3">

	             </div>
	
	             <div class="text-center"><button id="btn3" type="button" onclick="findPW()">Find PW</button></div>
	           	
	           	</div>
	           	</div>
	           </form>

            </div>
          </div>
          
          <div class="col-sm-4">
            <div class="about-content" data-aos="fade-left" data-aos-delay="100">
              <h5>?????? AbanDog??? ????????? ????????????????</h5>
              <h6>?????????????????? AbanDog??? ???????????? ???????????????!</h6>
              
              <div class="text-center"><button id="btn3" type="button" onclick="location.href='join'">Join Us</button></div>

            </div>
          </div>
          
        </div>
      </div>
    
    </section>
	
  </main><!-- End #main -->

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
                  <p>?????? ?????? ?????? ???????????????. <br> ??????????????? ????????? ???????????? ?????????!</p>
                </div>
              </div>

              <div class="col-sm-4">
                <div class="footer-links">
                  <h4>Contact Us</h4>
                  <p>
                                   ??????????????? <br>
                                   ??????????????? ????????? ????????? ????????? 84<br>
                                   ???????????? <br>
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
  <script src="${pageContext.request.contextPath}/assets/vendor/purecounter/purecounter.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
  
  <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.10.0.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/jquery-1.7.1.min.js" type="text/javascript"></script>
  
  <script>
	  function checkLogin(){
		  
		  var id = $("input#id").val();
		  var pw = $("input#pw").val();
		  var data = {id:id, pw:pw}
		  
		  $.ajax({
		       url : "${pageContext.request.contextPath}/login",
		       type : "post",
		       data : data,
		       success : function(result) {
		           if(result == 'fail') {
		               alert("???????????? ?????? ??????????????????, ????????? ?????????????????????.");
		               document.getElementById("id").focus();
		           } else {
		        	   alert("Abandog??? ?????? ?????? ???????????????!");
		        	   location.href="main";
		           }
		       },
		       error: function(data, status, er) {
		    	   alert("???????????? ?????? ??????????????????, ????????? ?????????????????????.");
		       }
		       
		    });
		  
	  }
	  
	  function findID(){
		  
		  var name = $("input#name").val();
		  var email = $("input#email").val();
		  var data = {name:name, email:email}
		  
		  $.ajax({
		       url : "${pageContext.request.contextPath}/selectId",
		       type : "post",
		       data : data,
		       success : function(result) {
		           if(result == "") {
		               alert("???????????? ?????? ??????????????????, ????????? ???????????? ????????????. ?????? ??????????????????.");
		           } else {
		        	   alert("???????????? ???????????? " + result + "?????????.");
		           }
		       },
		       error: function(data, status, er) {
		    	   alert("???????????? ?????? ??????????????????, ????????? ???????????? ????????????. ?????? ??????????????????.");
		       }
		       
		    });
		  
	  }
	  
	  function findPW(){
		  
		  var name = $("input#name2").val();
		  var email = $("input#email2").val();
		  var id = $("input#id2").val();
		  var data = {name:name, email:email, id:id}
		  
		  $.ajax({
		       url : "${pageContext.request.contextPath}/selectPw",
		       type : "post",
		       data : data,
		       success : function(result) {
		           if(result == "fail") {
		               alert("???????????? ?????? ??????????????????, ????????? ???????????? ????????????. ?????? ??????????????????.");
		           } else {
		        	   alert("????????????????????? ??????????????????. ????????? ??? ??????????????? ??????????????????.");
		           }
		       },
		       error: function(data, status, er) {
		    	   alert("????????? ??????????????????. ??????????????? ?????? ????????????.");
		       }
		       
		    });
		  
	  }
  
  </script>
  
</body>
</html>