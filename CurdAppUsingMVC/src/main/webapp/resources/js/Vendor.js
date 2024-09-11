/**
 * 
 */
function searchVendor(str) {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("grid").innerHTML = this.responseText;
		}
	}
	xhttp.open("GET", "searchvendor?n="+str, true);
	xhttp.send();
}
