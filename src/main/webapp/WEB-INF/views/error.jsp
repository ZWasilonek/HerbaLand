<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html lang="pl">
  <head>
    <jsp:include page="/WEB-INF/views/fragment/head.jsp"/>
    <title>Error</title>
  </head>

  <body class="bg-light">
    <jsp:include page="/WEB-INF/views/fragment/navigation.jsp"/>

    <div class="container">
      <div class="text-center mt-5 starter-template">
        <c:choose>
          <c:when test="${status != null}">
            <h1>HTTP Status ${status}</h1>
          </c:when>

          <c:otherwise>
            <h1>403 - Odmowa dostępu</h1>
          </c:otherwise>
        </c:choose>

        <div>Witaj
        <c:choose>
          <c:when test="${userFromSession != null && userFromSession.firstName != ''}">
             <c:out value="${userFromSession.firstName}"/>
          </c:when>

          <c:otherwise>
            <c:out value="Przybyszu"/>
          </c:otherwise>
        </c:choose>
        , nie masz zgody na dostęp do tej strony.</div>
      </div>
    </div>

    <jsp:include page="/WEB-INF/views/fragment/java-scripts.jsp"/>
  </body>
</html>