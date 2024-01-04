<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- ------------- Button remove from favourite users medicinal plants ------------- -->
<button type="button" class="btn-icon heart-minus-icon btn btn-floating btn-sm"
  data-mdb-ripple-init data-mdb-tooltip-init data-mdb-placement="top" title="Usuń z ulubionych"
  onclick="updateUserFavouritesMedicinalPlants(${param.medicinalId}, false)">
</button>