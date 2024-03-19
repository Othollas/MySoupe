// creation du menu sticky 
const header = document.querySelector(".header");
const body = document.querySelector("#body");
const main = document.querySelector("main");
const hamburger = document.querySelector(".hamburger");
const navMenu = document.querySelector(".nav-menu");



hamburger.addEventListener("click", () => {
    hamburger.classList.toggle("active");
    navMenu.classList.toggle("active");
});

main.addEventListener("click", ()=>{
    hamburger.classList.remove("active");
    navMenu.classList.remove("active");
})