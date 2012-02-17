function adjustStyle(width) {
    width = parseInt(width);
    if (width < 1024) {
	document.getElementById("style").setAttribute("href", "css/handheld.css");
    }
}

document.onload=adjustStyle(screen.width);

