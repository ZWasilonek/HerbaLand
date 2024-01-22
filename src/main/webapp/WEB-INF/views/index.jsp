<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="pl">
  <head>
    <jsp:include page="/WEB-INF/views/fragment/head.jsp"/>
    <title>HerbaLand</title>
  </head>

  <body>
    <jsp:include page="/WEB-INF/views/fragment/navigation.jsp"/>

    <div class="mx-auto">
      <jsp:include page="/WEB-INF/views/fragment/home-video.jsp"/>

      <div class="container-fluid position-relative">
        <div id="content">
          <main>
            <div class="row">
              <div id="main-plants" class="col-12">
                <h2 class="plant-list-title mb-4 mt-4">Baza ziół o właściwościach leczniczych</h2>
                <div class="categories-container">
                  <h3 class="tm-text-primary tm-categories-text">Kategorie:</h3>
                  <ul class="nav category-list">
                    <li class="nav-item category-item">
                      <a href="${contextPath}/search-all-by/category/all#plants-list"
                        class="category-link">Wszystkie</a>
                    </li>
                    <c:forEach var="category" items="${allCategories}" varStatus="status">
                      <li class="nav-item category-item">
                        <a href="${contextPath}/search-all-by/category/${category.name}#plants-list"
                          class="category-link">
                          <c:out value="${category.name}"/>
                        </a>
                      </li>
                    </c:forEach>
                  </ul>
                </div>
              </div>
            </div>

            <div id="plants-list" class="row catalog-item-list py-3 bg-light">
              <c:if test="${searchStatus eq 'NOT_FOUND'}">
                <p class="m-auto">Nie znaleziono wyniku dla kategorii <strong id="categoryName"><c:out value="${categoryName}"/></strong></p>
              </c:if>

              <c:if test="${searchStatus eq 'SUCCESS' and medicinalPlantByCategoryPage.hasContent()}">
                <c:if test="${categoryName != null}">
                  <p class="m-auto">Znaleziono <strong><c:out value="${medicinalPlantByCategoryPage.totalElements}" /></strong> dopasowań dla kategorii <strong id="categoryName"><c:out value="${categoryName}"/></strong></p>
                </c:if>

                <c:forEach var="medicinalPlant" items="${medicinalPlantByCategoryPage.content}" varStatus="status">
                  <!-- MEDICAL PLANT CARD -->
                  <a href="${contextPath}/medicinal-plant/${medicinalPlant.id}"
                    class="col-lg-3 col-md-4 col-sm-6 col-xs-12 catalog-item">
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

                <div class="mt-3">
                  <!-- Catalog Paging Buttons -->
                  <jsp:include page="/WEB-INF/views/fragment/pagination.jsp">
                    <jsp:param name="startPageNumber" value="${medicinalPlantByCategoryPage.number}" />
                    <jsp:param name="maxPagesNumbers" value="${medicinalPlantByCategoryPage.totalPages - 1}" />
                    <jsp:param name="previousPageNumber" value="${medicinalPlantByCategoryPage.hasPrevious() ? medicinalPlantByCategoryPage.previousPageable().getPageNumber() : -1}" />
                    <jsp:param name="nextPageNumber" value="${medicinalPlantByCategoryPage.hasNext() ? medicinalPlantByCategoryPage.nextPageable().getPageNumber() : -1}" />
                    <jsp:param name="selectedPageNo" value="${medicinalPlantByCategoryPage.getNumber() != null ? medicinalPlantByCategoryPage.getNumber() + 1 : null}" />
                    <jsp:param name="idPageNavigation" value="#plants-list" />
                    <jsp:param name="endpoint" value="search-all-by/category/${categoryName != null and categoryName != 'Wszystkie' ? categoryName : 'all'}" />
                  </jsp:include>
                </div>
              </c:if>

            </div>
          </main>
        </div>

        <%-- VIDEO DIALOG FOR ADMIN --%>
        <jsp:include page="/WEB-INF/views/dialog/video-dialog.jsp"/>
      </div>
    </div>

    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/fragment/footer.jsp"/>
    <!-- Footer -->

    <jsp:include page="/WEB-INF/views/fragment/java-scripts.jsp"/>
    <!-- Custom scripts -->
    <script type="text/javascript" src="/resources/js/custom/index.js"></script>

  </body>
</html>