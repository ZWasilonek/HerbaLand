/* ----------------------- view: java-scripts.jsp --------------------------- */
/* used in buttonAddToFavourite and buttonRemoveFromFavourite */
const LOCALHOST_URL = "http://localhost:8080/";
var updateUserFavouritesMedicinalPlantsBtns = document.getElementsByClassName('btn-icon');

/* listener for an action add or remove user's favourite medicinal plant */
for (let i = 0; i < updateUserFavouritesMedicinalPlantsBtns.length; i++) {
  updateUserFavouritesMedicinalPlantsBtns[i].addEventListener("click", function(e) {
    e.preventDefault();
  });
}

/* send a request to add or remove a user's favorite medicinal plant */
function updateUserFavouritesMedicinalPlants(medicinalPlantId, isPlantAdded) {
  let xhr = new XMLHttpRequest();
  let url = LOCALHOST_URL + 'medicinal-plant/change-favourites/' + medicinalPlantId + '?isPlantAdded=' + isPlantAdded;
  xhr.open("GET", url, true);
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
      location.reload();
    }
  };
  xhr.send();
}