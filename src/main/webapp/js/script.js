// Make mobile navigation work

const btnNavEl = document.querySelector(".btn-mobile-nav");
const headerEl = document.querySelector(".header");

btnNavEl.addEventListener("click", function () {
    headerEl.classList.toggle("nav-open");
})

// Sticky navigation
const sectionHeroEl = document.querySelector(".section-hero");

const obs = new IntersectionObserver(
    function (entries) {
    const ent = entries[0];
    console.log(ent);

    if (ent.isIntersecting === false)
    document.body.classList.add("sticky");
    
    if (ent.isIntersecting === true)
    document.body.classList.remove("sticky");

},
{
    root: null,
    threshold: 0,
    rootMargin: "-80px"
});

obs.observe(sectionHeroEl);

//popup login
document.querySelector("#show-login").addEventListener("click",function (){
    document.querySelector(".modal_overlay").classList.add("active")
});
document.querySelector(".login-close-icon").addEventListener("click",function (){
    document.querySelector(".modal_overlay").classList.remove("active")
});

//////////////////////////////////////////////////////
function checkFlexGap() {
    var flex = document.createElement("div");
    flex.style.display = "flex";
    flex.style.flexDirection = "column";
    flex.style.rowGap = "1px";

    flex.appendChild(document.createElement("div"));
    flex.appendChild(document.createElement("div"));

    document.body.appendChild(flex);
    var isSupported = flex.scrollHeight === 1; // Corrected variable name
    flex.parentNode.removeChild(flex);
    console.log(isSupported);

    if (!isSupported) document.body.classList.add("no-flexbox-gap");
}
checkFlexGap();