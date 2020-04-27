"use strict";

$(document).ready(function () {
    let slctSymbol=$("#slctSymbol");
    slctSymbol.prop("selectedIndex","-1");
	
	$.getJSON("http://localhost:3000/sector", function(data)
    {
        for(let key in data)
        {
            if(key != "Meta Data")
            {
                $("<option>", {
                    text: key,
                    value: key,
                }).appendTo($("#slctSector"));
            }
        }
        $("#slctSector").prop("selectedIndex",-1);
    });

    slctSymbol.on("change",function() {
        DeleteRows();
        CreateRows(0);
        getGlobalQuotes(this.value, 0);
    });

    $("#search").on("keyup",function(){
        let str=$("#search").val();
        if(str.length>=2)
        {
            DeleteRows();
            getSymbolSearch(str);
        }
        //console.log(str.length);
    });
	
	//Creazione chart
    let ctx = document.getElementById('myChart').getContext('2d');
    $.getJSON("http://localhost:3000/chart", function(data){
		
        let myChart = new Chart(ctx,data);
    });
	
	$("#slctSector").on("change", function(){
        let sector=this.value;
        //Creazione chart
        let ctx = document.getElementById('myChart').getContext('2d');
        $.getJSON("http://localhost:3000/chart", function(data){
			let labels=[];
			let values=[];
			let i=0;
			$.getJSON("http://localhost:3000/sector",function(metaData){
			for(let key in metaData[sector])
			{
				labels[i]=key;
				values[i++]=metaData[sector][key];
			}
			
			/*i=0;
			for(let val of metaData[sector])
			*/	
			});
			data["data"]["labels"]=labels;
			data["data"]["datasets"][0]["data"][0]=values;
            let myChart = new Chart(ctx,data);
        });
    });
});

function getGlobalQuotes(symbol, n) {
    let url = "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=" + symbol + "&apikey=9W3WBFZDS1SDT2TV";
    $.getJSON(url, function (data) {
            let globalQuoteData = data["Global Quote"];
            $("#symbol"+n).text(globalQuoteData["01. symbol"]);
            $("#previousClose"+n).text(globalQuoteData["08. previous close"]);
            $("#open"+n).text(globalQuoteData["02. open"]);
            $("#lastTrade"+n).text(globalQuoteData["05. price"]);
            $("#lastTradeTime"+n).text(globalQuoteData["07. latest trading day"]);
            $("#change"+n).text(globalQuoteData["09. change"]);
            $("#daysLow"+n).text(globalQuoteData["04. low"]);
            $("#daysHigh"+n).text(globalQuoteData["03. high"]);
            $("#volume"+n).text(globalQuoteData["06. volume"]);
        }
    );
}

function getSymbolSearch(keywords) {
    let url = "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=" + keywords + "&apikey=9W3WBFZDS1SDT2TV";
    $.getJSON(url, function (data) {
        let dataMatches=data["bestMatches"];
        for(let i=0;dataMatches.length; i++)
        {
            CreateRows(i);
            getGlobalQuotes(dataMatches[i]["1. symbol"], i);
        }
    });
}

function CreateRows(n) {
    let tr=$("<tr>").addClass("deletableRows");

    $("<td>").prop("id", "symbol"+n).appendTo(tr);
    $("<td>").prop("id", "lastTrade"+n).appendTo(tr);
    $("<td>").prop("id", "lastTradeTime"+n).appendTo(tr);
    $("<td>").prop("id", "change"+n).appendTo(tr);
    $("<td>").prop("id", "open"+n).appendTo(tr);
    $("<td>").prop("id", "previousClose"+n).appendTo(tr);
    $("<td>").prop("id", "daysLow"+n).appendTo(tr);
    $("<td>").prop("id", "daysHigh"+n).appendTo(tr);
    $("<td>").prop("id", "volume"+n).appendTo(tr);
    tr.appendTo($("#table"));
}

function DeleteRows() { $(".deletableRows").remove(); }