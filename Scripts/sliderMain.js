// usefull links:
// https://developers.google.com/youtube/player_parameters

//modification
let resultWait = 1.5; //in seconds

//variables for scrolling
let width;
let index = 0;

let widthElement;

//required for parsing text to html
const parser = new DOMParser();

    /* --- | Disables Scrolling | --- */
function disableScroll() {
    document.body.classList.add("remove-scroll");
};

function enableScroll() {
    document.body.classList.remove("remove-scroll");
};

    /* --- | Main | --- */
window.onload = function() {
    TokenValidation();
    widthElement = document.createElement("div");
    document.body.appendChild(widthElement);
    widthElement.style.width = "100vw";

    console.log("TESTING: press \"enter\" to skip question");
    //loads data and generates html
    LoadData();

    //sets scroll length
    if (width == null) {
        width = widthElement.getBoundingClientRect().width;
    }

    //Resets position after refresh
    history.scrollRestoration = "manual";
    window.scrollTo({
        top: 0,
        left: 0,
        behavior: "instant"
    });

    //disables scrolling
    disableScroll();
};

    /* --- | Basic Responsibility | --- */
window.onresize = function() {
    width = widthElement.getBoundingClientRect().width;
    UpdateSlider();
}

    /* --- | Scrolls Horizontaly | --- */
function UpdateSlider() {
    window.scrollTo({
        top: 0,
        left: width*index,
        behavior: "smooth"
    });
}