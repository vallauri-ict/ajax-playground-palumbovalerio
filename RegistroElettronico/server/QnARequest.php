<?php

header("Content-type:application/json;charset=utf-8");
require("library.php");

if($_SERVER["REQUEST_METHOD"]=="POST"){
    // 1. Controllo parametri
    parameterControl("username", 400);

    // 2. Connessione
    $con=connection("4b_scuola");
    $user=$con->real_escape_string($_POST["username"]);

    // 3. Query
    $data=selectDatas($con, "SELECT * FROM professori WHERE nominativo='$user'", "", false);

    if(count($data)==0) error(401, "Username non valido");
    // 4. Creazione session e restituzione risultato
    else{
        session_start();
        $id=$data[0]["codProf"];
        $_SESSION["codProf"]=$id;
        $_SESSION["scadenza"]=time() + SCADENZA;
        setcookie(session_name(), session_id(), time()+SCADENZA, "/"); // / --> vale per tutte le risorse
        $qna=selectDatas($con, "SELECT * FROM domande WHERE codProf=$id", "", false);
        echo json_encode(array("domanda"=>$qna[0]["domanda"], "risposta"=>$qna[0]["risposta"]));
    }

    // 5. Close
    $con->close();
}

?>