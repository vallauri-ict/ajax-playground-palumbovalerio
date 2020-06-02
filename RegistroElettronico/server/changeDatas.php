<?php

header("Content-type:application/json;charset=utf-8");
require("../libraries/library.php");

if($_SERVER["REQUEST_METHOD"]=="POST"){
    // 1. Controllo parametri
    parameterControl("username", 400);
    parameterControl("domanda", 400);
    parameterControl("risposta", 400);

    checkSession("codProf");
    // 2. Connessione
    $con=connection("4b_scuola");
    $user=$con->real_escape_string($_POST["username"]);
    $question=$con->real_escape_string($_POST["domanda"]);
    $answer=$con->real_escape_string($_POST["risposta"]);
    $id=$_SESSION["codProf"];

    // 3. Query
    runQuery($con, "UPDATE professori SET nominativo='$user' WHERE codProf=$id");
    runQuery($con, "UPDATE domande SET domanda='$question', risposta='$answer' WHERE codProf=$id");

    echo json_encode(array("id"=>$id));

    // 4. Close
    $con->close();
}

?>