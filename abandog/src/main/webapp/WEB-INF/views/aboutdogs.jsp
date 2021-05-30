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
          <h2>About <span>Abandoned</span> Dogs</h2>
          <h4>유기견에 대해 궁금한 것들을 확인해 볼 수 있어요!</h4>
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
              <img src="assets/img/puppy.jpg" alt="">
            </div>
          </div>

          <div class="col-md-1">
          </div>

          <div class="col-lg-6 col-md-6">
            <div class="about-content" data-aos="fade-left" data-aos-delay="100">
              <h2>유기견 입양을 해야하는 이유</h2>
              <ul>
                <li><i class="bi bi-check-circle"></i> 다양한 종류의 강아지들 중에 선택할 수 있어요.</li>
                <li><i class="bi bi-check-circle"></i> 희귀한 유전자를 가진 특별한 강아지를 입양할 수 있어요.</li>
                <li><i class="bi bi-check-circle"></i> 보호소에 가장 많은 종인 믹스견은 순종보다 유전질환이 적어요.</li>
                <li><i class="bi bi-check-circle"></i> 돈을 절약할 수 있어요.</li>
                <li><i class="bi bi-check-circle"></i> 의료서비스를 지원받을 수 있어요. (중성화, 예방접종, 건강검사 등)</li>
                <li><i class="bi bi-check-circle"></i> 이미 훈련받은 강아지를 선택할 수 있어요.</li>
                <li><i class="bi bi-check-circle"></i> 펫샵에서 강아지를 구입하는 것은 강아지 공장을 지원하는 일이에요.</li>
                <li><i class="bi bi-check-circle"></i> 생명을 구할 수 있어요.</li>
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
              <h2>유기견 입양을 하기 전에 생각해 볼 것들</h2>
              <ul>
                <li><i class="bi bi-check-circle"></i> 모든 가족 구성원과 합의가 되어있나요?</li>
                <li><i class="bi bi-check-circle"></i> 반려견은 10~15년 이상, 길면 20년 이상 삽니다. 결혼, 임신, 유학, 이사 등으로 가정환경이 바뀌어도 끝까지 책임지고 보살필 수 있나요?</li>
                <li><i class="bi bi-check-circle"></i> 먹이, 관리, 치료, 중성화 시술, 훈련 등에 들어가는 경제적 부담을 짊어질 의사와 능력이 있나요?</li>
                <li><i class="bi bi-check-circle"></i> 반려동물을 위해 충분히 ‘공부’할 각오가 되어 있나요?</li>
                <li><i class="bi bi-check-circle"></i> 입양한 동물이 새로운 환경에 적응하기까지 인내심을 갖고 사랑으로 돌봐줄 수 있나요?</li>
              </ul>
            </div>
          </div>

          <div class="col-md-1">
          </div>

          <div class="col-lg-5 col-md-5">
            <div class="about-img" data-aos="fade-left" data-aos-delay="100">
              <img src="assets/img/dogs.jpg" alt="">
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
              <img src="assets/img/dogs2.jpg" alt="">
            </div>
          </div>

          <div class="col-md-1">
          </div>

          <div class="col-lg-6 col-md-6">
            <div class="about-content" data-aos="fade-left" data-aos-delay="100">
              <h2>위의 질문들에 모두 예라고 대답했다면, 유기견을 입양해보세요.</h2>
              <ul>
                <li><i class="bi bi-check-circle"></i> 보호소의 정확한 위치와 연락처를 확인하여 미리 문의하세요.</li>
                <li><i class="bi bi-check-circle"></i> 담당자 안내에 따라 사전 질문지나 양식에 답변을 작성하여 보내세요.</li>
                <li><i class="bi bi-check-circle"></i> 약속한 시간에 신청자가 직접 보호소에 방문하여 상담하고 입양 계약서를 작성하세요.</li>
                <li><i class="bi bi-check-circle"></i> 데려간 유기견을 끝까지 책임지고 보살필 수 있는지 확인하기 위해 심층면접을 거치는 곳도 있습니다.</li>
                <li><i class="bi bi-check-circle"></i> 입양 신청자 본인이 직접 방문해야 해요. (대리인 방문 불가)</li>
                <li><i class="bi bi-check-circle"></i> 입양 신청자와 함께 거주하는 모든 가족 구성원의 동의가 확인된 후에 입양이 가능해요.</li>
                <li><i class="bi bi-check-circle"></i> 미성년자는 보호자의 동의 및 인터뷰 절차 후 입양할 수 있어요.</li>
                <li><i class="bi bi-check-circle"></i> 집이 종일 비어 있어 입양동물을 돌봐줄 사람이 없으면 신청자에서 제외됩니다.</li>
                <li><i class="bi bi-check-circle"></i> 입양자의 주소(실거주지)나 연락처가 변경되었을 시 반드시 보호소에 통보해야 합니다.</li>
                <li><i class="bi bi-check-circle"></i> 입양된 동물은 양도, 판매, 학대, 유기할 수 없어요.</li>
              </ul>
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