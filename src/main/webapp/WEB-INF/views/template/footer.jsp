<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 공통 Javascript -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/vendor/bootstrap-4.1.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/vendor/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/vendor/owl-carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/vendor/ion.rangeSlider.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	
<!-- Footer Area Starts -->
<footer class="footer-area section-padding">
	<div class="footer-widget">
		<div class="container"></div>
	</div>
	<div class="footer-copyright">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-6">
					<span> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;<script>
							document.write(new Date().getFullYear());
						</script> All rights reserved | This template is made with <i
						class="fa fa-heart-o" aria-hidden="true"></i> by <a
						href="https://colorlib.com" target="_blank">Colorlib</a> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</span>
				</div>
			</div>
		</div>
	</div>
	<a id="MOVE_TOP_BTN" href="#"> <img
		src="<c:url value="/resources/assets/images/btn_up_light.png"/>">
	</a>
	<script>
		$(function() {
			$(window).scroll(function() {
				if ($(this).scrollTop() > 100) {
					$('#MOVE_TOP_BTN').fadeIn();
				} else {
					$('#MOVE_TOP_BTN').fadeOut();
				}
			});

			$("#MOVE_TOP_BTN").click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 400);
				return false;
			});
		});
	</script>
</footer>
<!-- Footer Area End -->