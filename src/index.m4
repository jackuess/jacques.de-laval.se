<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Jacques de Laval</title>
        <style type="text/css">
        include(`css/style.css.m4')
        </style>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    </head>
    <body>
        <header>
            <div class="wrapper">
                <nav id="menu">
                    <ul>
                        <li lang="en"><a href="#project">Projects</a></li>
                        <li lang="en"><a href="#about">About me</a></li>
                        <li lang="sv"><a href="#project">Projekt</a></li>
                        <li lang="sv"><a href="#about">Om mig</a></li>
                    </ul>
                </nav>
                <nav id="language">
                    <ul>
                        <li><a class="set_lang" href="#en">En</a></li>
                        <li><a class="set_lang" href="#sv">Sv</a></li>
                    </ul>
                </nav>
                <h1><a href="#contact_info">Jacques <span id="sirname">de Laval</span></a></h1>
            </div>
        </header>
        <section id="contact_info">
            <article>
                <p lang="en">Feel free to send me an email: jacques<span class="at"> snabela </span>de-laval.se !</p>
                <p lang="sv">Dra gärna iväg ett mejl till jacques<span class="at"> snabela </span>de-laval.se !</p>
            </article>
        </section>
        <section id="project">
            <article>
                <h2 lang="en">Projects</h2>
                <h2 lang="sv">Projekt</h2>
                <p lang="en">In 2011 I started the <a href="http://pirateplay.se/">Pirateplay project</a>. Pirateplay let's you stream and back up TV from all major swedish networks. Today the client software <a href="http://pirateplay.se/pirateplayer/">Pirateplayer</a> is available for Linux, OS X, Windows and Android and has been installed by more than 300 000 people. Pirateplay.se and Pirateplayer is developed using Python, C++ and Javascript and is released under the GPLv3 license.</p>
                <p lang="en">From time to time I publish other hobby efforts. You can <a href="http://github.com/jackuess">check them out on Github!</a></p>
                <p lang="sv">2011 startade jag <a href="http://pirateplay.se/">projektet Pirateplay</a>. Pirateplay möjliggör strömning och säkerthetskopiering av TV från alla stora svenska kanaler. Idag finns applikationen <a href="http://pirateplay.se/pirateplayer/">Pirateplayer</a> till Linux, OS X, Windows och Android och har installerats av över 300 000 personer. Pirateplay.se och Pirateplayer är skrivna i Python, C++ och Javascript och släpps under GPLv3 licensen.</p>
                <p lang="sv">Då och då publicerar jag andra hobbyprojekt. Du kan <a href="http://github.com/jackuess">kolla in dem på Github!</a></p>
            </article>
        </section>
        <section id="about">
            <article>
                <h2 lang="en">About me</h2>
                <h2 lang="sv">Om mig</h2>
                <p lang="en">I have a french heritage, but I'm 10th generation swedish. Born and bread in Västerås where I live and work as a back-end programmer at <a href="http://pingdom.com/">Pingdom</a>. In my spare time I ride my bicycles, write code and follow Västerås SK wherever they play.</p>
                <p lang="sv">Jag har franska rötter men är tionde generationens svensk. Född och uppvuxen i Västerås där jag bor och jobbar som backend-programmerare på <a href="http://pingdom.com/">Pingdom</a>. På fritiden cyklar jag på mina cyklar, skriver kod och följer Västerås SK varhelst de spelar.</p>
            </article>
        </section>
        <script type="text/javascript" language="javascript">
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
            }
            touch.init();

            window.addEventListener("verticalswipe", function (event) {
                scrollToSection(event.detail.directionY);
            });
        </script>
    </body>
</html>
