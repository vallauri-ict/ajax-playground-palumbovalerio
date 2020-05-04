"use strict";

$(document).ready(function () {
    let slctSymbol=$("#slctSymbol");
	let chart=$("#myChart").hide();
	let myChart= new Chart(chart,{});
	let _btnDownload=$("#download").hide();
	let _btnUpload=$("#upload").hide();
	
	// 1. Load the JavaScript client library.
	gapi.load('client', start);

    slctSymbol.on("change",function() {
        DeleteRows();
        CreateRows(0);
        getGlobalQuotes(this.value, 0);
    });
	slctSymbol.prop("selectedIndex","-1");

    $("#search").on("keyup",function(){
        let str=$("#search").val();
        if(str.length>=2)
        {
            DeleteRows();
            getSymbolSearch(str);
        }
    });
	
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
	
	
	$("#slctSector").on("change", function(){
        let sector=this.value;
        //Creazione chart
        $.getJSON("http://localhost:3000/chart", function(data){
			myChart.destroy();
			myChart = new Chart(chart,data);
			let labels=data["data"]["labels"]=[];
			let values=data["data"]["datasets"][0]["data"]=[];
			let backgroundColor=data["data"]["datasets"][0]["backgroundColor"]=[];
			let borderColor=data["data"]["datasets"][0]["borderColor"]=[];
			
			$.getJSON("http://localhost:3000/sector",function(metaData){
			for(let key in metaData[sector])
			{
				let color=RandomColorGenerator(true, 1);
				labels.push(key);
				values.push(metaData[sector][key].replace("%", ""));
				borderColor.push(color);
				color=color.replace("1)", "0.2)");
				backgroundColor.push(color);
			}
				
			myChart.update();
			chart.show();
			_btnDownload.show();
			_btnUpload.show();
			});
        });
    });
	
	_btnDownload.on('click', function(){_btnDownload.prop("href", document.getElementById("myChart").toDataURL("image/jpg"));});
	_btnUpload.on('click', function(){
		var fileContent = 'sample text'; // As a sample, upload a text file.
		var file = new Blob([fileContent], {type: 'text/plain'});
		var metadata = {
			'name': 'sampleName', // Filename at Google Drive
			'mimeType': 'text/plain', // mimeType at Google Drive
			'parents': ['### folder ID ###'], // Folder ID at Google Drive
		};

		var accessToken = gapi.auth.getToken().access_token; // Here gapi is used for retrieving the access token.
		var form = new FormData();
		form.append('metadata', new Blob([JSON.stringify(metadata)], { type: 'application/json' }));
		form.append('file', file);

		fetch('https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart&fields=id', {
			method: 'POST',
			headers: new Headers({ 'Authorization': 'Bearer ' + accessToken }),
			body: form,
		}).then((res) => {
			return res.json();
		}).then(function(val) {
			console.log(val);
		});
	});
});

/*Functions*/

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

function Random(min, max) { return Math.floor((max - min + 1) * Math.random()) + min; }

function RandomColorGenerator(isTransparent, transFirstValue=Random(0,1), transMin=1, transMax=9){
	if(isTransparent)
	{
		let transparentValue;
		if(transFirstValue==0)
		{
			let str=transFirstValue + "."+ Random(transMin, transMax);
			transparentValue=parseFloat(str);
		}
		else
			transparentValue=transFirstValue;
		return "rgba(" + Random(0, 255) + ", " + Random(0, 255) + ", " + Random(0, 255) + ", " + transparentValue +")";
	}
	else
		return "rgb(" + Random(0, 255) + ", " + Random(0, 255) + ", " + Random(0, 255) + ")";
}

function start() {
	 // 2. Initialize the JavaScript client library.
	 gapi.client.init({
		'apiKey': 'AIzaSyD2cbBT8V6UF_80e3GrlL7Z-cpmC2MDb9Q',
		// clientId and scope are optional if auth is not required.
		'clientId': '441916155699-9mrh5ftu4muhlendrf1nmbu43vbqk1c4.apps.googleusercontent.com',
		'scope': 'https://www.googleapis.com/auth/drive',
		}).then(function() {
		// 3. Initialize and make the API request.
		return gapi.client.request({
		  'path': 'https://people.googleapis.com/v1/people/me?requestMask.includeField=person.names',
		})
		}).then(function(response) {
		console.log(response.result);
		}, function(reason) {
		console.log('Error: ' + reason.result.error.message);
	});
};