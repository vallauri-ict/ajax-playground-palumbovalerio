<?php

header("Content-type:application/json;charset=utf-8");
require("library.php");

if($_SERVER["REQUEST_METHOD"]=="POST"){
    // 1. Controllo parametri
    $user=parameterControl("username", 400);

    // 2. Connessione
    $con=connection("4b_scuola");

    // 3. Query
    $codProf=selectDatas($con, "SELECT codProf FROM professori WHERE nominativo='$user'", "codProf");

    session_start();
    $_SESSION["codProf"]=$codProf;
    $_SESSION["scadenza"]=time() + SCADENZA;
    setcookie(session_name(), session_id(), time()+SCADENZA, "/"); // / --> vale per tutte le risorse
    echo json_encode(array("ris"=>"ok"));

    // 5. Close
    $con->close();
}

?>