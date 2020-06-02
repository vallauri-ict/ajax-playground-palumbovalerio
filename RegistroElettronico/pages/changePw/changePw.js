"use strict";

$(document).ready(function() {	
	let oldPwd = $("#txtOldPassword");
	let newPwd = $("#txtPassword1");
	let confPwd = $("#txtPassword2");
	let _lblErrore = $("#lblError");
	let _errorText=$("#ErrorText");

	let _controlloSessione=inviaRichiesta("POST", "../../server/sessionControl.php");

	_controlloSessione.fail(function (jqXHR, test_status, str_error) {
		if(jqXHR.status==403) location.href="pages/login/login.html";
		else error(jqXHR, test_status, str_error);
	});
	_controlloSessione.done(function (data) {
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
			removeError(oldPwd);
			removeError(newPwd);
			removeError(confPwd);

			_lblErrore.hide();

			if (oldPwd.val() == "") setError(oldPwd);
			else if (newPwd.val() == "" || newPwd.val().length < 8) {
				setError(newPwd);
				showLblError(_lblErrore,_errorText, "<strong>Attenzione!</strong> La password deve avere una lunghezza minima di 8 caratteri");
			}
			else if(newPwd.val() == oldPwd.val()) {
				setError(newPwd);
				showLblError(_lblErrore,_errorText, "<strong>Attenzione!</strong> Vecchia e nuova password devono essere diverse");
			}
			else if (confPwd.val() == "" || confPwd.val() != newPwd.val()) {
				setError(confPwd);
				showLblError(_lblErrore,_errorText, "<strong>Attenzione!</strong> La nuova password non corrisponde nel campo 'conferma password'");
			}
			else{

				let oldPwdCpt=pwEncryption(oldPwd.val());
				let newPwdCpt=pwEncryption(newPwd.val());
				let _richiestaCambioPwd= inviaRichiesta("POST", "../../server/changePw.php", { "vecchia":oldPwdCpt, "nuova":newPwdCpt } );

				_richiestaCambioPwd.fail(function(jqXHR, test_status, str_error) {
					if (jqXHR.status == 401) showLblError(_lblErrore,_errorText, "<strong>Attenzione!</strong> La vecchia password è errata");
					else error(jqXHR, test_status, str_error);
				});
				_richiestaCambioPwd.done(function(data) {
					alert("Password modificata correttamente");
					location.href = "../../index.html";
				});
			}
		}

		_lblErrore.children("button").on("click", function(){ _lblErrore.hide(); });
	});
});