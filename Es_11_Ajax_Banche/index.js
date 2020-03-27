"use strict";

$(function () {
    //region Variabili
    let _filiali=$("#wrapFiliali");
    let _correntisti= $("#wrapCorrentisti");
    let _lstBanche = $("#lstBanche");
    let _lstFiliali = $("#lstFiliali");
    //endregion

    //region Gestione banche
    _correntisti.css("display", "none");
    let request = inviaRichiesta("GET", "server/elencoBanche.php" );
    request.fail(error); // Al sottoprogramma error vengono iniettati automaticamente i parametri jqXHR, text_status, string_error
    request.done(function (data) {
        _filiali.css("display", "block");

        for (let banca of data) {
            $("<option>", {
                "value": banca["cBanca"],
                "text": banca["nome"]
            }).appendTo(_lstBanche);
        }
        _lstBanche.prop("selectedIndex", -1);
    });
    //endregion

    //region Gestione filiali
    _lstBanche.on("change", function () {
        _lstFiliali.html("");
        _correntisti.css("display", "none");
        let cBanca = this.value;

        request = inviaRichiesta("POST", "server/elencoFiliali.php",  "cBanca=" + cBanca);
        request.fail(error);
        request.done(function (data) {
            for (let record of data)
                $("<option>", {
                    "value": record["cFiliale"],
                    "text": record["nomeFiliale"] + " - " + record["nomeComune"]
                }).appendTo(_lstFiliali);
            _lstFiliali.prop("selectedIndex", -1);
        });
    });
    //endregion

    //region Gestione correntisti
    _lstFiliali.on("change", function () {
        request = inviaRichiesta("POST", "server/elencoCorrentisti.php", "cFiliale=" + this.value);
        request.fail(error);
        request.done(function (data) {
            _correntisti.css("display", "block");
            let _table = $("#tabCorrentisti tbody");
            _table.html("");
            for (let record of data) {
                let _tr = $("<tr>");
                for (let key in record)
                    $("<td>", {
                        "text": record[key]
                    }).appendTo(_tr);
                _tr.appendTo(_table);
            }
            $("#tabCorrentisti").DataTable();
        });
    });
    //endregion
});