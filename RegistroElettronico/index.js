"use strict";

$(document).ready(function() {	
	let _wrapper = $("#wrapper");
	let _divTitolo = $("#divTitolo");
	//let _divFiliali = $("#divFiliali");
	let _divAlunni = $("#divMovimenti");
	let slctMaterie=$("#slctMateria");
	let slctClassi=$("#slctClasse");
	let strMaterie;

	_wrapper.hide();
	let rqMaterie=inviaRichiesta("GET", "server/start.php");
	rqMaterie.fail(function (jqXHR, test_status, str_error) {
		if(jqXHR.status==403) location.href="pages/login/login.html";
		else error(jqXHR, test_status, str_error);
	});
	rqMaterie.done(function (data) {
		console.log(data);
		_wrapper.show();
		_divAlunni.hide();

		$("#username").html("Gestisci utente: <strong>"+data.name+"</strong>");

		strMaterie=data.subjects.split("-");
		for(let i=0;i<strMaterie.length;i++){
			let str=strMaterie[i].replace("_", " ").toUpperCase();
			$("<option>", {
				text: str,
				value: str,
			}).appendTo(slctMaterie);
		}
		slctMaterie.prop("selectedIndex", "0");

		for(let i=0;i<data.classes.length;i++) {
			$("<option>", {
				text: data.classes[i]["classe"],
				value: data.classes[i]["classe"]
			}).appendTo(slctClassi);
		}

		slctClassi.prop("selectedIndex", "-1");

		/*let _button=$("<button>", {
			"class":"btn btn-primary",
			"text":"Visualizza Movimenti",
			"css":{"margin-left":"36px"}
		}).on("click", function () {
			let _checked=$("#divFiliali input[type=radio]:checked");
			if(_checked.length==0) alert("Seleziona la filiale desiderata");
			else{
				let cFiliale=_checked.val(); // [] restituiscono un js
				let rqMovimenti=inviaRichiesta("POST", "server/elencoMovimenti", {"cFiliale":cFiliale});
				rqMovimenti.fail(function (jqXHR, test_status, str_error){
					if(jqXHR.status==403) window.location="login.html";
					else error(jqXHR, test_status, str_error);
				});
				rqMovimenti.done(function (data) {
					console.log(data);
				});
			}
		}).appendTo(_divFiliali);*/
	});
});