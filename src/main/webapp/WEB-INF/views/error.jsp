<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html lang="pl">
  <body>
    <div class="container">
      <div class="starter-template">
        <h1>403 - Odmowa dostępu</h1>
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
  </body>
</html>