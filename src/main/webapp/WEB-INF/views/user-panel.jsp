<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="pl">
  <head>
    <jsp:include page="/WEB-INF/views/fragment/head.jsp"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/login.css"/>" type="text/css"/>
    <title>Rejestracja</title>
  </head>

  <body>
    <jsp:include page="/WEB-INF/views/fragment/navigation.jsp"/>

    <section class="login-page">
      <div class="login-content col-md-7 col-lg-5 col-xl-5 offset-xl-1">
        <form:form modelAttribute="userFromSession" method="post" accept-charset="UTF-8">
          <p class="log-reg-title">Dane użytkownika</p>

          <c:if test="${userModificationStatus eq 'SUCCESS'}">
            <p class="text-danger">Poprawnie zaktualizowano dane użytkownika</p>
          </c:if>
          <%-- ID hidden input --%>
          <form:input path="id" type="hidden" />

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
          <button type="submit" class="mt-4 btn btn-success btn-lg btn-block">Zapisz</button>

          <!-- Remove account button -->
          <div class="text-center mt-4">
            <p><a href="${contextPath}/user/remove" class="text-green-50 fw-bold">Usuń konto</a></p>
          </div>
        </form:form>

        <c:if test="${userSaved}">
          <p>Zaktualizowano</p>
        </c:if>
      </div>
    </section>

    <jsp:include page="/WEB-INF/views/fragment/java-scripts.jsp"/>
  </body>
</html>