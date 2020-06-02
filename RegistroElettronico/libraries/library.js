"use strict";

function inviaRichiesta(method, url, parameters="") {
    return $.ajax({
        type: method,
        url: url,
        data: parameters,
		contentType: "application/x-www-form-urlencoded;charset=utf-8",
        dataType: "json",        
        timeout: 5000
    });
}

function error(jqXHR, text_status, string_error) {
    if (jqXHR.status == 0)
        alert("Connection Refused or Server timeout");
	else if (jqXHR.status == 200)
        alert("Formato dei dati non corretto : " + jqXHR.responseText);
    else
        alert("Server Error: " + jqXHR.status + " - " + jqXHR.responseText);
}

// md5 restituisce una word esadecimale, quindi è obbligatorio .toString()
function pwEncryption(password) { return CryptoJS.MD5(password).toString(); }

function showLblError(lblError, textPointer, text) {
    lblError.show(); // unauthorized
    textPointer.html(text);
}

function setError(control) {
    control.addClass("is-invalid"); // bordo rosso textbox
    control.prev().addClass("icona-rossa"); // colore icona
}

function removeError(control) {
    control.removeClass("is-invalid");  // bordo rosso textbox
    control.prev().removeClass("icona-rossa");  // colore icona
}

function copyInClipboard(copyText) {
    let aus = $('<input>').val(copyText).appendTo('body').select();
    document.execCommand('copy');
    aus.remove();
}

function removeDumplicateValue(myArray){ return myArray.filter(function(elem, index, self) { return index === self.indexOf(elem); }); }