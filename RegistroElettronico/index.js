"use strict";

$(document).ready(function() {	
	let _wrapper = $("#wrapper");
	let _divAlunni = $("#divMovimenti");
	let slctMaterie=$("#slctMateria");
	let slctClassi=$("#slctClasse");
	let table=$("#tBody");
	let username=$("#username");
	let strMaterie;

	_wrapper.hide();
	let _richiestaMaterie=inviaRichiesta("POST", "server/index.php", {"index":0});
	_richiestaMaterie.fail(function (jqXHR, test_status, str_error) {
		if(jqXHR.status==403) location.href="pages/login/login.html";
		else error(jqXHR, test_status, str_error);
	});
	_richiestaMaterie.done(function (data) {
		console.log(data);
		_wrapper.show();
		_divAlunni.hide();

		username.html("Gestisci utente: <strong>"+data.name+"</strong>");

		strMaterie=data.subjects.split("-");
		for(let i=0;i<strMaterie.length;i++){
			let str=strMaterie[i].replace(/\_/g, " ").toUpperCase();
			$("<option>", {
				text: str,
				value: strMaterie[i],
			}).appendTo(slctMaterie);
		}
		slctMaterie.prop("selectedIndex", "0");

		appendClasses(data.classes, slctClassi, "-1");

		slctMaterie.on("change", function () {
			let _richiestaClassi=inviaRichiesta("POST", "server/index.php", {"index":parseInt(slctMaterie.prop("selectedIndex"))});

			_richiestaClassi.fail(function (jqXHR, test_status, str_error) {
				if(jqXHR.status==403) location.href="pages/login/login.html";
				else error(jqXHR, test_status, str_error);
			});
			_richiestaClassi.done(function (data) {
				let selectedIndex=slctClassi.prop("selectedIndex");
				$(".deletableClass").remove();
				appendClasses(data.classes, slctClassi, selectedIndex);
				slctClassi.trigger("change");
			});
		});
		slctMaterie.on("change", fillTable);
		slctClassi.on("change", fillTable);

		function fillTable() {
			if(slctClassi.prop("selectedIndex")!="-1") {
				_divAlunni.show();
				let tabella=slctMaterie.val();
				let classe=slctClassi.val();
				let _richiestaAlunni=inviaRichiesta("POST", "server/studentsRequest.php", {"tabella":tabella, "classe":classe});

				_richiestaAlunni.fail(error);
				_richiestaAlunni.done(function (data) {
					console.log(data);
					$(".deletable").remove();
					for(let i=0;i<data.length;i++){
						let tr=$("<tr>").addClass("deletable");
						$("<td>").prop({
							"scope": "row",
							"align": "center"
						}).css("font-size", "15pt").text(i+1).appendTo(tr);
						$("<td>").prop("align","center").text(data[i]["nominativo"]).css({
							"width":"300px",
							"font-size":"15pt"
						}).appendTo(tr);

						let td=$("<td>").css("width","300px");
						$("<input>").prop({
							"type":"number",
							"max":10,
							"min":0,
							"codAlunno":data[i]["codAlunno"]
						}).val(data[i]["media"]).addClass("form-control").css("width","300px").on("change", function () {
							let thisButton=$("#"+$(this).prop("codAlunno"));
							if($(this).val()!=thisButton.prop("media")) {
								thisButton.prop({
									"disabled": false,
									"modValue": $(this).val()
								});
							}
							else thisButton.prop("disabled", true);
						}).appendTo(td);
						td.appendTo(tr);

						let td1=$("<td>").css("width","300px");
						$("<input>").prop({
							"type":"button",
							"media":data[i]["media"],
							"disabled": true,
							"id": data[i]["codAlunno"]
						}).val("Modifica").addClass("btn btn-primary").css("width","300px").on("click", function () {
							let _this=$(this);
							_this.prop("media", _this.prop("modValue"));
							let _richiestaModifica=inviaRichiesta("POST", "server/modifyRequest.php", {"tabella":tabella, "codAlunno":_this.prop("id"), "media":_this.prop("modValue")});

							_richiestaModifica.fail(error);
							_richiestaModifica.done(function (data) {
								alert("Media modificata correttamente");
								_this.prop("disabled", true);
							});
						}).appendTo(td1);
						td1.appendTo(tr);

						tr.appendTo(table);
					}
				});
			}
		}

		$("#btnLogout").on("click", function () {
			let _richiestaLogout=inviaRichiesta("POST", "server/logout.php");

			_richiestaLogout.fail(error);
			_richiestaLogout.done(function (data) { location.href="pages/login/login.html"; });
		});

		function appendClasses(vet, campo, selectedIndex) {
			let aus=[];
			for(let i=0;i<vet.length;i++)
				aus[i]=vet[i]["classe"];

			let classes = removeDumplicateValue(aus);
			for(let i=0;i<classes.length;i++) {
				$("<option>", {
					text: classes[i],
					value: classes[i]
				}).addClass("deletableClass").appendTo(campo);
			}

			campo.prop("selectedIndex", selectedIndex);
		}
	});
});