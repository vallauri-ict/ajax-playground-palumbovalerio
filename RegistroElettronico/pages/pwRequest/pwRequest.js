"use strict";

$(document).ready(function() {	
	let username = $("#txtUsername");
	let _divDomanda = $("#divDomanda");
	let _txtRisposta=$("#txtRisposta");
	let _lblErrore = $("#lblError");
	let _errorText=$("#ErrorText");

	let rispostaCorretta;

	// all'avvio apriamo subito il jumbotron
	$(".jumbotron").trigger("click");
    _lblErrore.hide();
    _divDomanda.hide();

	// il submit deve partire anche senza click
	// ma con il solo tasto INVIO
	username.on("blur", function () {
		removeError(username);

		let _richiestaDomanda= inviaRichiesta("POST", "../../server/QnARequest.php", { "username":username.val() } );

		_richiestaDomanda.fail(function(jqXHR, test_status, str_error) {
			if (jqXHR.status == 401) {
				_divDomanda.hide();
				setError(username);
				showLblError(_lblErrore, _errorText, "<strong>Attenzione!</strong> Username non trovato");
			}
			else error(jqXHR, test_status, str_error);
		});
		_richiestaDomanda.done(function(data) {
			_lblErrore.hide();
			_divDomanda.show();
			$("#domanda").text(data.domanda);
			rispostaCorretta=data.risposta;
			$("#btnInvia").on("click", changePw);
			$(document).on('keydown', function(event) {
				if (event.keyCode == 13)
					changePw();
			});
		});
	});


	function changePw(){
		removeError(_txtRisposta);

		_lblErrore.hide();

        if (_txtRisposta.val() == "") setError(_txtRisposta);
        else if(_txtRisposta.val()!=rispostaCorretta) {
			setError(_txtRisposta);
			showLblError(_lblErrore, _errorText, "<strong>Attenzione!</strong> Risposta errata");
		}
		else {
			let tempPw=pwEncryption("prof"+username.val());
			let _richiestaPw=inviaRichiesta("POST", "../../server/pwRequest.php", {"tempPw":tempPw});

			_richiestaPw.fail(error);
			_richiestaPw.done(function (data) {
				alert("La tua password è prof"+ username.val() +". Verrà automaticamente copiata e verrai reindirizzato alla pagina di login. Reipostala appena possibile!");
				copyInClipboard(data["ris"]);
				location.href = "../login/login.html";
			});
		}
	}

	_lblErrore.children("button").on("click", function(){ _lblErrore.hide(); });

});