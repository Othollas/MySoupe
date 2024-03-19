// creation du menu sticky 
const click = document.querySelector("#titleList");
const hamburger = document.getElementsByClassName("hamburger");
const navMenu = document.querySelector(".nav-menu");


hamburger.addEventListener("click", () => {
hamburger.classList.toggle(".active");
navMenu.classList.toggle(".active");
click.classList.toggle(".active");
})

