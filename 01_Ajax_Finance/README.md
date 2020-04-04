# 01_Ajax_Finance

API Request to fill a table with datas of a company selected by a combo box

--------------------------------
*Project version: __1.0.0__*

*Project specifics:*
1. Allows you to choose a company from the the combo box;
2. Show a table with datas of the chosen company;

--------------------------------

### index.js
```javascript
function getGlobalQuotes(symbol) {
    let url = "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=" + symbol + "&apikey=-Insert here your key-";
    $.getJSON(url, function (data) {
            let globalQuoteData = data["Global Quote"];
            $("#symbol").text(globalQuoteData["01. symbol"]);
            $("#previousClose").text(globalQuoteData["08. previous close"]);
            $("#open").text(globalQuoteData["02. open"]);
            $("#lastTrade").text(globalQuoteData["05. price"]);
            $("#lastTradeTime").text(globalQuoteData["07. latest trading day"]);
            $("#change").text(globalQuoteData["09. change"]);
            $("#daysLow").text(globalQuoteData["04. low"]);
            $("#daysHigh").text(globalQuoteData["03. high"]);
            $("#volume").text(globalQuoteData["06. volume"]);
        }
    );
}
```

*data* parameter is automatically injected

>I use the API GLOBAL_QUOTE by [Alphavantage](https://www.alphavantage.co/documentation/#latestprice)

--------------------------------

my Social Media | Links
------------- | ------------------------------------------------------------------
my Instagram: | [palumbo__valerio](https://www.instagram.com/palumbo__valerio/)
my Youtube Channel: | [RedX64](https://www.youtube.com/channel/UCWOLxDm6jrNPUvrkjsRmscg?view_as=subscriber)
my Website: | [valepaluseba.altervista.org](https://valepaluseba.altervista.org/)

you can contact me: v.palumbo.1004@vallauri.edu

>*By Palumbo Valerio Sebastiano*