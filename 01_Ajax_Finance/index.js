"use strict";

$(document).ready(function () {
    let slctSymbol=$("#slctSymbol");
    slctSymbol.prop("selectedIndex","-1");

    slctSymbol.on("change",function() {
        getGlobalQuotes(this.value);
    });
});

function getGlobalQuotes(symbol) {
    let url = "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=" + symbol + "&apikey=9W3WBFZDS1SDT2TV";
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