"use strict";

$(document).ready(function() {	
	let _username = $("#usr");
	let _password = $("#pwd");
	let _lblErrore = $("#lblError");
	
	// all'avvio apriamo subito il jumbotron
	$(".jumbotron").trigger("click");
    _lblErrore.hide();

	$("#btnLogin").on("click", controllaLogin);
	$("#btnPwRequest").on("click", function () { location.href="../pwRequest/pwRequest.html"; });
	
	// il submit deve partire anche senza click 
	// ma con il solo tasto INVIO
	$(document).on('keydown', function(event) {	
	   if (event.keyCode == 13)  
		   controllaLogin();
	});
	
	
	function controllaLogin(){
		removeError(_username);
		removeError(_password);

		_lblErrore.hide();		
		
        if (_username.val() == "") setError(_username);
		else if (_password.val() == "") setError(_password);
		else{
			let user=_username.val();
			let pwd=pwEncrypton(_password.val());
			let _richiestaLogin= inviaRichiesta("POST", "../../server/login.php", { "username":user, "password":pwd } );

			_richiestaLogin.fail(function(jqXHR, test_status, str_error) {
				if (jqXHR.status == 401) _lblErrore.show(); // unauthorized
				else error(jqXHR, test_status, str_error);
			});
			_richiestaLogin.done(function(data) { location.href = "../../index.html"; });
		}
	}
	
	_lblErrore.children("button").on("click", function(){ _lblErrore.hide(); });
	
});