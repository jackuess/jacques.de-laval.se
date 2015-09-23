include(`css/fonts.css')

a {
	text-decoration: none
}

body {
	font-family: 'Lato'; margin: 0; padding: 0
}
body, .at:after {
	font-size: 12pt
}

h2 {
	margin: 0
}

.at {
	font-size: 0
}
.at:after {
	content: '@'
}

header {
	background: #111;
	left: 0;
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 999
}

header a {
	color: inherit
}

header div.wrapper {
	position: relative;
	margin:0;
	height: 4em
}
header>div.wrapper a {
	-webkit-transition: color .5s
}
header>div.wrapper>* {
	margin: 0; padding-top: 8pt; position: absolute; top: 0
}

header>div.wrapper>nav {
	left: 0;
	padding-left: 1%;
	padding-top: 18pt;
}
header nav {
	color: #eee;
}
header nav a:hover {
	color: #FF3351
}
header nav ul {
	margin: 0;
	padding: 0
}
header nav li {
	display: inline;
	list-style: none;
	margin-right: 1.5%
}
header nav#language {
	position: relative;
	text-align: center;
}
header nav#menu {
	z-index: 1;
}
header nav#menu li {
	margin-right: 5.5%
}

html:lang(en) *[lang="sv"], html:lang(sv) *[lang="en"] {
	display: none;
}

h1 {
	color: #FF2343;
	left: 66%;
	margin: 0;
	padding-right: 1%;
	right: 0;
	text-align: right;
	text-shadow: 0 3px #000
}
h1 #sirname {
	color: #305CA3
}
h1:hover {
	color: #305CA3
}
h1:hover #sirname {
	color: #ccc; color: #FF2343;
}
h1 a, h1 a:hover, h1 a:visited, h1 a:link, h1 a:focus {
	color: inherit
}

article {
	color: rgba(255,255,255, 0.8);
	height: 50%;
	margin-left: auto;
	margin-right: auto;
	position: relative;
	top:25%;
	overflow: auto;
	width: 50%
}
article>* {
	padding: 1%
}

article a {
	color: inherit;
	font-weight: bold;
}

body>section  {
	height: 100%;
	position: absolute;
	width: 100%
}

#contact_info {
	background-color: #0C3531;
	top: 0
}
#contact_info article {
	display: table;
	text-align: center
}

#contact_info p {
	vertical-align: middle
}

html:lang(en) #contact_info article *[lang="en"], html:lang(sv) #contact_info article *[lang="sv"] {
	display: table-cell;
}

#project {
	background-color: #111;
	top: 100%;
}

#about {
	background-color: #282A44;
	top: 200%;
}
