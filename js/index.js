
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

/* Login hidden */
loginClose.addEventListener("click", () => {
  login.classList.remove("show-login");
});
const adminpage = document.getElementById("AdminPage");

loginBtn.addEventListener("click", (event) => {
    event.preventDefault();
    if (document.cookie.includes("loginstatus=true")) {
        window.location.href = "Profile_Page.aspx";
    } else {
        login.classList.add("show-login");
    }
   
});
window.addEventListener("load", function () {
    console.log("hello");
   
    if (document.cookie.includes("loginstatus")) {
        if (document.cookie.includes("loginstatus=true") && document.cookie.includes("user_type=admin")) {
            adminpage.style.display = "inline-block";
        }
        else {
            adminpage.style.display = "none";
        }
    }
    else {
        document.cookie = "loginstatus=false; expires=Fri, 31 Dec 2024 23:59:59 GMT; path=/";
    
    }
    
    console.log(document.cookie);
});

