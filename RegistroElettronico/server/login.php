<?php

header("Content-type:application/json;charset=utf-8");
require("library.php");

if($_SERVER["REQUEST_METHOD"]=="POST"){
    // 1. Controllo parametri
    parameterControl("username", 400);
    parameterControl("password", 400);

    // 2. Connessione
    $con=connection("4b_scuola");
    $user=$con->real_escape_string($_POST["username"]);
    $pw=$con->real_escape_string($_POST["password"]);

    // 3. Query
    $data=selectDatas($con, "SELECT * FROM professori WHERE nominativo='$user'", "", false);

    if(count($data)==0) error(401, "Username non valido");
    else if($data[0]["pwd"]!=$pw) error(401, "Password non valida");
    // 4. Creazione session e restituzione risultato
    else{
        session_start();
        $_SESSION["codProf"]=$data[0]["codProf"];
        $_SESSION["scadenza"]=time() + SCADENZA;
        setcookie(session_name(), session_id(), time()+SCADENZA, "/"); // / --> vale per tutte le risorse
        echo json_encode(array("ris"=>"ok"));
    }

    // 5. Close
    $con->close();
}

?>