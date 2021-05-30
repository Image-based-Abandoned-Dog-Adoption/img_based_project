<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
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
          <c:choose>
          	<c:when test="${loginVO == null}">
              <li class="dropdown"><a href="#"><span>Search Dogs</span> <i class="bi bi-chevron-down"></i></a>
                <ul>
                  <li><a href="${pageContext.request.contextPath}/searchbycategory">Search Dogs by category</a></li>
                </ul>
              </li>
          	</c:when>
          	<c:otherwise>
              <li class="dropdown"><a href="#"><span>Search Dogs</span> <i class="bi bi-chevron-down"></i></a>
                <ul>
                  <li><a href="${pageContext.request.contextPath}/searchbyimage">Search Dogs by image</a></li>
                  <li><a href="${pageContext.request.contextPath}/searchbycategory">Search Dogs by category</a></li>
                </ul>
              </li>
            </c:otherwise>
          </c:choose>
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
          <h2>About <span>AbanDog</span></h2>
          <h4>Abandog 웹사이트에 대한 설명을 볼 수 있어요!</h4>
        </div>
      </div>

  </section><!-- End Hero -->

  <main id="main">

  	<!-- ======= About Section ======= -->
    <section id="about" class="about">

      <div class="container" data-aos="fade-up">
        <div class="row">

          <div class="col-lg-5 col-md-5">
            <div class="about-img" data-aos="fade-right" data-aos-delay="100">
              <img src="assets/img/searchdogsbyimage.jpg" alt="">
            </div>
          </div>

          <div class="col-md-1">
          </div>

          <div class="col-lg-6 col-md-6">
            <div class="about-content" data-aos="fade-left" data-aos-delay="100">
              <h2>이미지로 강아지 검색하기</h2>
              <ul>
                <li><i class="bi bi-check-circle"></i> 원하는 강아지의 상이 있나요? 비슷하게 생긴 강아지들을 검색해볼 수 있어요!</li>
                <li><i class="bi bi-check-circle"></i> 원하는 이미지를 삽입하면 가장 비슷한 강아지들을 찾아볼 수 있습니다.</li>
              </ul>
            </div>
          </div>
        </div>
      </div>

    </section><!-- End About Section -->

	<!-- ======= About Section ======= -->
    <section id="about" class="about">

      <div class="container" data-aos="fade-up">
        <div class="row">

          <div class="col-lg-6 col-md-6">
            <div class="about-content" data-aos="fade-right" data-aos-delay="100">
              <h2>카테고리별로 강아지 검색하기</h2>
              <ul>
                <li><i class="bi bi-check-circle"></i> 카테고리별로 강아지를 검색해볼 수 있어요! (성별, 중성화여부, 보호소위치 등)</li>
                <li><i class="bi bi-check-circle"></i> 단, 중성화된 강아지들의 수는 적다는 것에 유의하세요. 검색결과가 나오지 않을 수 있습니다.</li>
                <li><i class="bi bi-check-circle"></i> 특징을 순, 또는 온순으로 검색하면 순한 강아지들을 찾아볼 수 있어요.</li>
              </ul>
            </div>
          </div>

          <div class="col-md-1">
          </div>

          <div class="col-lg-5 col-md-5">
            <div class="about-img" data-aos="fade-left" data-aos-delay="100">
              <img src="assets/img/searchdogsbycategory.jpg" alt="">
            </div>
          </div>

        </div>
      </div>

    </section><!-- End About Section -->

    <!-- ======= About Section ======= -->
    <section id="about" class="about">

      <div class="container" data-aos="fade-up">
        <div class="row">

          <div class="col-lg-5 col-md-5">
            <div class="about-img" data-aos="fade-right" data-aos-delay="100">
              <img src="assets/img/searchdog.jpg" alt="">
            </div>
          </div>

          <div class="col-md-1">
          </div>

          <div class="col-lg-6 col-md-6">
            <div class="about-content" data-aos="fade-left" data-aos-delay="100">
              <h2>강아지 정보 확인하기</h2>
              <ul>
                <li><i class="bi bi-check-circle"></i> 검색한 강아지 중 정보를 확인해보고 싶은 강아지가 있다면 클릭해보세요!</li>
                <li><i class="bi bi-check-circle"></i> 강아지에 대한 상세정보를 확인해 볼 수 있어요.</li>
              </ul>
            </div>
          </div>
        </div>
      </div>

    </section><!-- End About Section -->

    <!-- ======= About Section ======= -->
    <section id="about" class="about">

      <div class="container" data-aos="fade-up">
        <div class="row">

          <div class="col-lg-6 col-md-6">
            <div class="about-content" data-aos="fade-right" data-aos-delay="100">
              <h2>강아지 정보 확인하기</h2>
              <ul>
                <li><i class="bi bi-check-circle"></i> 이렇게 강아지에 대한 상세정보를 확인할 수 있습니다.</li>
                <li><i class="bi bi-check-circle"></i> 입양하고 싶다면 해당 보호소로 전화해보세요!</li>
              </ul>
            </div>
          </div>

          <div class="col-md-1">
          </div>

          <div class="col-lg-5 col-md-5">
            <div class="about-img" data-aos="fade-left" data-aos-delay="100">
              <img src="assets/img/doginfo.jpg" alt="">
            </div>
          </div>

        </div>
      </div>

    </section><!-- End About Section -->

    <!-- ======= About Section ======= -->
    <section id="about" class="about">

      <div class="container" data-aos="fade-up">
        <div class="row">

          <div class="col-lg-5 col-md-5">
            <div class="about-img" data-aos="fade-right" data-aos-delay="100">
              <img src="assets/img/savedog.jpg" alt="">
            </div>
          </div>

          <div class="col-md-1">
          </div>

          <div class="col-lg-6 col-md-6">
            <div class="about-content" data-aos="fade-left" data-aos-delay="100">
              <h2>강아지 저장하기</h2>
              <ul>
                <li><i class="bi bi-check-circle"></i> 검색한 강아지 중 마음에 드는 강아지가 있다면 저장해보세요!</li>
                <li><i class="bi bi-check-circle"></i> 마이페이지에서 저장한 강아지들을 확인해볼 수 있어요.</li>
                <li><i class="bi bi-check-circle"></i> 이 서비스는 로그인이 필요한 서비스예요.</li>
              </ul>
            </div>
          </div>
        </div>
      </div>

    </section><!-- End About Section -->

    <!-- ======= About Section ======= -->
    <section id="about" class="about">

      <div class="container" data-aos="fade-up">
        <div class="row">

          <div class="col-lg-6 col-md-6">
            <div class="about-content" data-aos="fade-right" data-aos-delay="100">
              <h2>유기견 입양에 대한 정보 확인하기</h2>
              <ul>
                <li><i class="bi bi-check-circle"></i> 유기견을 입양해야 되는 이유</li>
                <li><i class="bi bi-check-circle"></i> 유기견을 입양하기 전에 고려해야 되는 것들</li>
                <li><i class="bi bi-check-circle"></i> 유기견을 입양하는 절차와 유의사항 등을 확인해 볼 수 있어요!</li>
              </ul>
            </div>
          </div>

          <div class="col-md-1">
          </div>

          <div class="col-lg-5 col-md-5">
            <div class="about-img" data-aos="fade-left" data-aos-delay="100">
              <img src="assets/img/aboutdogs.jpg" alt="">
            </div>
          </div>

        </div>
      </div>

    </section><!-- End About Section -->

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
</body>
</html>