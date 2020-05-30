"use strict";

$(document).ready(function() {	
	let oldPwd = $("#txtOldPassword");
	let newPwd = $("#txtPassword1");
	let confPwd = $("#txtPassword2");
	let _lblErrore = $("#lblError");
	
	// all'avvio apriamo subito il jumbotron
	$(".jumbotron").trigger("click");
    _lblErrore.hide();

	$("#btnInvia").on("click", controllaPw);
	
	// il submit deve partire anche senza click 
	// ma con il solo tasto INVIO
	$(document).on('keydown', function(event) {	
	   if (event.keyCode == 13)
		   controllaPw();
	});
	
	
	function controllaPw(){

		oldPwd.removeClass("is-invalid");  // bordo rosso textbox
		oldPwd.prev().removeClass("icona-rossa");  // colore icona
		newPwd.removeClass("is-invalid");
		newPwd.prev().removeClass("icona-rossa");
		confPwd.removeClass("is-invalid");
		confPwd.prev().removeClass("icona-rossa");

		_lblErrore.hide();		
		
        if (oldPwd.val() == "") {
			oldPwd.addClass("is-invalid"); // bordo rosso textbox
			oldPwd.prev().addClass("icona-rossa"); // colore icona
        } 
		else if (newPwd.val() == "" || newPwd.val().length < 8) {
			newPwd.addClass("is-invalid"); // bordo rosso textbox
			newPwd.prev().addClass("icona-rossa"); // colore icona
			_lblErrore.show();
			$("#text").text("<b>Attenzione!</b> La password deve avere una lunghezza minima di 8 caratteri");
		}
		else if(newPwd.val() == oldPwd.val()) {
			newPwd.addClass("is-invalid"); // bordo rosso textbox
			newPwd.prev().addClass("icona-rossa"); // colore icona
			_lblErrore.show();
			$("#text").text("<b>Attenzione!</b> Vecchia e nuova password devono essere diverse");
		}
		else if (confPwd.val() == "" || confPwd.val() != newPwd.val()) {
			confPwd.addClass("is-invalid"); // bordo rosso textbox
			confPwd.prev().addClass("icona-rossa"); // colore icona
			$("#text").text("<b>Attenzione!</b> La nuova password non corrisponde nel campo 'conferma password'");
		}
		else{
			let oldPwdCpt=CryptoJS.MD5(oldPwd.val()).toString();
			let newPwdCpt=CryptoJS.MD5(newPwd.val()).toString();
			let _richiestaCambioPwd= inviaRichiesta("POST", "server/changePw.php", { "vecchia":oldPwdCpt, "nuova":newPwdCpt } );

			_richiestaCambioPwd.fail(function(jqXHR, test_status, str_error) {
				if (jqXHR.status == 401) {
					_lblErrore.show(); // unauthorized
					$("#text").text("<b>Attenzione!</b> La vecchia password è errata");
				}
				else error(jqXHR, test_status, str_error);
			});
			_richiestaCambioPwd.done(function(data) {
				alert("Password modificata correttamente");
				location.href = "index.html";
			});
		}
	}
	
	_lblErrore.children("button").on("click", function(){ _lblErrore.hide(); });
	
});