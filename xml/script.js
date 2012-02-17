function adjustStyle(width) {
    width = parseInt(width);
    if (width < 1024) {
	document.getElementById("size-stylesheet").setAttribute("href", "css/handheld.css");
    }
}

document.onload=adjustStyle(screen.width);
document.getElementById("title").innerHTML=screen.width;
