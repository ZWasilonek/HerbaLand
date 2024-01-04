<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="border-bottom bg-light">
  <div class="container-fluid p-3">
    <div id="searchContent" class="content-container">
      <div class="row catalog-item-list">

        <c:if test="${searchStatus eq 'NOT_FOUND'}">
          <p>Nie znaleziono wyniku dla szukanej frazy: <strong><c:out value="${searchWord}"/></strong></p>
        </c:if>

        <c:if test="${searchStatus eq 'SUCCESS'}">
          <p>Znaleziono dopasowań: <strong><c:out value="${searchedMedicinalPlants.size()}" /></strong> dla szukanej frazy: <strong><c:out value="${searchWord}"/></strong></p>

          <c:forEach var="medicinalPlant" items="${searchedMedicinalPlants}" varStatus="status">
            <a href="${contextPath}/medicinal-plant/${medicinalPlant.id}"
              class="col-lg-3 col-md-4 col-sm-6 col-xs-12 catalog-item mt-0 mb-4">
              <div>
                <div class="position-relative thumbnail-container bg-white rounded">
                  <c:if test="${userFromSession.id != null}">
                    <!-- ADD / REMOVE MEDICAL PLANT FROM USER FAVOURITE LIST ICON -->
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

          <!-- Catalog Paging Buttons -->
          <jsp:include page="/WEB-INF/views/fragment/pagination.jsp">
            <jsp:param name="startPageNumber" value="${pagesNumber}" />
            <jsp:param name="maxPagesNumbers" value="${lastPageIndex}" />
            <jsp:param name="previousPageNumber" value="${previousPageNumberIndex}" />
            <jsp:param name="nextPageNumber" value="${nextPageNumberIndex}" />
            <jsp:param name="selectedPageNo" value="${selectedPageNo}" />
            <jsp:param name="size" value="4" />
            <jsp:param name="endpoint" value="search" />
            <jsp:param name="endpointParams" value="${endpointParams}" />
          </jsp:include>

        </c:if>
      </div>
    </div>
  </div>
</div>