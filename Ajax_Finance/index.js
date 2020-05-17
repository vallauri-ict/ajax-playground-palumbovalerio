"use strict";

$(document).ready(function () {
	// Google drive initializations
	const urlParams = new URLSearchParams(window.location.search);
    const code = urlParams.get('code');
	const client_id = "625340076437-h3c3ujfof3rm70gstpph9r6ur2be6d69.apps.googleusercontent.com"// replace it with your client id;
    const redirect_uri = "http://127.0.0.1:8080/index.html" // replace with your redirect_uri;
    const client_secret = "XS9W8XAsV7RKGckimcRabKft"; // replace with your client secret
    const scope = "https://www.googleapis.com/auth/drive";
    let access_token= "";
	
	// Take element
    let slctSymbol=$("#slctSymbol");
	let slctSector=$("#slctSector");
	let chart=$("#myChart").hide();
	let myChart= new Chart(chart,{});
	let _btnDownload=$("#download").hide();
	let _btnUpload=$("#upload").hide();
	let _btnSignIn=$("#signIn");
	let _signInIco=$("#signInIco");
	
	if(localStorage.getItem("accessToken")==null) 
	{
		_signInIco.addClass("fas fa-sign-in-alt");		
		_btnSignIn.prop("title", "Sign In");
	}
	else 
	{
		_signInIco.addClass("fab fa-google");
		_btnSignIn.prop("title", "You are already signed in");
	}
		
	
	// Google drive authorization
	$.ajax({
        type: 'POST',
        url: "https://www.googleapis.com/oauth2/v4/token",
        data: {code:code
            ,redirect_uri:redirect_uri,
            client_secret:client_secret,
        client_id:client_id,
        scope:scope,
        grant_type:"authorization_code"},
        dataType: "json",
        success: function(resultData) 
        {
           localStorage.setItem("accessToken",resultData.access_token);
           localStorage.setItem("refreshToken",resultData.refreshToken);
           localStorage.setItem("expires_in",resultData.expires_in);
        }
	});
	
	$.getJSON("http://localhost:3000/companies", function(data)
    {
		for(let i=0;i<data.length;i++){
			$("<option>", {
				text: data[i]["desc"],
				value: data[i]["id"],
            }).appendTo(slctSymbol);
		}
		slctSymbol.prop("selectedIndex",-1);
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
                }).appendTo(slctSector);
            }
        }
		slctSector.prop("selectedIndex",-1);
    });
	
	
	slctSector.on("change", function(){
        let sector=this.value;
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
				let color=RandomColorGenerator(false);
				labels.push(key);
				values.push(metaData[sector][key].replace("%", ""));
				backgroundColor.push(color);
				borderColor.push(color);
			}
				
			myChart.update();
			chart.show();
			_btnDownload.show();
			_btnUpload.show();
			});
        });
    });
	
	_btnDownload.on('click', function(){ _btnDownload.prop("href", document.getElementById("myChart").toDataURL("image/jpg")); });
	
	_btnUpload.on('click', function(){
		if(localStorage.getItem("accessToken")!=null)
		{					
			let file = dataURItoBlob(document.getElementById("myChart").toDataURL("image/jpg"));
			console.log(file);
			
			let upload = new Upload(file);
		
			// maby check size or type here with upload.getSize() and upload.getType()
			
			// execute upload
			upload.doUpload();
		}
		else
			alert("You must sign in first!");
	});
	
	_btnSignIn.on('click', function(){
		if(localStorage.getItem("accessToken")==null)
			signIn(client_id,redirect_uri,scope);
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

	function signIn(client_id,redirect_uri,scope){
		 
	   // the actual url to which the user is redirected to 

	   let url = "https://accounts.google.com/o/oauth2/v2/auth?redirect_uri="+redirect_uri
	   +"&prompt=consent&response_type=code&client_id="+client_id+"&scope="+scope
	   +"&access_type=offline";

	   // this line makes the user redirected to the url
	   window.location = url;
	}

	function stripQueryStringAndHashFromPath(url) 
	{
		return url.split("?")[0].split("#")[0];
	}   

	let Upload = function (file) 
	{
		this.file = file;
	};

	Upload.prototype.getType = function() 
	{
		localStorage.setItem("type",this.file.type);
		return this.file.type;
	};
	Upload.prototype.getSize = function() 
	{
		localStorage.setItem("size",this.file.size);
		return this.file.size;
	};
	Upload.prototype.getName = function() 
	{
		return this.file.name;
	};
	Upload.prototype.doUpload = function () 
	{
		let that = this;
		let formData = new FormData();

		// add assoc key values, this will be posts values
		formData.append("file", this.file, this.getName());
		formData.append("upload_file", true);

		$.ajax({
			type: "POST",
			beforeSend: function(request) {
				request.setRequestHeader("Authorization", "Bearer" + " " + localStorage.getItem("accessToken"));
				
			},
			url: "https://www.googleapis.com/upload/drive/v2/files",
			data:{
				uploadType:"media"
			},
			xhr: function () {
				let myXhr = $.ajaxSettings.xhr();
				/*if (myXhr.upload) {
					myXhr.upload.addEventListener('progress', that.progressHandling, false);
				}*/
				return myXhr;
			},
			success: function (data) {
				console.log(data);
			},
			error: function (error) {
				console.log(error);
			},
			async: true,
			data: formData,
			cache: false,
			contentType: false,
			processData: false,
			timeout: 60000
		});
	};
	function dataURItoBlob(dataURI) {
	  // convert base64 to raw binary data held in a string
	  // doesn't handle URLEncoded DataURIs - see SO answer #6850276 for code that does this
	  let byteString = atob(dataURI.split(',')[1]);

	  // separate out the mime component
	  let mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0]

	  // write the bytes of the string to an ArrayBuffer
	  let ab = new ArrayBuffer(byteString.length);

	  // create a view into the buffer
	  let ia = new Uint8Array(ab);

	  // set the bytes of the buffer to the correct values
	  for (let i = 0; i < byteString.length; i++) {
		  ia[i] = byteString.charCodeAt(i);
	  }

	  // write the ArrayBuffer to a blob, and you're done
	  let blob = new Blob([ab], {type: mimeString});
	  blob.name="ChartImage.jpg";
	  //DriveApp.createFile(blob);
	  return blob;
	}
});