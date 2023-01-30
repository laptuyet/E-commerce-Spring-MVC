<%@ page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!-- Section: Social media -->
<section
	class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
	<!-- Left -->
	<div class="me-5 d-none d-lg-block">
		<span><s:message code="footer.connect.title"/></span>
	</div>
	<!-- Left -->

	<!-- Right -->
	<div>
		<a href="https://www.facebook.com/hoangphi.2104/" target="_blank"
			class="me-4 text-reset"><i class="fab fa-facebook-f"></i></a>
	</div>
	<!-- Right -->
</section>
<!-- Section: Social media -->

<!-- Section: Links  -->
<section class="">
	<div class="container text-center text-md-start mt-5">
		<!-- Grid row -->
		<div class="row mt-3">
			<!-- Grid column -->
			<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
				<!-- Content -->
				<h6 class="text-uppercase fw-bold mb-4">
					<i class="fas fa-gem me-3"></i>Skate Me
				</h6>
				<p>Here you can use rows and columns to organize your footer
					content. Lorem ipsum dolor sit amet, consectetur adipisicing elit.
				</p>
			</div>
			<!-- Grid column -->

			<!-- Grid column -->
			<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
				<!-- Links -->
				<h6 class="text-uppercase fw-bold mb-4">SkateMe</h6>
				<p>
					<a href="home/index" class="text-reset"><span><s:message code="footer.home"/></span></a>
				</p>
				<p>
					<a href="product/all" class="text-reset"><s:message code="footer.product"/></a>
				</p>
				<p>
					<a href="product/accessories" class="text-reset"><s:message code="footer.accessory"/></a>
				</p>
				<%-- <p>
					<a href="home/about" class="text-reset"><s:message code="footer.about"/></a>
				</p> --%>
			</div>
			<!-- Grid column -->

			<!-- Grid column -->
			<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
				<!-- Links -->
				<h6 class="text-uppercase fw-bold mb-4"><s:message code="footer.contact.title"/></h6>
				<p>
					<i class="fas fa-home me-3"></i><s:message code="footer.contact.addr"/>
				</p>
				<p>
					<i class="fas fa-envelope me-3"></i>tranhoangphi0987@gmail.com
				</p>
				<p>
					<i class="fas fa-phone me-3"></i> + 0987654321
				</p>
			</div>
			<!-- Grid column -->
		</div>
		<!-- Grid row -->
	</div>
</section>
<!-- Section: Links  -->
<!-- Grid container -->
<div class="container p-4 pb-0">
	<!-- Section: Form -->
	<section class="">
		<form action="">
			<!--Grid row-->
			<div class="row d-flex justify-content-center">
				<!--Grid column-->
				<div class="col-auto">
					<p class="pt-2">
						<strong><s:message code="footer.notify.title"/></strong>
					</p>
				</div>
				<!--Grid column-->

				<!--Grid column-->
				<div class="col-md-5 col-12">
					<!-- Email input -->
					<div class="form-outline mb-4">
						<input type="email" id="cusEmail" class="form-control" name="cusEmail"/> <label
							class="form-label" for="cusEmail"><s:message code="footer.notify.email"/></label>
					</div>
				</div>
				<!--Grid column-->

				<!--Grid column-->
				<div class="col-auto">
					<!-- Submit button -->
					<a role="button" class="btn btn-primary mb-4 sendNotify">
						<s:message code="footer.notify.submit"/></a>
				</div>
				<!--Grid column-->
			</div>
			<!--Grid row-->
		</form>
	</section>
	<!-- Section: Form -->
</div>
<!-- Grid container -->
<div class="container text-center">
	<p class="error cusMailError"></p>
	<p class="cusMailSuccess"></p>
</div>
<!-- Copyright -->
<div class="text-center p-4"
	style="background-color: rgba(0, 0, 0, 0.05);">
	© 2022 Copyright: <a class="text-reset fw-bold"
		href="https://www.facebook.com/hoangphi.2104/" target="_blank">Nhóm 21</a>
</div>
<!-- Copyright -->