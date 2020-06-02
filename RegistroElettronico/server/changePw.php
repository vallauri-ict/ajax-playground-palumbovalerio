<?php

header("Content-type:application/json;charset=utf-8");
require("../libraries/library.php");

if($_SERVER["REQUEST_METHOD"]=="POST"){
    // 1. Controllo parametri
    parameterControl("vecchia", 400);
    parameterControl("nuova", 400);

    checkSession("codProf");
    // 2. Connessione
    $con=connection("4b_scuola");
    $oldPwd=$con->real_escape_string($_POST["vecchia"]);
    $newPwd=$con->real_escape_string($_POST["nuova"]);
    $id=$_SESSION["codProf"];

    // 3. Query
    $dbPwd=selectDatas($con, "SELECT pwd FROM professori WHERE codProf=$id", "pwd");
    if($dbPwd!=$oldPwd) error(401, "Password non valida");
    // 4. Restituzione risultato
    else{
        runQuery($con, "UPDATE professori SET pwd='$newPwd' WHERE codProf=$id");
        echo json_encode(array("id"=>$id));
    }

    // 5. Close
    $con->close();
}

?>