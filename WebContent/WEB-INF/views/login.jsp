<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
<section id="login-content" class="login-content">
	<div class="awe-parallax bg-login-content"></div>

	<div class="awe-overlay"></div>

	<div class="container">
		<div class="row">

			<!-- FORM -->
			<div class="col-xs-12 col-lg-4 pull-right">
				<div class="form-login">
					<c:url var="loginUrl" value="/login" />
					<form action="${loginUrl}" method="post" class="form-horizontal">
						<c:if test="${param.error != null}">
							<div class="alert alert-danger">
								<p>Invalid username and password.</p>
							</div>
						</c:if>
						<c:if test="${param.logout != null}">
							<div class="alert alert-success">
								<p>You have been logged out successfully.</p>
							</div>
						</c:if> 

						<h2 class="text-uppercase">sign in</h2>

						<div class="form-email">
							<input type="text" id="username" name="ssoId" placeholder="Email">
						</div>

						<div class="form-password">
							<input type="password" id="password" name="password" placeholder="Password">
						</div>

						<!-- <div class="form-check">
							<input type="checkbox" id="check"> <label for="check">
								<i class="icon fa fa-check"></i> Remember me
							</label> <a href="#">Forget password?</a>
						</div> -->

						<div class="form-submit-1">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <input type="submit" value="Sign In"
								class="mc-btn btn-style-1">
						</div>

						<!-- <div class="link">
							<a href="/authentication/register"> <i
								class="icon fa fa-arrow-right"></i>Don'€™t have account yet ?
								Join Us
							</a>
						</div> -->
					</form>
				</div>
			</div>
			<!-- END / FORM -->

			<div class="image">
				<img src="images/homeslider/img-thumb.png" alt="">
			</div>

		</div>
	</div>
</section>
