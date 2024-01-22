<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="pl">
  <head>
    <jsp:include page="/WEB-INF/views/fragment/head.jsp"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/custom/login.css"/>" type="text/css"/>
    <title>Rejestracja</title>
  </head>

  <body>
    <jsp:include page="/WEB-INF/views/fragment/navigation.jsp"/>

    <section class="login-page d-flex justify-content-end align-items-center">
      <div class="col-lg-7 col-md-7 col-sm-12 col-xl-6 offset-xl-1 d-flex justify-content-center my-5">
        <form:form modelAttribute="registeredUser" method="post" accept-charset="UTF-8">
          <p class="log-reg-title">Rejestracja</p>

          <!-- First name input -->
          <spring:bind path="firstName">
            <div class="form-outline ${status.error ? 'has-error' : ''}">
              <form:input path="firstName" class="form-control" id="loginFormFirstName" />
              <label class="form-label" for="loginFormFirstName">Imię</label>
            </div>
            <form:errors path="firstName"
              cssClass="error ${status.error ? 'has-error' : ''}" element="p"/>
          </spring:bind>

          <!-- Last name input -->
          <spring:bind path="lastName">
            <div class="form-outline mt-4 ${status.error ? 'has-error' : ''}">
              <form:input path="lastName" class="form-control" id="loginFormLastName" />
              <label class="form-label" for="loginFormLastName">Nazwisko</label>
            </div>
            <form:errors path="lastName"
              cssClass="error ${status.error ? 'has-error' : ''}" element="p"/>
          </spring:bind>

          <!-- Email input -->
          <spring:bind path="email">
            <div class="form-outline mt-4 ${status.error ? 'has-error' : ''}">
              <form:input type="email" path="email" class="form-control" id="loginFormNewEmail" />
              <label class="form-label" for="loginFormNewEmail">Email</label>
            </div>
            <form:errors path="email"
              cssClass="error ${status.error ? 'has-error' : ''}" element="p"/>
          </spring:bind>

          <!-- Password input -->
          <spring:bind path="password">
            <div class="form-outline mt-4 ${status.error ? 'has-error' : ''}">
              <form:input type="password" path="password" class="form-control" id="loginFormNewPassword" />
              <label class="form-label" for="loginFormNewPassword">Hasło</label>
            </div>
            <form:errors path="password"
              cssClass="error ${status.error ? 'has-error' : ''}" element="p"/>
          </spring:bind>

          <!-- Confirm password input -->
          <spring:bind path="confirmPassword">
            <div class="form-outline mt-4">
              <form:input type="password" path="confirmPassword" class="form-control" id="loginFormConfirmPassword" />
              <label class="form-label" for="loginFormConfirmPassword">Powtórz hasło</label>
            </div>
            <form:errors path="confirmPassword"
              cssClass="error ${status.error ? 'has-error' : ''}" element="p"/>
          </spring:bind>

          <!-- Submit button -->
          <button type="submit" class="mt-4 btn bg-darkseagreen btn-lg btn-block">Zarejestruj się</button>

          <!-- Sign in buttons -->
          <div class="text-center mt-4">
            <p>Masz już konto? <a href="${contextPath}/login" class="text-green-50 fw-bold">Zaloguj się</a></p>
          </div>
        </form:form>
      </div>
    </section>

    <jsp:include page="/WEB-INF/views/fragment/java-scripts.jsp"/>
  </body>
</html>