const addDiv = document.getElementById("add-div");

addDiv.addEventListener("click", () => {
    const quantityDiv = document.createElement("div");
    quantityDiv.classList.add("quantity");

    const minusBtn = document.createElement("button");
    minusBtn.classList.add("minus-btn", "panel-btn");
    minusBtn.textContent = "-";

    const quantityInput = document.createElement("input");
    quantityInput.classList.add("panel-btn");
    quantityInput.type = "number";
    quantityInput.value = 1;
    quantityInput.min = 1;

    const plusBtn = document.createElement("button");
    plusBtn.classList.add("plus-btn", "panel-btn");
    plusBtn.textContent = "+";

    quantityDiv.appendChild(minusBtn);
    quantityDiv.appendChild(quantityInput);
    quantityDiv.appendChild(plusBtn);

    addDiv.parentNode.replaceChild(quantityDiv, addDiv);

    minusBtn.addEventListener("click", (event) => {
        event.preventDefault();
        const currentValue = parseInt(quantityInput.value);
        if (currentValue > 1) {
            quantityInput.value = currentValue - 1;
        } else {
            quantityDiv.parentNode.replaceChild(addDiv, quantityDiv);
        }
    });

    plusBtn.addEventListener("click", (event) => {
        event.preventDefault();
        quantityInput.value = parseInt(quantityInput.value) + 1;
    });
});
