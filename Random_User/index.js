"use strict";

$(document).ready(function() {
  // region Dichiarazioni e inizializzazioni
  let _btnGenerate=$("#btnGenerate").button();
  let _slider=$("#slider");
  let _sliderChar=$("#sliderChar");
  let opzioni=$("#opzioni li");
  let nRisultati=$("#valore_slider");
  let nChar=$("#valore_sliderChar");
  let results;
  let pos=0;
  // endregion

  // region Eventi
  _btnGenerate.on("click", function() {
    inviaRichiesta("", aggiornaPagina);
    $("#destra").css("visibility","visible");
    $("#sinistra").css("visibility","visible");
    opzioni.on("mouseover", function () {
      let sender=$(this);
      let valore=$("#valore");

      opzioni.removeClass("active");
      sender.addClass("active");

      $("#titolo").text(sender.attr("data-title"));
      switch (sender.attr("data-label")) {
        case "name":
          valore.text(results[pos].name.title + " " + results[pos].name.first + " " + results[pos].name.last);
          break;
        case "location":
          valore.text(results[pos].location.street.number + " " + results[pos].location.street.name);
          break;
        case "birthday":
          valore.text(results[pos].dob.date.split("T")[0]);
          break;
        case "pass":
          valore.text(results[pos].login.password);
          break;
        default:
          valore.text(results[pos][sender.attr("data-label")]);
          break;
      }

    });
  });

  $("#destra").on("click", function () {
    if(pos<results.length-1)
      initializeUser(++pos);
  });

  $("#sinistra").on("click", function () {
    if(pos>0)
      initializeUser(--pos);
  });

  _slider.on("input", function () { nRisultati.text(_slider.val()); });
  _sliderChar.on("input", function () { nChar.text(_sliderChar.val()); });

  $("#Pass").children("input[type=checkbox]").on("input",function () {
    if($("#Pass").children("input[type=checkbox]:checked").length==0) {
      $("#interval").attr("disabled", true);
      _sliderChar.attr("disabled", true);
    }
    else {
      $("#interval").attr("disabled", false);
      _sliderChar.attr("disabled", false);
    }

  });
  // endregion

  // region Funzioni
  function inviaRichiesta(parametri, callback) {
    let url="https://randomuser.me/api/?results="+nRisultati.text();
    let gender=$("input[type=radio]:checked");
    if(gender.val()!="")
      url+=gender.val();

    let nations=$("#Nat").children("input[type=checkbox]:checked");
    if(nations.length!=0) {
      url+="&nat=";
      for(let i=0;i<nations.length-1;i++)
        url+=nations.eq(i).val()+",";
      url+=nations.eq(nations.length-1).val();
    }

    let password=$("#Pass").children("input[type=checkbox]:checked");
    if(password.length!=0) {
      url+="&password=";
      for(let i=0;i<password.length-1;i++)
        url+=password.eq(i).val()+",";
      url+=password.eq(password.length-1).val();

      if($("#interval").is(":checked") && nChar.text()!=8)
        url+=",8-"+nChar.text();
      else
        url+=","+nChar.text();
    }

    $.ajax({
      url: url,
      type: "GET",
      data: parametri,
      contentType: "application/x-www-form-unreloaded; charset=UTF-8",
      dataType: "json",
      async: true,
      timeout: 5000,
      success: callback,
      error: function(jqXHR, test_status, str_error) { alert("Server error: " + jqHXR.status + " - " + jqHXR.responseText); }
    });
  }

  function aggiornaPagina(data) {
    console.log(data);
    results=data.results;
    initializeUser(0);
  }

  function initializeUser(index) {
    $("#valore").text(results[index].name.title + " " + results[index].name.first + " " + results[index].name.last);
    $("#picture").prop("src", results[index].picture.large);
    $("#titolo").text("Hi, My name is");
    opzioni.removeClass("active");
    opzioni.eq(0).addClass("active");
  }
  // endregion
});