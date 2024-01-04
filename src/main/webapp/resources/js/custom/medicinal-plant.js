/* ----------------------- view: medicinal-plant.jsp --------------------------- */
/* replaces \r (carriage), \n (new line) characters on break lines (<br>) */
let elementsP = document.getElementsByTagName('p');
for (let p of elementsP) {
  let result = p.innerHTML;
  result = result.replace(/\r\n/g, "<br>").replace(/\n/g, "<br>");
  p.innerHTML = result;
}