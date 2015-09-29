var anchors = document.getElementsByTagName("a");
var html = document.getElementsByTagName("html")[0];
var hash = window.location.hash.slice(1);

function setLang(lang) {
    if (lang in {"sv": true, "en": true})
        html.lang = lang;
}

function scrollToSection (deltaPos) {
    var sections = document.getElementsByTagName("section");
    var sectionHeight = sections[0].offsetHeight;
    var scrollOffset = document.getElementsByTagName("body")[0].scrollTop;
    var sectionIds = Array.prototype.map.call(sections, function (element) {
        return element.id;
    });
    var currentPos = Math.floor((scrollOffset + 1) / sectionHeight);

    nextSection = sections[Math.min(sections.length - 1, currentPos + deltaPos)];
    window.location = "#" + nextSection.id;
}

setLang(hash);

window.addEventListener("hashchange", function (event) {
    setLang(this.location.hash.slice(1));
});

window.addEventListener("wheel", function (event) {
    scrollToSection(event.deltaY > 0 ? 1 : -1);
    event.preventDefault();
});

var touch = {
    startPageY: 0,
    currentPageY: null,
    minDeltaY: 100,

    onTouchStart: function (event) {
        this.startPageY = event.touches[0].pageY;
    },

    onTouchMove: function (event) {
        this.currentPageY = event.touches[0].pageY;
        event.preventDefault();
    },

    onTouchEnd: function (event) {
        if (this.currentPageY === null) {
            return;
        }
        pageYDelta = this.startPageY - this.currentPageY;
        if (pageYDelta > this.minDeltaY || pageYDelta < -this.minDeltaY) {
            var directionY = pageYDelta < 0 ? -1 : 1;
            window.dispatchEvent(
                new CustomEvent("verticalswipe", {detail: {directionY: directionY}})
            );
        }
        this.currentPageY = null;
    },

    init: function () {
        self = this;
        window.addEventListener("touchstart", function (event) { self.onTouchStart(event); });
        window.addEventListener("touchmove", function (event) { self.onTouchMove(event); });
        window.addEventListener("touchend", function (event) { self.onTouchEnd(event); });
    }
};
touch.init();

window.addEventListener("verticalswipe", function (event) {
    scrollToSection(event.detail.directionY);
});
