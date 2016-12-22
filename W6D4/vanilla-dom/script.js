document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  const addPlace = e => {
    e.preventDefault();
    const placeInput = document.getElementById("place-input");
    const placeInputValue = placeInput.value;
    placeInput.value = "";

    const ul = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = placeInputValue;

    ul.appendChild(li);
  };

  const places = document.getElementById('place-form');
  places.addEventListener("submit", addPlace);




  // adding new photos




});
