<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ------------- Modal ------------- -->
<div class="modal fade" id="addNewCategoryDialog" tabindex="-1" aria-labelledby="newCategoryTitle"
  aria-hidden="true">
  <div class="modal-dialog">

    <div class="modal-content">
      <!-- ------------- Modal Header ------------- -->
      <div class="modal-header d-block">
        <!-- ------------- Input for category name ------------- -->
        <input type="text" id="newCategoryTitle" class="mb-2 d-flex w-100"
          class="modal-title w-100" placeholder="Nazwa kategorii, np Zdrowie"/>
      </div>

      <!-- ------------- Modal Body ------------- -->
      <div class="modal-body">
        <div class="mb-2 new-disease-div">
          <!-- ------------- Select disease ------------- -->
          <div class="select-disease-div w-100 mb-1" style="display: flex; align-items: center">
            <select class="disease-select dialog-category-select form-select"
              name="disease" aria-label="select example">
              <option value="-1" selected>Wybierz przypadłość / chorobę</option>
              <c:forEach var="disease" items="${allDiseases}" varStatus="status">
                <option value="<c:out value="${disease.id}"/>">${disease.name}</option>
              </c:forEach>
            </select>
            <button type="button" class="btn-close" onclick="removeHtmlItem(this.parentNode.parentNode)"></button>
          </div>

          <!-- ------------- Input for new disease ------------- -->
          <div class="input-disease-div w-100 mb-1" style="display: none; align-items: center">
            <input type="text" name="disease" class="disease-input w-100"
              placeholder="Nazwa przypadłośći / choroba, np Przeziębienie"/>
              <button type="button" class="btn-close" onclick="removeHtmlItem(this.parentNode.parentNode)"></button>
          </div>

          <!-- ------------- Select working area ------------- -->
          <div class="mb-1 working-area-select-div" style="display: none; align-items: center;">
            <i class="fas fa-check mx-1" aria-hidden="true"></i>
            <select class="working-area-select dialog-category-select form-select"
              multiple aria-label="multiple select example">
              <option value="-1" selected>Wybierz obszar działania</option>
              <c:forEach var="workingArea" items="${allWorkingAreas}" varStatus="status">
                <option value="<c:out value="${workingArea.id}"/>">${workingArea.name}</option>
              </c:forEach>
            <select/>
          </div>

          <!-- ------------- Input for new working area ------------- -->
          <div class="mb-1 working-area-input-div" style="display: none; align-items: center;">
            <i class="fas fa-check ms-1" aria-hidden="true" style="margin-right: 10px;"></i>
            <input type="text" name="disease" class="working-area-input w-100"
              placeholder="Obszar działania, np Gardło"/>
            <button type="button" class="btn-close" onclick="removeHtmlItem(this.parentNode)"></button>
          </div>

          <!-- ------------- Button shows working area input ------------- -->
          <div class="new-working-area-btn" style="display: none; align-items: center;">
            <i class="fas fa-check ms-1" aria-hidden="true" style="margin-right: 10px;"></i>
            <button type="button" class="btn btn-success btn-sm mb-1 btn-new-category-dialog"
              onclick="btnAddNewWorkingAreaDialog(this)">
              Dodaj nowy obszar działania
            </button>
          </div>
        </div>

        <!-- ------------- Buttons for showing disease select or input ------------- -->
        <div class="btn-diseases">
          <button type="button" class="btn btn-success btn-sm mb-1 w-100 btn-new-category-dialog"
            onclick="btnAddNewDiseaseSelectDialog()">
            Dodaj kolejną przypadłość / chorobę
          </button>

          <button type="button" class="btn btn-success btn-sm mb-1 w-100 btn-new-category-dialog"
            onclick="btnAddNewDiseaseInputDialog()">
            Dodaj nową przypadłość / chorobę
          </button>
        </div>
      </div>

      <!-- ------------- Dialogue annotation - data loss warning before saving dialog ------------- -->
      <div class="dialogue-annotation">
        <p>UWAGA: Kliknięcie przycisku "Zapisz" spowoduje ponowne załadowanie strony i możliwość utracenia zmian, jakie zostały naniesione w formularzu dotyczącym rośliny leczniczej.
          Jeśli chcesz tego uniknąć, najpierw zapisz zmiany w formularzu dotyczącym rośliny leczniczej.</p>
      </div>

      <!-- ------------- Modal footer - buttons save and close ------------- -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">Zamknij</button>
        <button type="button" class="btn btn-primary" onclick="sendDialogCategory()">Zapisz</button>
      </div>

    </div>
  </div>
</div>