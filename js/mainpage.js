
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
