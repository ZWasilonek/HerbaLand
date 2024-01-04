<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!-- ------------- Modal ------------- -->
<div class="modal fade" id="showVideoDialog" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">

    <div class="modal-content">
      <form action="/file/send" method="post" enctype="multipart/form-data">
        <!-- ------------- Modal Header ------------- -->
        <div class="modal-header d-block">
          <label for="formFileMultiple" class="form-label">Dodaj nowy film w formacie MP4:</label>
        </div>

        <!-- ------------- Modal Body ------------- -->
        <div class="modal-body">
          <!-- Input for video home -->
          <input class="form-control" name="file" type="file" id="formFileMultiple" />

          <label for="formFileSourceLink" class="mt-3 form-label">Link do źródła:</label>
          <input class="form-control" name="sourceLink" type="text" id="formFileSourceLink" />

          <button type="button" class="mt-4 btn btn-secondary" data-mdb-dismiss="modal">Zamknij</button>
          <input type="submit" class="btn bg-darkseagreen"></input>
        </div>
      </form>
    </div>
  </div>
</div>