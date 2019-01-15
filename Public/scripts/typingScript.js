document.addEventListener('DOMContentLoaded', loaded)

function loaded(){
    var topNav = document.getElementById('topnav');

	var topPadding = topNav.clientHeight;
    var content = document.getElementById('typeContent');
	content.style.paddingTop = topPadding + "px";
	var text = content.innerHTML
	content.innerHTML = '';
    typeAnimation(content, text,0,100);
}

function typeAnimation(elementToTypeOut, textToType, index, interval) {
	if (index < textToType.length) {
		var next = textToType[index++];
		if (next == '\n') {
			elementToTypeOut.innerHTML += '<br>';
		} else {
			elementToTypeOut.innerHTML += next;
		}
		setTimeout(function() {typeAnimation(elementToTypeOut,textToType, index, interval);}, interval);
	}
}
function sleep(milliseconds) {
	var start = new Date().getTime();
	for (var i = 0; i < 1e7; i++) {
	  if ((new Date().getTime() - start) > milliseconds){
		break;
	  }
	}
  }