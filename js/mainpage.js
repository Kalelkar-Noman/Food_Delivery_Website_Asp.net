////document.title = "HomePage";

// Select elements for efficient access
const carouselItems = document.querySelector(".carousel-items");
const carouselNextButton = document.querySelector(".carousel-next");
const carouselPrevButton = document.querySelector(".carousel-prev");

// Track scroll position and button visibility
let currentScrollLeft = 0;
let prevButtonVisible = false;

// Initially hide the prev button
carouselPrevButton.style.visibility = "hidden";

// Handle next button click:
carouselNextButton.addEventListener("click", () => {
  const itemWidth = carouselItems.querySelector(".inner-con").offsetWidth;
  currentScrollLeft += itemWidth;

  // Limit scrolling to prevent empty space
  const maxScrollLeft = carouselItems.scrollWidth - carouselItems.clientWidth;
  currentScrollLeft = Math.min(currentScrollLeft, maxScrollLeft);

  carouselItems.scrollTo({
    left: currentScrollLeft,
    behavior: "smooth", // Enable smooth scrolling
  });

  // Show prev button after next button click
  prevButtonVisible = true;
  carouselPrevButton.style.visibility = "visible";
});

// Handle prev button click:
carouselPrevButton.addEventListener("click", () => {
  const itemWidth = carouselItems.querySelector(".inner-con").offsetWidth;
  currentScrollLeft -= itemWidth;

  // Limit scrolling to prevent going beyond the start
  currentScrollLeft = Math.max(currentScrollLeft, 0);

  carouselItems.scrollTo({
    left: currentScrollLeft,
    behavior: "smooth",
  });

  // Hide prev button if scrolled back to start
  if (currentScrollLeft === 0) {
    prevButtonVisible = false;
    carouselPrevButton.style.visibility = "hidden";
  }
});
//
const cartbutton = document.getElementById("cart-button");
const cartclosebutton = document.getElementById("cart-close");
cartclosebutton.addEventListener("click", () => {
  //console.log("clicking");
  document.getElementById("mySidepanel").classList.toggle("active");
  //console.log("clicked");
});
cartbutton.addEventListener("click", (event) => {
  event.preventDefault();
  //console.log("clicking");
  document.getElementById("mySidepanel").classList.toggle("active");
  //console.log("clicked");
});

//// Get the quantity input and buttons
//const quantityInput = document.querySelector(".quantity input");
//const minusBtn = document.querySelector(".minus-btn");
//const plusBtn = document.querySelector(".plus-btn");

// Decrement quantity
//plusButton.onclick = minusbtn(event, item.price, item.id, item.quantity);
//minusBtn.addEventListener("click", (event) => {
//  event.preventDefault();
//  let currentQuantity = parseInt(quantityInput.value);
//  if (currentQuantity > 1) {
//    quantityInput.value = currentQuantity - 1;
//  }
//});

//// Increment quantity
//plusBtn.addEventListener("click", (event) => {
//  event.preventDefault();
//  let currentQuantity = parseInt(quantityInput.value);
//  quantityInput.value = currentQuantity + 1;
//});

window.onload = function () {
  const elems = document.querySelectorAll(".category_icon");
    elems.forEach((element) => {
        switch (element.textContent.toLocaleLowerCase()) {
      case "sushi":
        element.innerHTML = "🍣";
        break;
      case "burger":
        element.innerHTML = "🍔";
        break;
      case "pizza":
        element.innerHTML = "🍕";
                break;
      case "chicken":
        element.innerHTML = "🍗";
        break;
    }
  });
};

// For category Icons

const categorys = document.querySelectorAll(".inner-con");

categorys.forEach(cat => {
    cat.addEventListener('click', () => {
        localStorage.setItem("catid",cat.id);
        //console.log(cat.id);
    })
    cat.classList.remove("inner-con-active");
});
let catid = localStorage.getItem("catid");
if (catid != null) {
    catid = document.getElementById(catid);
    catid.classList.add("inner-con-active");
} else {
    catid = document.getElementById("ContentPlaceHolder1_Inner_Menu");
    catid.classList.add("inner-con-active");
}

//cart section
/*let myCartArrayOfObjects = [];*/

let cart = document.querySelectorAll(".for-asp-access");
cart.forEach(elem => {
    elem.addEventListener('click', () => {
        let myCartArrayOfObjects = [];
        let mycart = document.getElementById(elem.id);
        let mycartobj = {
            id: mycart.getAttribute("data-id"),
            name: mycart.getAttribute("data-product-name"),
            img: mycart.getAttribute("data-image"),
            oldprice: mycart.getAttribute("data-price"),
            price: mycart.getAttribute("data-price"),
            quantity:1
        }
        //myCartArrayOfObjects.push(mycartobj);
        let dup = JSON.parse(localStorage.getItem('myCartData'));
        let isDuplicate = false;
        if (dup != null) {
            isDuplicate = dup.some(obj => parseInt(obj.id) == parseInt(mycartobj.id));
        }

        if (!isDuplicate) {
            // Push the object into the array if it's not a duplicate
            myCartArrayOfObjects.push(mycartobj);
            localStorage.setItem('myCartData', JSON.stringify(myCartArrayOfObjects));
            console.log('Object added:', mycartobj);
            document.getElementById("mySidepanel").classList.add("active");
            // Get a reference to the target div
            const sidepanel = document.getElementById('mySidepanel');

            // Create the cart item element
            const cartItem = document.createElement('div');
            cartItem.id = `cart-item-${mycart.getAttribute("data-id")}`;
            cartItem.classList.add('cart-item');

            // Add the product name
            const productName = document.createElement('h3');
            productName.textContent = mycart.getAttribute("data-product-name"); // Replace with your actual product name
            cartItem.appendChild(productName);

            // Create the cart side panel
            const cartSidePanel = document.createElement('div');
            cartSidePanel.classList.add('cart-side-panel');
            cartItem.appendChild(cartSidePanel);

            // Add the product image
            const productImage = document.createElement('img');
            productImage.src = mycart.getAttribute("data-image"); // Replace with your image path
            productImage.alt = 'Product Image';
            cartSidePanel.appendChild(productImage);

            // Create the price and quantity section
            const priceQuantitySection = document.createElement('div');
            priceQuantitySection.classList.add('sidepanel-quantity-price');
            cartSidePanel.appendChild(priceQuantitySection);

            // Add the price
            const price = document.createElement('p');
            price.classList.add('price');
            price.id = `price-${mycart.getAttribute("data-id")}`;
            price.textContent = mycart.getAttribute("data-price"); // Replace with your price
            priceQuantitySection.appendChild(price);

            // Create the quantity controls
            const quantityControls = document.createElement('div');
            quantityControls.classList.add('quantity');
           
            priceQuantitySection.appendChild(quantityControls);

            const minusButton = document.createElement('button');
            minusButton.classList.add('minus-btn', 'panel-btn');
            minusButton.onclick = function (event) {
                event.preventDefault();
                minusbtn(mycart.getAttribute("data-id"));
            };
            minusButton.textContent = '-';
            quantityControls.appendChild(minusButton);

            const quantityInput = document.createElement('input');
            quantityInput.classList.add('panel-btn');
            quantityInput.type = 'number';
            quantityInput.value = 1;
            quantityInput.min = 1;
            quantityInput.id = `quantity-${mycart.getAttribute("data-id")}`;
            quantityInput.setAttribute("disabled", "true");
            quantityControls.appendChild(quantityInput);

            const plusButton = document.createElement('button');
            plusButton.classList.add('plus-btn', 'panel-btn');
            plusButton.textContent = '+';
            plusButton.onclick = function (event) {
                event.preventDefault();
                plusbtn(mycart.getAttribute("data-id"));
            };
            quantityControls.appendChild(plusButton);

            // Append the cart item to the sidepanel
                sidepanel.appendChild(cartItem);
                      
        } else {
            console.log('Object already exists in the array.');
        }
    })
})
const storedArrayString = localStorage.getItem('myCartData');
if (storedArrayString) {
    myArray = JSON.parse(storedArrayString);
    myArray.forEach(item => {
        console.log(item);
        //
        //document.getElementById("mySidepanel").classList.add("active");
        // Get a reference to the target div
        const sidepanel = document.getElementById('mySidepanel');

        // Create the cart item element
        const cartItem = document.createElement('div');
        cartItem.id = `cart-item-${item.id}`;
        cartItem.classList.add('cart-item');

        // Add the product name
        const productName = document.createElement('h3');
        productName.textContent = item.name; // Replace with your actual product name
        cartItem.appendChild(productName);

        // Create the cart side panel
        const cartSidePanel = document.createElement('div');
        cartSidePanel.classList.add('cart-side-panel');
        cartItem.appendChild(cartSidePanel);

        // Add the product image
        const productImage = document.createElement('img');
        productImage.src = item.img; // Replace with your image path
        productImage.alt = 'Product Image';
        cartSidePanel.appendChild(productImage);

        // Create the price and quantity section
        const priceQuantitySection = document.createElement('div');
        priceQuantitySection.classList.add('sidepanel-quantity-price');
        cartSidePanel.appendChild(priceQuantitySection);

        // Add the price
        const price = document.createElement('p');
        price.classList.add('price');
        price.id = `price-${item.id}`;
        price.textContent = item.price; // Replace with your price
        priceQuantitySection.appendChild(price);

        // Create the quantity controls
        const quantityControls = document.createElement('div');
        quantityControls.classList.add('quantity');
        
        priceQuantitySection.appendChild(quantityControls);

        const minusButton = document.createElement('button');
        minusButton.classList.add('minus-btn', 'panel-btn');
        minusButton.onclick = function (event) {
            event.preventDefault();
            minusbtn(item.id);
        };
        minusButton.textContent = '-';
        quantityControls.appendChild(minusButton);

        const quantityInput = document.createElement('input');
        quantityInput.classList.add('panel-btn');
        quantityInput.type = 'number';
        quantityInput.value = 1;
        quantityInput.min = 1;
        quantityInput.id = `quantity-${item.id}`;
        quantityInput.setAttribute("disabled", "true");
        quantityControls.appendChild(quantityInput);

        const plusButton = document.createElement('button');
        plusButton.classList.add('plus-btn', 'panel-btn');
        plusButton.onclick = function (event) {
            event.preventDefault();
            plusbtn(item.id);
        };
        plusButton.textContent = '+';
        quantityControls.appendChild(plusButton);

        // Append the cart item to the sidepanel
        sidepanel.appendChild(cartItem);
        //
    });
}

function plusbtn(id) {

    console.log("item clicked");
    let storedArray = JSON.parse(localStorage.getItem("myCartData"));
    console.log(storedArray.length);
    //console.log(storedArray[0].id);
    for (i = 0; i < storedArray.length; i++) {
        if (parseInt(storedArray[i].id) == id) {
            //console.log("yes");
            console.log(parseInt(storedArray[i].quantity), parseInt(storedArray[i].price));
            storedArray[i].quantity = parseInt(storedArray[i].quantity) + 1;
            storedArray[i].price = parseInt(storedArray[i].oldprice) * parseInt(storedArray[i].quantity);
            document.getElementById(`price-${storedArray[i].id}`).textContent = storedArray[i].price;
            document.getElementById(`quantity-${storedArray[i].id}`).value = storedArray[i].quantity;
            localStorage.setItem("myCartData", JSON.stringify(storedArray));
            storedArray = [];
            break;
        }
    }
}
//function minusbtn(id) {
//    console.log("item clicked");
//    let storedArray = JSON.parse(localStorage.getItem("myCartData"));
//    console.log(storedArray.length, storedArray);
//    //console.log(storedArray[0].id);
//    for (i = 0; i < storedArray.length; i++) {
//        if (parseInt(storedArray[i].id) == id) {
//            console.log("yes");
//            console.log(parseInt(storedArray[i].quantity), parseInt(storedArray[i].price));
//            storedArray[i].quantity = parseInt(storedArray[i].quantity) - 1;
//            if (parseInt(storedArray[i].quantity) > 0) {
//                storedArray[i].price = parseInt(storedArray[i].oldprice) * parseInt(storedArray[i].quantity);
//                document.getElementById(`price-${storedArray[i].id}`).textContent = storedArray[i].price;
//                localStorage.setItem("myCartData", JSON.stringify(storedArray));
//            } else {
                
//                storedArray.splice(i, 1);
                
//                localStorage.setItem("myCartData", JSON.stringify(storedArray));
//                document.getElementById(`cart-item-${id}`).remove();

//            }
//            storedArray = [];
//            //localStorage.setItem("myCartData", JSON.stringify(storedArray));
//            //break;
//        }
//    }
//}
function minusbtn(id) {
    console.log("item clicked");

    // Retrieve cart data directly from localStorage
    let cartData = JSON.parse(localStorage.getItem("myCartData"));

    for (let i = 0; i < cartData.length; i++) {
        if (cartData[i].id === id) {
            cartData[i].quantity -= 1;

            if (cartData[i].quantity > 0) {
                // Update price and display
                cartData[i].price = cartData[i].oldprice * cartData[i].quantity;
                document.getElementById(`price-${cartData[i].id}`).textContent = cartData[i].price;
                document.getElementById(`quantity-${cartData[i].id}`).value = cartData[i].quantity;
            } else {
                // Remove item from cart data and DOM
                cartData.splice(i, 1);
                document.getElementById(`cart-item-${id}`).remove();
            }

            // Save updated cart data to localStorage
            localStorage.setItem("myCartData", JSON.stringify(cartData));
            break; // Exit the loop after finding and processing the item
        }
    }
}
