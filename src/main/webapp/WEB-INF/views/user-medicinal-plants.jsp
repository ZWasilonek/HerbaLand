<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="pl">
  <head>
    <jsp:include page="/WEB-INF/views/fragment/head.jsp"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/user-medicinal-plants.css"/>" type="text/css"/>
    <title>Panel użytkownika</title>
  </head>

  <body>
    <jsp:include page="/WEB-INF/views/fragment/navigation.jsp"/>

    <section id="userMedicinalPlants">
      <div>
        <div class="row catalog-item-list mb-2">
          <c:if test="${userMedicinalPlantsPage == null || userMedicinalPlantsPage.totalPages <= 0}">
            <p class="user-herbs-search-info"><c:out value="${userFromSession.firstName}"/> Twoja lista czeka aż ją zasiejesz...</strong></p>
          </c:if>
          <c:if test="${userMedicinalPlantsPage != null && userMedicinalPlantsPage.totalPages > 0}">
            <p class="user-herbs-search-info">Ilość roślin leczniczych w Twojej kolekcji: <strong><c:out value="${userMedicinalPlantsPage.totalElements}" /></strong></p>
          </c:if>
          <c:forEach var="medicinalPlant" items="${userMedicinalPlantsPage.content}" varStatus="status">
            <a href="${contextPath}/medicinal-plant/${medicinalPlant.id}"
              class="col-lg-3 col-md-4 col-sm-6 col-xs-12 my-4 catalog-item">
              <div>
                <div class="position-relative thumbnail-container">
                  <c:if test="${userFromSession.id != null}">
                    <!-- ADD / REMOVE MEDICINAL PLANT FROM USER FAVOURITE LIST ICON -->
                    <c:choose>
                      <c:when test="${userFromSession.containsPlantInFavorites(medicinalPlant)}">
                        <jsp:include page="/WEB-INF/views/fragment/buttonRemoveFromFavourite.jsp">
                          <jsp:param name="medicinalId" value="${medicinalPlant.id}" />
                        </jsp:include>
                      </c:when>
                      <c:otherwise>
                        <jsp:include page="/WEB-INF/views/fragment/buttonAddToFavourite.jsp">
                          <jsp:param name="medicinalId" value="${medicinalPlant.id}" />
                        </jsp:include>
                      </c:otherwise>
                    </c:choose>
                  </c:if>
                  <img src="<c:url value="${medicinalPlant.file.uploadFileEndpoint}"/>"
                    alt="<c:url value="${medicinalPlant.file.name}"/>"
                    class="img-fluid catalog-item-img">
                </div>
                <div class="p-2 bg-green catalog-item-description">
                  <p><c:out value="${medicinalPlant.polishPlant.name}"/></p>
                  <p class="catalog-item-title"><c:out value="( łac. ${medicinalPlant.latinPlant.name} )"/></p>
                </div>
              </div>
            </a>
          </c:forEach>
        </div>

        <c:if test="${userMedicinalPlantsPage != null && userMedicinalPlantsPage.totalPages > 0}">
          <!-- Catalog Paging Buttons -->
          <jsp:include page="/WEB-INF/views/fragment/pagination.jsp">
            <jsp:param name="startPageNumber" value="${userMedicinalPlantsPage.getNumber()}" />
            <jsp:param name="maxPagesNumbers" value="${userMedicinalPlantsPage.totalPages - 1}" />
            <jsp:param name="previousPageNumber" value="${userMedicinalPlantsPage.hasPrevious() ? userMedicinalPlantsPage.previousPageable().getPageNumber() : -1}" />
            <jsp:param name="nextPageNumber" value="${userMedicinalPlantsPage.hasNext() ? userMedicinalPlantsPage.nextPageable().getPageNumber() : -1}" />
            <jsp:param name="selectedPageNo" value="${userMedicinalPlantsPage.getNumber() != null ? userMedicinalPlantsPage.getNumber() + 1 : null}" />
            <jsp:param name="size" value="4" />
            <jsp:param name="endpoint" value="user/herbs-list" />
          </jsp:include>
        </c:if>
      </div>
    </section>

    <jsp:include page="/WEB-INF/views/fragment/java-scripts.jsp"/>

  </body>
</html>