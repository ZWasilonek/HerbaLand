<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="pl">
  <head>
    <jsp:include page="/WEB-INF/views/fragment/head.jsp"/>
    <title>Formularz edycji zioła</title>
  </head>

  <body onload="initCategoryArr(<c:out value="${plantCategoriesJSON}"/>,<c:out value="${allCategoriesJSON}"/>)">
    <jsp:include page="/WEB-INF/views/fragment/navigation.jsp"/>

    <!-- content -->
    <section class="py-5">
      <div class="container">
        <div class="row gx-5">

          <form:form modelAttribute="medicinalPlant" method="post" enctype="multipart/form-data"
            id="formMedicinalPlant">
            <form:input type="hidden" path="id" />

            <section class="col-12 d-flex flex-wrap align-items-stretch mb-3">
              <!-- START medicinal plant picture -->
              <picture class="col-lg-6 col-md-7 col-sm-12">
                <div class="border rounded-4 justify-content-center">
                  <img style="max-height: 80vh; margin: auto;"
                    <c:choose>
                      <c:when test="${medicinalPlant.file != null && medicinalPlant.file.uploadFileEndpoint != null}">
                        src="<c:url value="${medicinalPlant.file.uploadFileEndpoint}"/>"
                        class="w-100 rounded-4 fit" />
                      </c:when>
                      <c:otherwise>
                        src="/resources/images/no-image.jpg" class="w-100 rounded-4 fit" />
                      </c:otherwise>
                    </c:choose>
                </div>
              </picture>
              <!-- END medicinal plant picture -->

              <div class="d-flex flex-wrap col-lg-6 col-md-5 col-sm-12">
                <!-- START Button Back -->
                <div class="col-12 d-flex justify-content-end align-items-start">
                  <a class="btn bg-darkseagreen" role="button"
                     href="<c:url value="${contextPath}/medicinal-plant/${medicinalPlant.id}"/>">
                     COFNIJ
                  </a>
                </div>
                <!-- END Button Back -->

                <!-- START Send file -->
                <div class="col-12 ps-4">
                  <label for="medicinalPlantFile" class="form-label">Wybierz zdjęcie:</label>
                  <form:input class="form-control" path="file" type="file" id="medicinalPlantFile" />
                  <form:input type="hidden" path="file.id" />

                  <div class="col-12 mt-3">
                    <h6 class="color-limegreen"><strong>Źródło / Link do zdjęcia:</strong></h6>
                    <form:input path="file.sourceLink" type="text" cssClass="col-12"
                      placeholder="Źródło / Link do zdjęcia" />
                  </div>
                </div>
                <!-- END Send file -->
              </div>
            </section>

            <main class="col-lg-12">
              <div class="ps-lg-3 plant-spec-items">
                <div class="row ${status.error ? 'error-status' : ''}">
                  <h4 class="col-12 color-limegreen">Tytułowa nazwa rośliny</h4>
                  <h4 class="col-lg-2 col-md-3">Nazwa polska:</h4>
                  <form:input type="hidden" path="polishPlant.id" />
                  <spring:bind path="polishPlant.name">
                    <form:input path="polishPlant.name" type="text"
                      class="col-lg-10 col-md-9" placeholder="np. Korzeń lukrecji" />
                    <form:errors path="polishPlant.name" cssClass="error" element="div"/>
                  </spring:bind>

                  <h4 class="col-lg-2 col-md-3">Nazwa łacińska:</h4>
                  <form:input type="hidden" path="latinPlant.id" />
                  <form:input path="latinPlant.name" type="text"
                    class="col-lg-10 col-md-9" placeholder="np. Glycyrrhizae radix"/>
                </div>

                <div id="category-container" class="row">
                  <!-- ---------------- CATEGORIES START ---------------- -->
                  <div class="col-lg-10 col-12 mb-4 mt-4">
                    <div class="border rounded-2 px-3 py-2 bg-white">
                      <!-- Pills navs -->
                      <c:set var="pillNumber" value="0" scope="page" />

                      <ul class="nav nav-pills nav-justified mb-3" id="ex1-content" role="tablist">
                        <c:forEach var="category" items="${allCategories}" varStatus="loop">
                          <c:set var="categoryId" value="${category.id}"/>
                          <c:set var="pillNumber" value="${loop.index + 1}" scope="page"/>

                          <li class="nav-item d-flex" role="presentation">
                            <a class="nav-link d-flex align-items-center justify-content-center w-100
                              ${loop.first ? 'active' : ''}"
                              id="ex1-tab-${pillNumber}" data-mdb-toggle="pill"
                              href="#ex1-pills-${pillNumber}" role="tab"
                              onclick="setCategoryIDFromSelectedPill(${category.id})"
                              aria-controls="ex1-pills-${pillNumber}" aria-selected="${loop.first ? 'true' : ''}">
                              <button type="button" class="btn btn-warning btn-floating btn-sm"
                                style="margin-right: 10px;"
                                onclick="editDialogCategory(${category.id})"
                                data-mdb-toggle="modal"
                                data-mdb-target="#addNewCategoryDialog">
                                <i class="fas fa-edit"></i>
                              </button>
                              ${category.name}
                            </a>
                          </li>
                        </c:forEach>
                        <!-- NEW CATEGORY DIALOG BUTTON -->
                        <li class="nav-item d-flex" role="presentation">
                          <a onclick="getClearedDialogCategory()"
                            class="nav-link d-flex align-items-center justify-content-center w-100"
                            data-mdb-toggle="modal"
                            data-mdb-target="#addNewCategoryDialog">
                            +
                          </a>
                        </li>
                      </ul>
                      <!-- Pills navs -->

                      <!-- Pills content -->
                      <div class="tab-content" id="ex1-content">
                        <c:forEach var="category" items="${allCategories}" varStatus="loop">
                          <c:set var="pillNumber" value="${loop.index + 1}"/>
                          <c:set var="categoryID" value="${category.id}" />

                          <div class="tab-pane fade ${pillNumber eq 1 ? 'show active' : 'mb-2'}"
                            id="ex1-pills-${pillNumber}"
                            role="tabpanel" aria-labelledby="ex1-tab-${pillNumber}">

                            <!-- diseases list -->
                            <div class="input-group mb-3">
                              <div class="input-group-prepend">
                                <label for="diseasesGroupSelect" class="input-group-text">
                                  Wybierz przypadłość
                                </label>
                              </div>
                              <form:select path="category.diseases" cssClass="custom-select"
                                id="diseasesGroupSelect"
                                multiple="true">
                                <form:options items="${category.diseases}" itemValue="id" itemLabel="name"
                                  onclick="showWorkingAreasByDiseaseID(this.value)"/>
                              </form:select>
                            </div>

                            <!-- WORKING AREAS BY DISEASE ID -->
                            <c:forEach var="disease" items="${category.diseases}" varStatus="status">
                              <div id="${category.id}-workingArea-${disease.id}-checkboxes" class="sec-checkboxes">
                                <div id="form-category-checkboxes">
                                  <div class="form-check">
                                    <input type="checkbox" class="form-check-input" value="0"
                                      onclick="setAllWACategory(this, ${categoryID}, '${category.name}', ${disease.id}, '${disease.name}')"/>
                                    <label class="form-check-label allWACheckboxesLabel">Zaznacz wszystkie</label>
                                  </div>
                                  <c:forEach var="workingArea" items="${disease.workingAreas}" varStatus="status">
                                    <div class="form-check">
                                      <form:checkbox path="workingArea" itemValue="${workingArea}"
                                        value="${workingArea.id}" cssClass="form-check-input"
                                        onclick="setWACategory(this.checked, ${categoryID}, '${category.name}', ${disease.id}, '${disease.name}', ${workingArea.id}, '${workingArea.name}');"/>
                                      <label class="form-check-label">${workingArea.name}</label>
                                    </div>
                                  </c:forEach>
                                </div>
                              </div>
                            </c:forEach>
                          </div>
                        </c:forEach>
                      </div>
                      <!-- Pills content -->
                    </div>
                  </div>

                  <!-- Selected categories -->
                  <div id="plantCategories" class="col-12 d-flex" hidden></div>
                </div>
                <!-- ---------------- CATEGORIES ENDS ---------------- -->

                <div class="row mt-4">
                  <h4 class="col-12 color-limegreen">Tradycyjne zastosowanie rośliny:</h4>
                  <form:textarea path="polishPlant.traditionalUse" rows="6" class="col-12"
                    placeholder="np. Wewnętrznie w mokrym kaszlu jako środek wykrztuśny..."/>

                  <h4 class="col-12 mt-5 color-limegreen">Rodzina</h4>
                  <h4 class="col-lg-2 col-md-3">Nazwa polska:</h4>
                  <form:input path="polishPlant.family" type="text"
                                class="col-lg-10 col-md-9" placeholder="np. Bobowate"/>
                  <h4 class="col-lg-2 col-md-3">Nazwa łacińska:</h4>
                  <form:input path="latinPlant.family" type="text"
                                class="col-lg-10 col-md-9" placeholder="np. Fabaceae"/>

                  <h4 class="col-12 mt-4 color-limegreen">Rodzaj</h4>
                  <h4 class="col-lg-2 col-md-3">Nazwa polska:</h4>
                  <form:input path="polishPlant.type" type="text"
                                class="col-lg-10 col-md-9" placeholder="np. Lukrecja"/>
                  <h4 class="col-lg-2 col-md-3">Nazwa łacińska:</h4>
                  <form:input path="latinPlant.type" type="text"
                                class="col-lg-10 col-md-9" placeholder="np. Glycyrrhizae"/>

                  <h4 class="col-12 mt-4 color-limegreen">Gatunek</h4>
                  <h4 class="col-lg-2 col-md-3">Nazwa polska:</h4>
                  <form:input path="polishPlant.species" type="text"
                                class="col-lg-10 col-md-9" placeholder="np. Lukrecja gładka"/>
                  <h4 class="col-lg-2 col-md-3">Nazwa łacińska:</h4>
                  <form:input path="latinPlant.species" type="text"
                                class="col-lg-10 col-md-9" placeholder="np. Glycyrrhiza glabra L."/>

                  <h4 class="col-12 mt-4 color-limegreen">Synonimy</h4>
                  <h4 class="col-lg-2 col-md-3">Nazwa polska:</h4>
                  <form:input path="polishPlant.synonyms" type="text"
                                class="col-lg-10 col-md-9" placeholder="np. Słodzień"/>
                  <h4 class="col-lg-2 col-md-3">Nazwa łacińska:</h4>
                  <form:input path="latinPlant.synonyms" type="text"
                                class="col-lg-10 col-md-9" placeholder="np. Liquiritiae"/>

                  <h4 class="col-12 mt-4 color-limegreen">Surowiec</h4>
                  <h4 class="col-lg-2 col-md-3">Nazwa polska:</h4>
                  <form:input path="polishPlant.rawMaterial" type="text"
                                class="col-lg-10 col-md-9" placeholder="np. Korzeń"/>
                  <h4 class="col-lg-2 col-md-3">Nazwa łacińska:</h4>
                  <form:input path="latinPlant.rawMaterial" type="text"
                                class="col-lg-10 col-md-9" placeholder="np. Radix"/>

                  <h4 class="col-12 mt-5 color-limegreen">Opis rośliny:</h4>
                  <form:textarea path="polishPlant.plantDescription" rows="8" class="col-12"
                    placeholder="np. Lukrecja występuje w Europie i Azji..."/>

                  <h4 class="col-12 mt-5 color-limegreen">Związki czynne rośliny:</h4>
                  <form:textarea path="polishPlant.activeCompounds" rows="4" class="col-12"
                    placeholder="np. Surowiec zawiera saponozydy trójterpenowe..."/>

                  <h4 class="col-12 mt-5 color-limegreen">Właściwości rośliny:</h4>
                  <form:textarea path="polishPlant.properties" rows="8" class="col-12"
                    placeholder="np. Obecność związków saponinowych sprawia..."/>

                  <h4 class="col-12 mt-5 color-limegreen">Wskazania do stosowania rośliny:</h4>
                  <form:textarea path="polishPlant.indications" rows="4" class="col-12"
                    placeholder="np. Wewnętrznie w mokrym kaszlu..."/>

                  <h4 class="col-12 mt-5 color-limegreen">Uwagi do stosowania rośliny:</h4>
                  <form:textarea path="polishPlant.comments" rows="4" class="col-12"
                    placeholder="np. Preparatów z lukrecji nie wolno stosować dłużej niż 4-6 tygodni..."/>

                  <h4 class="col-12 mt-5 color-limegreen">Właściwości rośliny po <span style="color:green">łacinie</span>:</h4>
                  <form:textarea path="latinPlant.properties" rows="2" class="col-12"
                    placeholder="np. Obecność związków saponinowych sprawia..."/>

                  <h4 class="col-12 mt-5 color-limegreen">Przeciwwskazania rośliny:</h4>
                  <form:textarea path="polishPlant.contraindications" rows="3" class="col-12"
                    placeholder="np. Lukrecji nie należy podawać dzieciom poniżej 4 roku życia..."/>

                  <h4 class="col-12 mt-5 color-limegreen">Linki do źródeł:</h4><br>
                  <form:textarea path="dataSourceLinks" rows="4" class="col-12"
                    placeholder="np. http://www.farmakognozjaonline.pl/baz_suro/baza.php?jezyk=&klasa=radix&id=61"/>

                  <h4 class="col-12 mt-5 color-limegreen">Bibliografia:</h4>
                  <p>Wzór: <i>1. [Autorzy, Tytuł, Miejsce wydania, Nazwa wydawnicta, Rok wydania, Numer ISBN]</i></p><br>
                  <form:textarea path="bibliography" rows="2" class="col-12"
                     placeholder="np. Robert C. Martin, Clean Code, Boston, Pearson Education Inc., 2009, ISBN 0-13-235088-2"/>
                </div>
              </div>
              <button type="submit" id="submitCategoryBtn" class="btn bg-darkseagreen">Wyślij</button>
            </main>
          </form:form>

          <jsp:include page="/WEB-INF/views/dialog/new-category-dialog.jsp"/>

        </div>
      </div>
    </section>
    <!-- content -->

    <jsp:include page="/WEB-INF/views/fragment/java-scripts.jsp"/>
    <!-- Custom scripts -->
    <script type="text/javascript" src="/resources/js/custom/form-medicinal-plant.js"></script>
  </body>
</html>