<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="maxPagesNumbers" value="${param.maxPagesNumbers}"/>
<c:set var="startPageNumber" value="${param.startPageNumber}"/>
<c:set var="previousPageNumber" value="${param.previousPageNumber}"/>
<c:set var="nextPageNumber" value="${param.nextPageNumber}"/>
<c:set var="selectedPageNo" value="${param.selectedPageNo}"/>
<c:set var="size" value="${param.size != null ? param.size : 8}"/>
<c:set var="idPageNavigation" value="${param.idPageNavigation}"/>
<c:set var="endpoint" value="${param.endpoint}"/>
<c:set var="endpointParams" value="${param.endpointParams}"/>

<div>
  <ul class="nav paging-links">
    <c:set var="pageNumber" value="1" />

    <c:if test="${previousPageNumber != -1}">
      <li class="nav-item">
        <a href="<c:out value="${contextPath}/${endpoint}?page=${previousPageNumber}&size=${size}${endpointParams}"/>${idPageNavigation}"
          class="nav-link paging-link"><
        </a>
      </li>
    </c:if>

    <c:forEach var="index" begin="${startPageNumber}" end="${startPageNumber + 3 > maxPagesNumbers ? maxPagesNumbers : startPageNumber + 3}">
      <c:set var="pageNumber" value="${index + 1}" />

      <li class="nav-item ${selectedPageNo != null and selectedPageNo == pageNumber ? 'active' : ''}">
        <a href="<c:out value="${contextPath}/${endpoint}?page=${index}&size=${size}${endpointParams}"/>${idPageNavigation}"
          class="nav-link paging-link">${pageNumber}
        </a>
      </li>
    </c:forEach>

    <c:if test="${nextPageNumber != -1}">
      <li class="nav-item">
        <a href="<c:out value="${contextPath}/${endpoint}?page=${nextPageNumber}&size=${size}${endpointParams}"/>${idPageNavigation}"
          class="nav-link paging-link">>
        </a>
      </li>
    </c:if>
  </ul>
</div>