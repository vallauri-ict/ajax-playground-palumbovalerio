"use strict";

$(document).ready(function() {	
	let username = $("#txtUser");
	let question = $("#txtQuestion");
	let answer = $("#txtAnswer");
	
	// all'avvio apriamo subito il jumbotron
	$(".jumbotron").trigger("click");

	let rqDati=inviaRichiesta("POST", "../../server/userManagement.php");
	rqDati.fail(function (jqXHR, test_status, str_error) {
		if(jqXHR.status==403) location.href="pages/login/login.html";
		else error(jqXHR, test_status, str_error);
	});
	rqDati.done(function (data) {
		username.val(data.name);
		question.val(data.question);
		answer.val(data.answer);

		$("#btnInvia").on("click", controllaParametri);

		// il submit deve partire anche senza click
		// ma con il solo tasto INVIO
		$(document).on('keydown', function(event) {
			if (event.keyCode == 13)
				controllaParametri();
		});


		function controllaParametri(){
			removeError(username);
			removeError(question);
			removeError(answer);

			let domanda="";
			let aus=question.val().split("");
			if(aus[aus.length-1]!="?") aus.push("?");
			for(let i=0;i<aus.length;i++) domanda+=aus[i];

			if (username.val() == "") setError(username);
			else if (question.val() == "") setError(question);
			else if (answer.val() == "") setError(answer);
			else{
				let _richiestaCambioDati= inviaRichiesta("POST", "../../server/changeDatas.php", { "username":username.val(), "domanda":domanda, "risposta":answer.val() } );

				_richiestaCambioDati.fail(function(jqXHR, test_status, str_error) { error(jqXHR, test_status, str_error); });
				_richiestaCambioDati.done(function(data) {
					alert("Dati modificati correttamente");
					location.href = "../../index.html";
				});
			}
		}
	});
});