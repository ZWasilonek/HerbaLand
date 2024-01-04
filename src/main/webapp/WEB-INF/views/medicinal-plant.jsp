<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="pl">
  <head>
    <jsp:include page="/WEB-INF/views/fragment/head.jsp"/>
    <title>Opis zioła</title>
  </head>

  <body>
    <jsp:include page="/WEB-INF/views/fragment/navigation.jsp"/>

    <!-- Top content -->
    <section class="py-5">
      <div class="container">

        <!-- Message sent from form -->
        <c:if test="${message != null}">
          <div class="d-flex justify-content-center mb-5">
            <h4 class="text-danger font-weight-bold"><c:out value="${message}"/></h4>
          </div>
        </c:if>

        <div class="row gx-5">
          <!-- START -- Left content -->
          <aside class="col-lg-5">
            <!-- plant picture -->
            <div class="border rounded-4 mb-3 d-flex justify-content-center">
              <a href="<c:url value="${medicinalPlant.file.sourceLink}"/>" target="_blank">
                <img style="max-width: 100%; max-height: 100vh; margin: auto;" class="rounded-4 fit"
                  src="<c:url value="${medicinalPlant.file.uploadFileEndpoint}"/>" />
              </a>
            </div>
            <!-- plant picture -->

            <!-- data source -->
            <c:if test="${medicinalPlant.dataSourceLinks != null or medicinalPlant.bibliography != null}">
              <div class="mt-4">
                <c:if test="${medicinalPlant.dataSourceLinks != null and medicinalPlant.dataSourceLinks != ''}">
                  <a class="w-100 bg-darkseagreen btn btn-sm mb-2" data-toggle="collapse" href="#collapse-links"
                    role="button" aria-expanded="false" aria-controls="collapse-links">
                      LINKI DO ŹRÓDEŁ
                  </a>
                  <p id="collapse-links" class="mb-2 collapse data-source-link">
                    <c:out value="${medicinalPlant.dataSourceLinks}"/>
                  </p>
                </c:if>

                <c:if test="${medicinalPlant.bibliography != null and medicinalPlant.bibliography != ''}">
                  <a class="w-100 btn btn-success btn-sm mb-2" data-toggle="collapse" href="#collapse-bibliography"
                    role="button" aria-expanded="false" aria-controls="collapse-bibliography">
                      Bibliografia
                  </a>
                  <p id="collapse-bibliography" class="mb-2 collapse data-source-link">
                    <c:out value="${medicinalPlant.bibliography}"/>
                  </p>
                </c:if>
              </div>
            </c:if>
            <!-- END -- data source -->
          </aside>
          <!-- END -- left content -->

          <!-- START -- right content -->
          <main class="col-lg-7">
            <div class="ps-lg-3">
              <div class="d-flex align-items-center justify-content-between">
                <h4 class="mb-0 title text-dark">
                  <c:out value="${medicinalPlant.polishPlant.name} ( łac. ${medicinalPlant.latinPlant.name} )"/>
                </h4>

                <c:if test="${userFromSession.isAdmin()}">
                  <a class="btn bg-darkseagreen" role="button"
                  href="<c:url value="${contextPath}/medicinal-plant/edit/${medicinalPlant.id}"/>">EDYTUJ</a>
                </c:if>
              </div>

              <hr>

              <p class="mb-4">
                <c:out value="${medicinalPlant.polishPlant.traditionalUse}"/>
              </p>

              <div class="row">
                <dt class="col-2">Rodzina</dt>
                <dd class="col-10"><c:out value="${medicinalPlant.polishPlant.family} ( łac. ${medicinalPlant.latinPlant.family} )"/></dd>

                <dt class="col-2">Rodzaj</dt>
                <dd class="col-10"><c:out value="${medicinalPlant.polishPlant.type} ( łac. ${medicinalPlant.latinPlant.type} )"/></dd>

                <dt class="col-2">Gatunek</dt>
                <dd class="col-10"><c:out value="${medicinalPlant.polishPlant.species} ( łac. ${medicinalPlant.latinPlant.species} )"/></dd>

                <c:if test="${medicinalPlant.polishPlant.synonyms != '' or medicinalPlant.latinPlant.synonyms != ''}">
                  <dt class="col-2">Synonimy</dt>
                  <dd class="col-10">
                    <c:if test="${medicinalPlant.polishPlant.synonyms != null}">
                        <c:out value="${medicinalPlant.polishPlant.synonyms}"/>
                      <c:if test="${medicinalPlant.latinPlant.synonyms != null && medicinalPlant.latinPlant.synonyms != ''}">
                        <c:out value=" ( łac. ${medicinalPlant.latinPlant.synonyms} )"/>
                      </c:if>
                    </c:if>
                  </dd>
                </c:if>

                <dt class="col-2">Surowiec</dt>
                <dd class="col-10"><c:out value="${medicinalPlant.polishPlant.rawMaterial} ( łac. ${medicinalPlant.latinPlant.rawMaterial} )"/></dd>
              </div>

              <hr/>
              <c:choose>
                <c:when test="${userFromSession.containsPlantInFavorites(medicinalPlant) or addedToFavourite}">
                  <a href="<c:out value="${contextPath}/medicinal-plant/change-favourites/${medicinalPlant.id}"/>?isPlantAdded=false"
                    class="btn btn-light border border-secondary py-2 icon-remove-favourite px-3">
                    <i class="plant-icon"> </i> Usuń z ulubionych
                  </a>
                </c:when>
                <c:otherwise>
                  <a href="<c:out value="${contextPath}/medicinal-plant/change-favourites/${medicinalPlant.id}"/>?isPlantAdded=true"
                    class="btn btn-light border border-secondary py-2 icon-add-favourite px-3">
                    <i class="holding-plant-icon"> </i> Dodaj do ulubionych
                  </a>
                </c:otherwise>
              </c:choose>
            </div>
          </main>
          <!-- right content -->
        </div>
      </div>
    </section>
    <!-- top content -->

    <!-- button content -->
    <section class="bg-light border-top py-4">
      <div class="container">
        <div class="row gx-4">
          <div class="col-lg-8 mb-4">
            <div class="border rounded-2 px-3 py-2 bg-white">

              <!-- START -- Pills navs -->
              <ul class="nav nav-pills nav-justified mb-3" id="plantCharacteristics" role="tablist">
                <li class="nav-item d-flex" role="presentation">
                  <a class="nav-link d-flex align-items-center justify-content-center w-100 active"
                    id="ex1-tab-1" data-mdb-toggle="pill" href="#ex1-pills-1" role="tab"
                    aria-controls="ex1-pills-1" aria-selected="true">Opis rośliny</a>
                </li>
                <li class="nav-item d-flex" role="presentation">
                  <a class="nav-link d-flex align-items-center justify-content-center w-100"
                    id="ex1-tab-2" data-mdb-toggle="pill" href="#ex1-pills-2" role="tab"
                    aria-controls="ex1-pills-2" aria-selected="false">Związki czynne</a>
                </li>
                <li class="nav-item d-flex" role="presentation">
                  <a class="nav-link d-flex align-items-center justify-content-center w-100"
                    id="ex1-tab-3" data-mdb-toggle="pill" href="#ex1-pills-3" role="tab"
                    aria-controls="ex1-pills-3" aria-selected="false">Właściwości</a>
                </li>
                <li class="nav-item d-flex" role="presentation">
                  <a class="nav-link d-flex align-items-center justify-content-center w-100"
                    id="ex1-tab-4" data-mdb-toggle="pill" href="#ex1-pills-4" role="tab"
                    aria-controls="ex1-pills-4" aria-selected="false">Przeciwwskazania</a>
                </li>
              </ul>
              <!-- END -- Pills navs -->

              <!-- START -- Pills content -->
              <div class="tab-content" id="ex1-content">
                <!-- Pill Opis rośliny -->
                <div class="tab-pane fade show active" id="ex1-pills-1" role="tabpanel" aria-labelledby="ex1-tab-1">

                  <p><c:out value="${medicinalPlant.polishPlant.plantDescription}"/></p>
                  <hr>

                  <!-- START -- Diseases list -->
                  <div class="row mb-2">
                    <c:forEach var="category" items="${medicinalPlant.categories}" varStatus="status">
                      <c:if test="${status.index > 0}">
                        <a class="btn bg-darkseagreen btn-sm mb-2" data-toggle="collapse" href="#collapse-${status.index}"
                          role="button" aria-expanded="false" aria-controls="collapse-${status.index}">
                            Odkryj informacje z kategorii ${category.name}
                        </a>
                      </c:if>

                      <div class="col-12 ${status.index > 0 ? 'collapse' : ''}" id="collapse-${status.index}">
                        <p class="color-darkgreen-bold">${category.name}</p>
                        <div>
                          <ul class="disease-items list-unstyled mb-0">
                            <c:forEach var="disease" items="${category.diseases}">
                              <li>
                                <i class="fas fa-check text-success me-2"></i>${disease.name}
                                <ul class="working-area-items">
                                  <c:forEach var="workingArea" items="${disease.workingAreas}">
                                    <li>${workingArea.name}</li>
                                  </c:forEach>
                                </ul>
                              </li>
                            </c:forEach>
                          </ul>
                        </div>
                      </div>
                    </c:forEach>
                  </div>
                  <!-- END -- Diseases list -->
                </div>

                <!-- Pill Związki czynne -->
                <div class="tab-pane fade mb-2" id="ex1-pills-2" role="tabpanel" aria-labelledby="ex1-tab-2">
                  <p><c:out value="${medicinalPlant.polishPlant.activeCompounds}"/></p>
                </div>

                <!-- Pill Właściwości -->
                <div class="tab-pane fade mb-2" id="ex1-pills-3" role="tabpanel" aria-labelledby="ex1-tab-3">
                  <c:if test="${medicinalPlant.latinPlant.properties != null}">
                    <p><i><c:out value="${medicinalPlant.latinPlant.properties}"/></i></p>
                  </c:if>
                  <p><c:out value="${medicinalPlant.polishPlant.properties}"/></p>
                  <c:if test="${medicinalPlant.polishPlant.indications != null and medicinalPlant.polishPlant.indications != ''}">
                    <p><strong>Wskazania:</strong> <c:out value="${medicinalPlant.polishPlant.indications}"/></p>
                  </c:if>
                  <c:if test="${medicinalPlant.polishPlant.comments != null and medicinalPlant.polishPlant.comments != ''}">
                    <p><strong>Uwagi:</strong> <c:out value="${medicinalPlant.polishPlant.comments}"/></p>
                  </c:if>
                </div>

                <!-- Pill Przeciwwskazania -->
                <div class="tab-pane fade mb-2" id="ex1-pills-4" role="tabpanel" aria-labelledby="ex1-tab-4">
                  <p><c:out value="${medicinalPlant.polishPlant.contraindications}"/></p>
                </div>
              </div>
              <!-- END -- Pills content -->
            </div>
          </div>

          <!-- START -- Similar plants by categories -->
          <div class="similar-plant col-lg-4">
            <div class="card px-0 border rounded-2 shadow-0">
              <div class="card-body">

                <h5 class="card-title mb-4">Rośliny o podobnym działaniu</h5>

                <c:choose>
                  <c:when test="${similarPlants.isEmpty()}">
                    <p>Brak roślin o podobnym działaniu</p>
                  </c:when>
                  <c:otherwise>
                    <c:forEach var="similarPlant" items="${similarPlants}">
                      <div class="similar-plant-card d-flex mb-3">
                        <a href="${contextPath}/medicinal-plant/<c:out value="${similarPlant.id}"/>" class="me-3">
                          <img src="<c:url value="${similarPlant.file.uploadFileEndpoint}"/>"
                            style="min-width: 96px; height: 96px;" class="img-md img-thumbnail" />
                        </a>
                        <div class="similar-plant-title">
                          <a href="${contextPath}/medicinal-plant/<c:out value="${similarPlant.id}"/>" class="nav-link mb-1">
                            <c:out value="${similarPlant.polishPlant.name}"/><br>
                            (łac. <c:out value="${similarPlant.latinPlant.name})"/><br>
                            <strong><c:out value="${similarPlant.percentageMatch}"/>% zgodności</strong>
                          </a>
                        </div>
                      </div>
                    </c:forEach>
                  </c:otherwise>
                </c:choose>
              </div>
            </div>
          </div>
          <!-- END -- Similar plants by categories -->
        </div>
      </div>
    </section>
    <!-- Button content -->

    <jsp:include page="/WEB-INF/views/fragment/java-scripts.jsp"/>
    <!-- Custom scripts -->
    <script type="text/javascript" src="/resources/js/custom/medicinal-plant.js"></script>
  </body>
</html>