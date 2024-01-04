<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- ------------- Button add to favourite users medicinal plants ------------- -->
<button type="button" class="btn-icon leaves-heart-icon btn btn-floating btn-sm"
  data-mdb-ripple-init data-mdb-tooltip-init data-mdb-placement="top" title="Dodaj do ulubionych"
  onclick="updateUserFavouritesMedicinalPlants(${param.medicinalId}, true)">
</button>