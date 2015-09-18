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
	color: rgba(255,255,255, 0.5);
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
	color: rgba(255,255,255, 0.7)
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
	display: table-cell;
	vertical-align: middle
}
