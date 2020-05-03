# Ajax_Finance

API Request to obtain datas of different company

--------------------------------
*Project version: __2.0.0__*

*Project specifics:*
1. Allows you to choose a company from the the combo box;
2. Allows you to search a company id;
3. Show a table with datas of the chosen company
4. Allows you to choose a sector of companies performances
5. Show a chart with performances datas;

--------------------------------

### index.js
```javascript
//Most Important Function
function getGlobalQuotes(symbol, n) {
    let url = "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=" + symbol + "&apikey=-Insert here your key-";
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
    let url = "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=" + keywords + "&apikey=-Insert here your key-";
    $.getJSON(url, function (data) {
        let dataMatches=data["bestMatches"];
        for(let i=0;dataMatches.length; i++)
        {
            CreateRows(i);
            getGlobalQuotes(dataMatches[i]["1. symbol"], i);
        }
    });
}

//Other Function
function CreateRows(n) {}
function DeleteRows() {}
function Random(min, max) {}
function RandomColorGenerator(isTransparent, transFirstValue=Random(0,1), transMin=1, transMax=9){}
```

*data* parameter is automatically injected
**If you use a free key, you have only five call per minute.**
**For this reason the table cannot fill with all results and the code goes in error.**

>I use the API GLOBAL_QUOTE and API SYMBOL_SEARCH by [Alphavantage](https://www.alphavantage.co/documentation/#latestprice)

--------------------------------

my Social Media | Links
------------- | ------------------------------------------------------------------
my Instagram: | [palumbo__valerio](https://www.instagram.com/palumbo__valerio/)
my Youtube Channel: | [RedX64](https://www.youtube.com/channel/UCWOLxDm6jrNPUvrkjsRmscg?view_as=subscriber)
my Website: | [valepaluseba.altervista.org](https://valepaluseba.altervista.org/)

you can contact me: v.palumbo.1004@vallauri.edu

>*By Palumbo Valerio Sebastiano*