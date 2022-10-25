const sidebar = document.querySelector(".sidebar")
const buttonExpand = sidebar.querySelector(".sidebar__button-expand")

buttonExpand?.addEventListener("click", function (event) {
    const svg = buttonExpand.querySelector("svg")
    if (svg.classList.contains("rotate-180")) {
        svg.classList.remove("rotate-180")
        sidebar.classList.add("expand")
    } else {
        svg.classList.add("rotate-180")
        sidebar.classList.remove("expand")
    }
})