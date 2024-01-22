<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="user" value="${sessionScope.userFromSession}"/>

<!-- Jumbotron -->
<header>
  <div class="p-3 text-center border-bottom">
    <navigation>
      <div class="row gy-3">
        <!-- Left elements -->
        <div class="col-lg-2 col-sm-4 col-4 herbaLandDiv">
          <a class="herbaLandTxt" href="${contextPath}/">HerbaLand</a>
        </div>
        <!-- Left elements -->

        <!-- Center elements -->
        <div class="order-lg-last col-lg-5 col-sm-8 col-8">
          <div class="d-flex float-end">
            <c:choose>
              <c:when test="${user.id != null}">
                <!-- SIGN IN USER -->
                <c:choose>
                  <c:when test="${userMedicinalPlants != null and userMedicinalPlants.size() > 0}">
                    <%-- USER MEDICAL PLANTS NOT EMPTY --%>
                    <a href="${contextPath}/user/herbs-list"
                      class="me-1 border rounded py-1 px-3 nav-link d-flex color-limegreen">
                      <i class="${addedToFavourite ? 'fa fa-plus-circle' : 'new-favourite-icon'} m-1 me-md-2"> </i>
                      <p class="d-none d-md-block mb-0">Ulubione zioła</p>
                    </a>
                  </c:when>
                  <c:otherwise>
                    <%-- USER MEDICAL PLANTS EMPTY --%>
                    <a href="${contextPath}/user/herbs-list"
                      class="${addedToFavourite ? 'bg-palegoldenrod' : ''} me-1 border rounded py-1 px-3 nav-link d-flex">
                      <i class="${addedToFavourite ? 'fa fa-plus-circle' : 'favourite-plants-icon'} m-1 me-md-2"> </i>
                      <p class="d-none d-md-block mb-0">Ulubione zioła</p>
                    </a>
                  </c:otherwise>
                </c:choose>
                <c:if test="${userFromSession.isAdmin()}">
                  <a href="${contextPath}/medicinal-plant/create/"
                    class="me-1 border rounded py-1 px-2 nav-link d-flex align-items-center">
                    <i class="fa fa-plus-circle m-1 me-md-2"></i>
                    <p class="d-none d-md-block mb-0">Nowa roślina</p>
                  </a>
                </c:if>
                <a href="${contextPath}/user/edit"
                  class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center">
                  <i class="fas fa-user-edit m-1 me-md-2"></i>
                  <p class="d-none d-md-block mb-0">${userFromSession.firstName}</p>
                </a>
                <a href="${contextPath}/logout"
                  class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center">
                  <i class="fas fa-user-alt m-1 me-md-2"></i>
                  <p class="d-none d-md-block mb-0">Wyloguj</p>
                </a>
              </c:when>

              <%-- NOT LOGGED IN USER --%>
              <c:otherwise>
                <a href="${contextPath}/user/herbs-list"
                  class="me-1 border rounded py-1 px-3 nav-link d-flex">
                  <i class="favourite-plants-icon m-1 me-md-2"></i>
                  <p class="d-none d-md-block mb-0">Ulubione zioła</p>
                </a>
                <a href="${contextPath}/register"
                  class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center"
                  target="_blank"> <i class="fas fa-user-plus m-1 me-md-2"></i>
                  <p class="d-none d-md-block mb-0">Załóż konto</p>
                </a>
                <a href="${contextPath}/login"
                  class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center"
                  target="_blank"> <i class="fas fa-user-alt m-1 me-md-2"></i>
                  <p class="d-none d-md-block mb-0">Zaloguj</p>
                </a>
              </c:otherwise>
            </c:choose>
          </div>
        </div>
        <!-- Center elements -->

        <!-- Right elements -->
        <div class="col-lg-5 col-md-12 col-12">
          <form action="${contextPath}/search" method="GET">
            <div class="input-group float-center">
              <div class="form-outline">
                <input type="search" name="searchParam" id="searchPlantNav" class="form-control" />
                <label class="form-label" for="searchPlantNav">Szukaj roślinę</label>
              </div>
              <button type="submit" class="btn bg-darkseagreen shadow-0">
                <i class="fas fa-search"></i>
              </button>
            </div>
          </form>
        </div>
        <!-- Right elements -->
      </div>
    </navigation>
  </div>
</header>
<!-- Jumbotron -->

<!-- Searched medical plants by param -->
<c:if test="${searchParamStatus != null}">
  <jsp:include page="/WEB-INF/views/fragment/searched.jsp"/>
</c:if>