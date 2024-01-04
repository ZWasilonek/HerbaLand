<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="position-relative">
  <div class="position-absolute tm-site-header">
    <div class="container-fluid position-relative">
      <div class="row justify-content-end">

        <!-- START admin can upload the video -->
        <c:if test="${userFromSession.isAdmin()}">
          <div class="col-7 col-md-4">
            <a class="tm-bg-black text-center tm-logo-container"
              data-mdb-toggle="modal"
              data-mdb-target="#showVideoDialog">
              <i class="fas fa-video tm-site-logo mb-3"></i>
              <h1 class="tm-site-name">Dodaj film</h1>
            </a>
          </div>
        </c:if>
        <!-- END admin can upload the video -->

        <div class="col-5 col-md-8">
          <div class="tm-site-nav">
            <nav class="navbar navbar-expand-lg" id="tm-main-nav">
              <button class="navbar-toggler tm-bg-black py-2 px-3 collapsed" type="button"
                data-toggle="collapse" data-target="#navbar-nav" aria-controls="navbar-nav"
                aria-expanded="false" aria-label="Toggle navigation">
                <span>
                  <i class="fas fa-bars tm-menu-closed-icon"></i>
                  <i class="fas fa-times tm-menu-opened-icon"></i>
                </span>
              </button>
              <div class="collapse navbar-collapse tm-nav" id="navbar-nav">
                <ul class="navbar-nav text-uppercase">
                  <li class="nav-item active">
                    <a class="nav-link tm-nav-link" href="${contextPath}/#main-plants">Kolekcja ziół <span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link tm-nav-link" href="#about">O projekcie</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link tm-nav-link" href="#contact">Kontakt</a>
                  </li>
                </ul>
              </div>
            </nav>
          </div>
        </div>

      </div>
    </div>
  </div>

  <div class="tm-welcome-container text-center text-white">
    <div class="tm-welcome-container-inner">
      <p class="tm-welcome-text mb-1 text-white">
        <q>Niech twoje pożywienie będzie lekarstwem, a lekarstwo pożywieniem.</q></br>
        <cite>HIPOKRATES</cite>
      </p>
    </div>
  </div>

  <div id="tm-video-container">
    <video autoplay muted loop id="tm-video">
      <source src="<c:url value="${homeVideo.uploadFileEndpoint}"/>"
        type="<c:out value="${homeVideo.contentType}"/>">
      <meta itemprop="thumbnail" content="<c:out value="${homeVideo.sourceLink}"/>">
      <p><c:out value="${homeVideo.sourceLink}"/></p>
    </video>
  </div>

  <i id="tm-video-control-button" class="fas fa-pause"></i>
</div>