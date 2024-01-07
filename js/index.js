
/*=============== SHOW MENU ===============*/
const navMenu = document.getElementById("nav-menu"),
  navToggle = document.getElementById("nav-toggle"),
  navClose = document.getElementById("nav-close");

/* Menu show */
navToggle.addEventListener("click", () => {
  navMenu.classList.add("show-menu");
});

/* Menu hidden */
navClose.addEventListener("click", () => {
  navMenu.classList.remove("show-menu");
});

/*=============== SEARCH ===============*/
const search = document.getElementById("search"),
  searchBtn = document.getElementById("search-btn"),
  searchClose = document.getElementById("search-close");

/* Search show */
searchBtn.addEventListener("click", () => {
  search.classList.add("show-search");
});

/* Search hidden */
searchClose.addEventListener("click", () => {
  search.classList.remove("show-search");
});

/*=============== LOGIN ===============*/
const login = document.getElementById("login"),
  loginBtn = document.getElementById("login-btn"),
  loginClose = document.getElementById("login-close");

/* Login show */
//loginBtn.addEventListener("click", (event) => {
//    event.preventDefault();
//  login.classList.add("show-login");
//});

/* Login hidden */
loginClose.addEventListener("click", () => {
  login.classList.remove("show-login");
});
const adminpage = document.getElementById("AdminPage");

window.addEventListener("load", function () {
    console.log("hello");

    // Check if the cookie exists
    if (!document.cookie.includes("loginstatus=true")) {
        // Create the cookies with expiration and path
        document.cookie = "loginstatus=false; expires=Fri, 31 Dec 2024 23:59:59 GMT; path=/";
        loginBtn.addEventListener("click", (event) => {
            event.preventDefault();
            login.classList.add("show-login");
        });
    } else {
        if (document.cookie.includes("loginstatus=true") && document.cookie.includes("user_type=normal")){
            adminpage.style.display = "none";
        }
        //const loginstatus = document.cookie.split('; ')
        //    .find(row => row.startsWith('loginstatus='))
        //    ?.split('=')[1];  // Extract value if cookie exists

        //if (loginstatus === 'true') {
      
        //    document.cookie = "loginstatus=true; expires=Fri, 31 Dec 2024 23:59:59 GMT; path=/";
         
        //}
    }
    console.log(document.cookie);
});
///
