/* *********************** Assign New Categories For Medicinal Plant ************************ */
/* ------- view: form-medicinal-plant.jsp, section: <div id="category-container"...> -------- */

/* *********************** VARIABLES, CONSTANTS ************************ */
var allCategories, cloneNewDiseaseDiv, cloneNewWorkingAreaDiv, selectedPillWithCategoryID;
var plantCategoriesArr = new Array();
var categoriesArr = new Array();
var diseasesArr = new Array();
var workingAreasArr = new Array();
var allDiseases = new Array();
var allWorkingAreas = new Array();
const LOCALHOST_URL = "http://localhost:8080/";

const newDiseaseInputClassName = 'disease-input';
const newDiseaseDivClassName = 'new-disease-div';
const newWorkingAreaInputDivClassName = 'working-area-input-div';
const newWorkingAreaInputClassName = 'working-area-input';
const newWorkingAreaSelectDivClassName = 'working-area-select-div';
const btnAddNewInputWorkingAreaClassName = 'new-working-area-btn';
const newWorkingAreaSelectClassName = 'working-area-select';
const formCheckInputClassName = 'form-check-input';
const styleDisplayFlexAlignItemsCenter = 'display: flex!important; align-items: center;';
const styleDisplayFlex = 'display: flex;';
const styleDisplayNone = 'display: none;';
const styleDisplayNoneAlignItemsCenter = 'display: none; align-items: center;';
var submitCategoryBtn = document.getElementById('submitCategoryBtn');

/* send the assigned category for medicinal plant to the backend */
function sendCategory() {
  let xhr = new XMLHttpRequest();
  let url = LOCALHOST_URL + "medicinal-plant/send-plant-categories";
  xhr.open("POST", url, true);
  xhr.setRequestHeader("Content-Type", "application/json");
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
      document.getElementById("formMedicinalPlant").submit();
    }
  };
  var data = JSON.stringify(plantCategoriesArr);
  xhr.send(data);
}

/* send the assigned category for the medicinal plant to the backend
before updating the entire plant by submit form */
submitCategoryBtn.onclick = function(e) {
  e.preventDefault();
  if (plantCategoriesArr.length > 0) {
    sendCategory();
  } else {
    document.getElementById("formMedicinalPlant").submit();
  }
};

/* initialize category section */
function initCategoryArr(plantCategoriesJson, allCategoriesJson) {
  cloneNewDiseaseDiv = document.getElementsByClassName(newDiseaseDivClassName)[0].cloneNode(true);
  cloneNewWorkingAreaInputDiv = document.getElementsByClassName(newWorkingAreaInputDivClassName)[0].cloneNode(true);
  cloneNewWorkingAreaSelectDiv = document.getElementsByClassName(newWorkingAreaSelectDivClassName)[0].cloneNode(true);
  allCategories = allCategoriesJson;
  allCategories = allCategoriesJson;
  setCategoryIDFromSelectedPill(allCategories[0].id);

  if (plantCategoriesJson != null && plantCategoriesJson != undefined && plantCategoriesJson[0] != null) {
    plantCategoriesArr = plantCategoriesJson;
    sortArray(plantCategoriesArr);

    for (let category of plantCategoriesArr) {
      for (let disease of category.diseases) {
        //check the diseases that have been assigned to the medicinal plant in multiple select
        let diseasesSelects = document.getElementsByClassName("custom-select");
        for (let diseaseSelect of diseasesSelects) {
          for (let diseaseOption of diseaseSelect.options) {
            if (diseaseOption.value == disease.id) {
              diseaseOption.selected = true;
            }
          }
        }

        //check the working areas that have been assigned to the medicinal plant in specific disease option
        let WACheckboxesCssID = category.id + "-workingArea-" + disease.id + "-checkboxes";
        let WACheckboxesDiv = document.getElementById(WACheckboxesCssID);
        let wa_checkboxes = Array.from(WACheckboxesDiv.querySelectorAll('.' + formCheckInputClassName));
        let wa_checkboxSelectAll;
        //let wa_checkboxes = Array.from(WACheckboxesDiv.querySelectorAll(formCheckInputClassName));
        for (let workingArea of disease.workingAreas) {
          for (let wa_checkbox of wa_checkboxes) {
            if (wa_checkbox.value == 0) wa_checkboxSelectAll = wa_checkbox; // przypisanie checkbox "zaznacz wszystkie" / "odznacz wszystkie"
            if (wa_checkbox.defaultValue == workingArea.id || wa_checkbox.value == workingArea.id) {
              wa_checkbox.checked = true;
              wa_checkboxes = wa_checkboxes.filter(function(value, index, arr){
                return value.defaultValue != wa_checkbox.defaultValue;
              });
              break;
            }
          }
          // setting value checkbox's label to "Odznacz wszystkie" or "Zaznacz wszystkie";
          const isSomeCheckboxNotChecked = (checkbox) =>
            checkbox.value != 0 && checkbox.checked == false;

          if (wa_checkboxes.some(isSomeCheckboxNotChecked)) {
            wa_checkboxSelectAll.labels[0].innerText = "Zaznacz wszystkie";
          } else wa_checkboxSelectAll.labels[0].innerText = "Odznacz wszystkie";
        }
      }
    }
    displaySelectedCategories();
  }
}

/* saving the currently processed category to a global variable */
function setCategoryIDFromSelectedPill(categoryID) {
  selectedPillWithCategoryID = categoryID;
}

/* showing all categories assigned to the edited medicinal plant on website */
function displaySelectedCategories() {
  let divCategoryContainer = document.getElementById('plantCategories');
  if (plantCategoriesArr != undefined && plantCategoriesArr.length != 0) {
    divCategoryContainer.hidden = false;
  } else divCategoryContainer.hidden = true;
  showSelectedCategory();
}

/* assignment to the 'id' and 'for' generated uuid html attributes */
function setWACheckboxesAndLabelsCssId() {
  for (let WAItem of document.querySelectorAll('.form-check')) {
    let input = WAItem.getElementsByClassName(formCheckInputClassName)[0];
    let label = WAItem.getElementsByClassName('form-check-label')[0];
    let cssId = generateUUID() + "-workingArea";
    input.id = cssId;
    label.setAttribute("for", cssId);
  }
}
setWACheckboxesAndLabelsCssId();

/* assigning selected working area checkbox to the edited medicinal plant and displaying them on the website */
function setWACategory(isCheckboxChecked, categoryID, categoryName, diseaseID, diseaseName, workingAreaID, workingAreaName) {
  setCategory(isCheckboxChecked, categoryID, categoryName, diseaseID, diseaseName, workingAreaID, workingAreaName);
  displaySelectedCategories();
}

/* after selecting the "Zaznacz wszystkie" or "Odznacz wszystkie" checkbox,
it displays or removes all working areas on the page for the selected disease
assigned to the edited medicinal plant */
function setAllWACategory(allWACheckbox, categoryID, categoryName, diseaseID, diseaseName) {
  let WACheckboxesDiv = allWACheckbox.parentNode.parentNode;
  let WACheckboxes = WACheckboxesDiv.getElementsByClassName(formCheckInputClassName);
  let shouldCheckAll;

  for (let checkbox of WACheckboxes) {
    if (checkbox.value == 0) { //checkbox "Zaznacz / Odznacz wszystkie"
      shouldCheckAll = checkbox.labels[0].innerText == "Zaznacz wszystkie" ? true : false;
      checkbox.labels[0].innerText = shouldCheckAll ? "Odznacz wszystkie" : "Zaznacz wszystkie";
      checkbox.checked = false;
      continue;
    }
    if (shouldCheckAll) { // Zaznacz wszystkie
      checkbox.checked = true;
      setCategory(checkbox.checked, categoryID, categoryName, diseaseID, diseaseName,
        checkbox.value, checkbox.labels[0].innerText);
    } else { //Odznacz wszystkie
      checkbox.checked = false;
      setCategory(checkbox.checked, categoryID, categoryName, diseaseID, diseaseName,
        checkbox.value, checkbox.labels[0].innerText);
    }
  }
  displaySelectedCategories();
}

/* adds or removes the selected category or its child object from the global variable 'plantCategoriesArr'
storing all categories assigned to the edited medicinal plant */
function setCategory(isCheckboxChecked, categoryID, categoryName, diseaseID, diseaseName,
                     workingAreaID, workingAreaName) {
  if (isCheckboxChecked) {
    createCategory(categoryID, categoryName, diseaseID, diseaseName, workingAreaID, workingAreaName);
  } else {
    removeCategory(diseaseID, workingAreaID);
  }
}

/* generates all categories assigned to the edited plant in the form of 'cards' on the website */
function showSelectedCategory(){
  const plantCategoriesCssId = 'plantCategories';
  removeElementsByClass('card');

  if (plantCategoriesArr != undefined && plantCategoriesArr.length != 0) {
    for (let categoryIndex = 0; categoryIndex < plantCategoriesArr.length; categoryIndex++) {
      let category = plantCategoriesArr[categoryIndex];
      let categoryName = category.name;
      let categoryID = category.id;
      let colNumberCssClassName;
      let cardCategoryCssIdName = 'category' + categoryID;
      let cardBodyCategoryCssIdName = 'selectedCategory' + categoryID;

      createHtml_card_CategoryName(plantCategoriesCssId, cardCategoryCssIdName);
      createHtml_cardHeader(cardCategoryCssIdName, categoryName);
      createHtml_cardBody(cardCategoryCssIdName, cardBodyCategoryCssIdName, colNumberCssClassName);

      for (let diseaseIndex = 0; diseaseIndex < category.diseases.length; diseaseIndex++) {
        let disease = category.diseases[diseaseIndex];
        let diseaseName = disease.name;
        let diseaseDivCssId = categoryID + generateUUID() + '-diseaseCard';
        createHtml_diseaseDiv(diseaseDivCssId, cardBodyCategoryCssIdName, diseaseName);

        for (let waIndex = 0; waIndex < disease.workingAreas.length; waIndex++) {
          let workingArea = disease.workingAreas[waIndex];
          let workingAreaName = workingArea.name;
          createHtml_cardText(diseaseDivCssId, workingAreaName);
        }
      }
    }
  }

  function createHtml_card_CategoryName(idToWhichWeAppend, cssIdName) {
    let card = document.createElement('div');
    card.setAttribute('id', cssIdName);
    card.setAttribute('class', 'card');
    card.setAttribute('style', 'width: 100%;');
    document.getElementById(idToWhichWeAppend).appendChild(card);
  }
  function createHtml_cardTitle(idToWhichWeAppend, diseaseName) {
    let cardTitle = document.createElement('h4');
    cardTitle.setAttribute('class', 'card-title');
    cardTitle.innerText=diseaseName;
    document.getElementById(idToWhichWeAppend).appendChild(cardTitle);
  }
  function createHtml_cardHeader(idToWhichWeAppend, categoryName) {
    let cardHeader = document.createElement('div');
    cardHeader.setAttribute('class', 'card-header');
    cardHeader.innerText=categoryName;
    document.getElementById(idToWhichWeAppend).appendChild(cardHeader);
  }
  function createHtml_cardBody(idToWhichWeAppend, cssIdName, cssClassName) {
    let cardBody = document.createElement('div');
    className = 'card-body';
    cardBody.setAttribute('id', cssIdName);
    if (cssClassName != undefined) className += ' ' + cssClassName;
    cardBody.setAttribute('class', className + "; d-flex");
    cardBody.setAttribute('style', "flex-wrap: wrap; justify-content: space-evenly;");
    document.getElementById(idToWhichWeAppend).appendChild(cardBody);
  }
  function createHtml_diseaseDiv(diseaseDivCssId, idToWhichWeAppend, diseaseName) {
    let diseaseDiv = document.createElement('div');
    diseaseDiv.setAttribute('id', diseaseDivCssId);
    diseaseDiv.setAttribute('style', "margin: 10px; text-align: center; flex-grow: 6;");
    document.getElementById(idToWhichWeAppend).appendChild(diseaseDiv);
    createHtml_cardTitle(diseaseDivCssId, diseaseName);
  }
  function createHtml_cardText(idToWhichWeAppend, workingAreaName) {
    let cardText = document.createElement('p');
    cardText.setAttribute('class', 'card-text');
    cardText.innerText=workingAreaName;
    document.getElementById(idToWhichWeAppend).appendChild(cardText);
  }
}

/* adds the newly selected category to the global variable 'plantCategoriesArr'
storing all categories assigned to the edited medicinal plant */
function createCategory(categoryID, categoryName, diseaseID, diseaseName, workingAreaID, workingAreaName) {
  let tempCategory = getCategoryItem(categoryID, categoryID, categoryName, categoriesArr, 'category');
  let tempDisease = getCategoryItem(categoryID, diseaseID, diseaseName, diseasesArr, 'disease');
  let tempWorkingArea = getCategoryItem(categoryID, workingAreaID, workingAreaName, workingAreasArr, null);

  pushObjectToArray(tempDisease.workingAreas, tempWorkingArea);
  sortArray(tempDisease.workingAreas);
  pushObjectToArray(tempCategory.diseases, tempDisease);
  sortArray(tempCategory.diseases);
  pushObjectToArray(plantCategoriesArr, tempCategory);
  sortArray(plantCategoriesArr);
}

/* removes the selected category from the global variable 'plantCategoriesArr'
storing all categories assigned to the edited medicinal plant */
function removeCategory(diseaseID, workingAreaID) {
  let diseaseIDToRemove;
  let categoryIDToRemove;
  let firstLength;
  let secondLength;
  for (let category of plantCategoriesArr) {
    if (selectedPillWithCategoryID == category.id) {
      for (let disease of category.diseases) {
        if (diseaseID == disease.id) {
          firstLength = disease.workingAreas.length;
          disease.workingAreas = disease.workingAreas.filter((item) => item.id != workingAreaID);
          secondLength = disease.workingAreas.length;
          if (disease.workingAreas.length === 0) {
            diseaseIDToRemove = disease.id;
          }
          if (firstLength !== secondLength) break;
        }
      }
      if (diseaseIDToRemove != undefined) {
        firstLength = category.diseases.length;
        category.diseases = category.diseases.filter((item) => item.id != diseaseIDToRemove);
        secondLength = category.diseases.length;
        if (category.diseases.length === 0) {
          categoryIDToRemove = category.id;
        }
        if (firstLength !== secondLength) break;
      }
    }
  }
  if (categoryIDToRemove != undefined) {
    plantCategoriesArr = removeItem(plantCategoriesArr, categoryIDToRemove);
  }
}

/* adds or finds a selected category from the global variable 'plantCategoriesArr'
storing all categories assigned to the edited plant */
function getCategoryItem(categoryID, id, name, searchArray, categoryLevel) {
  let CategoryItem = new Object();
  if (id != null && id != undefined) {

    let categoryByID = findCategoryItemByID(categoryID, plantCategoriesArr);
    let foundCategoryItem = findNode("name", name, categoryByID);

    if (foundCategoryItem != null && foundCategoryItem != undefined) {
      return window.structuredClone(foundCategoryItem);
    } else if (name != null && name != undefined) {
      return createCategoryItem(id, name, categoryLevel);
    }
  }
}

/* creates a new category with nesting objects */
function createCategoryItem(id, name, categoryLevel) {
  let CategoryItem = new Object();
  CategoryItem.id = id;
  CategoryItem.name = name;
  if (categoryLevel === 'category') {
    CategoryItem.diseases = new Array();
  } else if (categoryLevel === 'disease') {
    CategoryItem.workingAreas = new Array();
  }
  return window.structuredClone(CategoryItem);
}

/* finds a category or an object nested within it */
function findNode (keyToMatch, valueToMatch, node) {
  let array = new Array();
  if (isObject(node)) {
    for (const [key, value] of Object.entries(node)) {
      if (isArray(value)) {
        array = value;
        break;
      }
      if (key === keyToMatch && value === valueToMatch) {
        return node;
      }
    }
  } else if (isArray(node)) {
    array = node;
  }
  for (const node of array) {
    const child = findNode(keyToMatch, valueToMatch, node);
    if (child) return child;
  }
}

/* after checking the disease option, it discovers section on the website with working areas checkboxes */
function showWorkingAreasByDiseaseID(diseaseID) {
  const wa_checkboxes = document.querySelectorAll('.sec-checkboxes');
  wa_checkboxes.forEach(item => {
    item.style.display = "none";
  });
  const checkboxesDivIdentifier = selectedPillWithCategoryID + "-workingArea-" + diseaseID + "-checkboxes";
  let workingAreaCheckboxesSection = document.getElementById(checkboxesDivIdentifier);

  if (workingAreaCheckboxesSection != null && workingAreaCheckboxesSection != undefined) {
    workingAreaCheckboxesSection.style.display = "flex";
  }
}

function findCategoryItemByID(id, array) {
  return array.find(x => x.id == id);
}

function findCategoryItemByName(name, array) {
  return array.find(x => x.name == name);
}

function pushObjectToArray(array, object) {
  if (array.some(categoryItem => categoryItem.id === object.id)) {
    removeItem(array, object.id);
    array.push(object);
  } else array.push(object);
}




/* *********************** DIALOG CREATE OR UPDATE CATEGORY ************************ */
/* ----------------------- view: new-category-dialog.jsp --------------------------- */

/* *********************** VARIABLES, CONSTANTS ************************ */
var newDialogCategoryInput = document.getElementById('newCategoryTitle');
var formCategory;
const defaultOptionSelected = -1;
const modalBodyDiv = document.getElementsByClassName('modal-body')[0];
const inputDiseaseDivClassName = 'input-disease-div';
const selectDiseaseDivClassName = 'select-disease-div';
const diseaseSelectClassName = 'disease-select';


/* clicking the 'Dodaj kolejną przypadłość / chorobę' button brings up the select on page
with all diseases available in the database */
function btnAddNewDiseaseSelectDialog() {
  let newDiseaseDiv = createNewDiseaseDiv();
  changeCssTextStyleForArray(newDiseaseDiv.getElementsByClassName(inputDiseaseDivClassName), styleDisplayNone);
  changeCssTextStyleForArray(newDiseaseDiv.getElementsByClassName(selectDiseaseDivClassName), styleDisplayFlexAlignItemsCenter);
  modalBodyDiv.insertBefore(newDiseaseDiv, modalBodyDiv.childNodes[modalBodyDiv.childNodes.length - 2]);
  setNewDiseaseListener();
}

/* clicking the 'Dodaj nową przypadłość / chorobę' button causes input to appear on the website */
function btnAddNewDiseaseInputDialog() {
  let newDiseaseDiv = createNewDiseaseDiv();
  changeCssTextStyleForArray(newDiseaseDiv.getElementsByClassName(inputDiseaseDivClassName), styleDisplayFlex);
  changeCssTextStyleForArray(newDiseaseDiv.getElementsByClassName(selectDiseaseDivClassName), styleDisplayNoneAlignItemsCenter);
  modalBodyDiv.insertBefore(newDiseaseDiv, modalBodyDiv.childNodes[modalBodyDiv.childNodes.length - 2]);
  setNewDiseaseListener();
}

/* copies div with select with all diseases available in the database
along with the working areas assigned to them */
function createNewDiseaseDiv() {
  let newDiseaseDiv = cloneNewDiseaseDiv.cloneNode(true);
  generateNewCssIdForItems(newDiseaseDiv.getElementsByClassName(newDiseaseInputClassName));
  generateNewCssIdForItems(newDiseaseDiv.getElementsByClassName(newWorkingAreaInputClassName));
  return newDiseaseDiv;
}

/* clicking the 'Dodaj nowy obszar działania' button inserts a copy of the input into the page
to provide a new working area assigned to a specific disease */
function btnAddNewWorkingAreaDialog(item) {
  const newDiseaseDiv = item.parentNode.parentNode;
  newDiseaseDiv.insertBefore(createNewWorkingAreaInputDiv(), newDiseaseDiv.childNodes[newDiseaseDiv.childNodes.length - 2]);
}

/* copies div with input to provide a new working area */
function createNewWorkingAreaInputDiv() {
  let newWorkingAreaDiv = cloneNewWorkingAreaInputDiv.cloneNode(true);
  newWorkingAreaDiv.style.cssText = styleDisplayFlexAlignItemsCenter;
  return newWorkingAreaDiv;
}

/* gives all input and select elements with diseases an event detecting the selection of a given disease
or entering a new disease to display the working areas assigned to the disease existing
in the database on the website */
function setNewDiseaseListener() {
  var newInputDiseases = document.getElementsByClassName(newDiseaseInputClassName);
  var newSelectDiseases = document.getElementsByClassName(diseaseSelectClassName);

  for (let i = 0; i < newInputDiseases.length; i++) {
    newInputDiseases[i].addEventListener("input", function() {
      setNewDiseaseItemsVisibility(this);
    });
  }
  for (let i = 0; i < newSelectDiseases.length; i++) {
    let diseaseSelect = newSelectDiseases[i];
    diseaseSelect.addEventListener("change", function() {
      setNewDiseaseItemsVisibility(this);
      setDefaultSelectedOptions(this);
    });
  }
};
setNewDiseaseListener();

/* discovers all sections on the website with working areas that will be related to the selected disease */
function setNewDiseaseItemsVisibility(newDiseaseInputOrSelect) {
  let newDiseaseDiv = newDiseaseInputOrSelect.parentNode.parentNode;
  let workingAreasInputDiv = newDiseaseDiv.getElementsByClassName(newWorkingAreaInputDivClassName);
  let workingAreasSelectDiv = newDiseaseDiv.getElementsByClassName(newWorkingAreaSelectDivClassName);
  let newInputWorkingAreasBtn = newDiseaseDiv.getElementsByClassName(btnAddNewInputWorkingAreaClassName);

  if (newDiseaseInputOrSelect.value !== '' && newDiseaseInputOrSelect.value != defaultOptionSelected) {
    changeCssTextStyleForArray(workingAreasSelectDiv, styleDisplayFlexAlignItemsCenter);
    changeCssTextStyleForArray(newInputWorkingAreasBtn, styleDisplayFlexAlignItemsCenter);
  } else {
    changeCssTextStyleForArray(workingAreasSelectDiv, styleDisplayNoneAlignItemsCenter);
    changeCssTextStyleForArray(workingAreasInputDiv, styleDisplayNoneAlignItemsCenter);
    changeCssTextStyleForArray(newInputWorkingAreasBtn, styleDisplayNoneAlignItemsCenter);
  }
}

/* selects all options on the page with working areas in the select element,
which in the database are associated with the parent disease or the default
option 'Wybierz obszar działania' */
function setDefaultSelectedOptions(diseaseSelect) {
  let workingAreaSelect = diseaseSelect.parentNode.parentNode.getElementsByClassName(newWorkingAreaSelectClassName)[0];
  let diseaseObject = findCategoryItemByID(diseaseSelect.value, diseasesArr);
  if (diseaseObject != null && diseaseObject != undefined) {
    for (let i = 0; i < workingAreaSelect.options.length; i++) {
      for (let j = 0; j < diseaseObject.workingAreas.length; j++) {
        if (workingAreaSelect.options[i].value == defaultOptionSelected) {
          workingAreaSelect.options[i].selected = false;
          break;
        }
        if (workingAreaSelect.options[i].value == diseaseObject.workingAreas[j].id) {
          workingAreaSelect.options[i].selected = true;
          break;
        }
      }
    }
  }
}

/* clicking on the edit category reveals a dialog into which the data of the selected category
will be loaded, or an empty form when selecting the new category option */
function editDialogCategory(formCategoryID) {
  getClearedDialogCategory();
  formCategory = findCategoryItemByID(formCategoryID, allCategories);
  if (formCategory != undefined) {
    newDialogCategoryInput.value = formCategory.name;
  } else formCategory.name = newDialogCategoryInput.value;

  let dialogDiseasesDIVs = document.getElementsByClassName(newDiseaseDivClassName);
  for (let i = 0; i < formCategory.diseases.length; i++) {
    let formDisease = formCategory.diseases[i];
    let dialogDiseasesDIV = dialogDiseasesDIVs[i];
    let dialogDiseaseSelect = dialogDiseasesDIV.getElementsByClassName(diseaseSelectClassName)[0];
    dialogDiseaseSelect.value = formDisease.id;

    btnAddNewDiseaseSelectDialog();
    setNewDiseaseItemsVisibility(dialogDiseaseSelect);

    let dialogWorkingAreasSelect = dialogDiseasesDIV.getElementsByClassName(newWorkingAreaSelectClassName)[0];
    for (let j = 0; j < dialogWorkingAreasSelect.options.length; j++) {
      for (let k = 0; k < formDisease.workingAreas.length; k++) {
        if (dialogWorkingAreasSelect.options[j].value == defaultOptionSelected) {
          dialogWorkingAreasSelect.options[j].selected = false;
          break;
        }
        if (dialogWorkingAreasSelect.options[j].innerText === formDisease.workingAreas[k].name) {
          dialogWorkingAreasSelect.options[j].selected = true;
          break;
        }
      }
    }
  }
}

/* clears data from the dialogue form of the selected category */
function getClearedDialogCategory() {
  newDialogCategoryInput.value = '';
  removeElementsByClass(newDiseaseDivClassName);
  modalBodyDiv.insertBefore(createNewDiseaseDiv(), modalBodyDiv.childNodes[modalBodyDiv.childNodes.length - 2]);
  setNewDiseaseListener();
}

/* clicking the 'Zapisz' button in the selected category dialog sends the data to the backend */
function sendDialogCategory() {
  formCategory = getCategoryFromDialog();
  let xhr = new XMLHttpRequest();
  let url = LOCALHOST_URL + "medicinal-plant/send-dialog-category";
  xhr.open("POST", url, true);
  xhr.setRequestHeader("Content-Type", "application/json");
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
      location.reload();
    }
  };
  var data = JSON.stringify(formCategory);
  xhr.send(data);
}

/* prepares data of the selected category for editing, which will be displayed in the dialog */
function getCategoryFromDialog() {
  let categoryName, categoryID;
  let foundFormCategory = findCategoryItemByName(newDialogCategoryInput.value, allCategories);
  if (foundFormCategory != undefined) {
    categoryID = foundFormCategory.id;
    categoryName = foundFormCategory.name;
  } else {
    categoryName = newDialogCategoryInput.value; //get category name from input
    categoryID = null;
  }
  formCategory = createCategoryItem(categoryID, categoryName, 'category');

  let dialogDiseasesDIVs = document.getElementsByClassName(newDiseaseDivClassName);
  let index = 0;
  for (let i = 0; i < dialogDiseasesDIVs.length; i++) {
    let dialogDiseasesDIV = dialogDiseasesDIVs[i];
    let dialogDiseaseSelect = dialogDiseasesDIV.getElementsByClassName(diseaseSelectClassName)[0];
    let dialogDiseaseInput = dialogDiseasesDIV.getElementsByClassName(newDiseaseInputClassName)[0];
    if (dialogDiseaseInput.value === '' && dialogDiseaseSelect.value == defaultOptionSelected) continue;
    if (dialogDiseaseInput.value !== '') { //If input not empty set disease name
      formCategory.diseases[index] = createCategoryItem(null, dialogDiseaseInput.value, 'disease');
    } else if (dialogDiseaseSelect.value != defaultOptionSelected) { //If selected disease set name
      formCategory.diseases[index] = createCategoryItem(dialogDiseaseSelect.value,
        dialogDiseaseSelect.options[dialogDiseaseSelect.selectedIndex].text, 'disease');
    }

    let dialogWorkingAreasInputDIVs = dialogDiseasesDIV.getElementsByClassName(newWorkingAreaInputDivClassName);
    for (let j = 0; j < dialogWorkingAreasInputDIVs.length; j++) {
      let dialogWorkingAreaInput = dialogWorkingAreasInputDIVs[j].getElementsByTagName('input')[0];
      if (dialogWorkingAreaInput.value !== '') {
        formCategory.diseases[index].workingAreas.push(createCategoryItem(null,
          dialogWorkingAreaInput.value, null));
      }
    }
    let dialogWorkingAreasSelect = dialogDiseasesDIV.getElementsByClassName(newWorkingAreaSelectClassName)[0];
    let options = dialogWorkingAreasSelect && dialogWorkingAreasSelect.options;
    let opt;

    for (let j=0, jLen=options.length; j<jLen; j++) {
      opt = options[j];

      if (opt.selected && opt.value != defaultOptionSelected) {
        formCategory.diseases[index].workingAreas.push(createCategoryItem(opt.value, opt.text, null));
      }
    }
    if (formCategory.diseases[index] != undefined && formCategory.diseases[index] != null) index++;
  }
  return formCategory;
}

setWACheckboxesAndLabelsCssId();




/* *********************** UTILS ************************ */
function changeCssTextStyleForArray(items, newCssText) {
  for (let i = 0; i < items.length; i++) {
    items[i].style.cssText = newCssText;
  }
}

function generateNewCssIdForItems(items) {
  for (let item of items) {
    item.setAttribute("id", generateUUID());
  }
}

function removeHtmlItem(htmlItem) {
  htmlItem.parentNode.removeChild(htmlItem);
}

function generateUUID() {
  return crypto.randomUUID();
}

function removeElementsByClass(className){
  const elements = document.getElementsByClassName(className);
  while(elements.length > 0){
    elements[0].parentNode.removeChild(elements[0]);
  }
}

function removeItem(array, id) {
  let ci_index = array.map(x => {
    return x.id;
  }).indexOf(id);

  if (ci_index != undefined && ci_index !== -1) {
    array.splice(ci_index, 1);
  }
  return array;
}

function sortArray(array) {
  return array.sort((a,b) => (a.name > b.name) ? 1 : ((b.name > a.name) ? -1 : 0))
}

const isObject = (value) => {
  return !!(value && typeof value === "object" && !Array.isArray(value));
};

const isArray = (value) => {
  return Array.isArray(value);
};