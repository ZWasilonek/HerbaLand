<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="pl">
	<head>
		<jsp:include page="/WEB-INF/views/fragment/head.jsp"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/custom/login.css"/>" type="text/css"/>
		<title>Logowanie</title>
	</head>

	<body>
    <jsp:include page="/WEB-INF/views/fragment/navigation.jsp"/>

		<section class="login-page d-flex justify-content-end align-items-center">
      <div class="col-lg-7 col-md-7 col-sm-12 col-xl-6 offset-xl-1 d-flex justify-content-center my-5">
        <form:form modelAttribute="loginUser" method="post" accept-charset="UTF-8">
          <p class="log-reg-title">Logowanie</p>

          <!-- Email input -->
          <div class="form-outline">
            <form:input type="email" path="email" class="form-control" id="loginFormEmail"/>
            <label class="form-label" for="loginFormEmail">Email</label>
          </div>

          <!-- Password input -->
          <div class="form-outline mt-4">
            <form:input type="password" path="password" class="form-control" id="loginFormPassword"/>
            <label class="form-label" for="loginFormPassword">Hasło</label>
          </div>

          <!-- Validation error -->
          <c:if test="${param.error != null}">
            <div class="login-error">
              Nieprawidłowy login lub hasło.<br>
            </div>
          </c:if>

          <div class="d-flex justify-content-around align-items-center mt-4">
            <!-- Checkbox -->
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="loginFormCheckbox" checked />
              <label class="form-check-label" for="loginFormCheckbox"> Zapamiętaj wybór </label>
            </div>
            <a href="#!">Zapomniałeś hasła?</a>
          </div>

          <!-- Submit button -->
          <button type="submit" class="my-4 btn bg-darkseagreen btn-lg btn-block">Zaloguj się</button>

          <!-- Register buttons -->
          <div class="text-center">
            <p>Nie masz konta? <a href="${contextPath}/register" class="text-green-50 fw-bold">Załóż konto</a></p>
            <p>lub zaloguj się przez:</p>
            <button type="button" class="btn btn-link btn-floating m-1">
              <i class="fab fa-facebook-f"></i>
            </button>

            <button type="button" class="btn btn-link btn-floating m-1">
              <i class="fab fa-google"></i>
            </button>

            <button type="button" class="btn btn-link btn-floating m-1">
              <i class="fab fa-github"></i>
            </button>
          </div>
        </form:form>
      </div>
		</section>

    <jsp:include page="/WEB-INF/views/fragment/java-scripts.jsp"/>
	</body>
</html>