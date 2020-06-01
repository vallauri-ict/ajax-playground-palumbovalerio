<?php

header("Content-type:application/json;charset=utf-8");
require("../libraries/library.php");

if($_SERVER["REQUEST_METHOD"]=="POST"){
    // 1. Controllo parametri
    parameterControl("vecchiaMd5", 400);
    parameterControl("vecchia", 400);
    parameterControl("nuovaMd5", 400);
    parameterControl("nuova", 400);

    checkSession("codProf");
    // 2. Connessione
    $con=connection("4b_scuola");
    $oldPwdMd5=$con->real_escape_string($_POST["vecchiaMd5"]);
    $oldPwd=$con->real_escape_string($_POST["vecchia"]);
    $newPwdMd5=$con->real_escape_string($_POST["nuovaMd5"]);
    $newPwd=$con->real_escape_string($_POST["nuova"]);
    $id=$_SESSION["codProf"];

    // 3. Query
    $dbPwd=selectDatas($con, "SELECT pwd FROM professori WHERE codProf=$id", "pwd");
    if($dbPwd!=$oldPwdMd5) error(401, "Password non valida");
    // 4. Restituzione risultato
    else{
        runQuery($con, "UPDATE professori SET pwd='$newPwdMd5' WHERE codProf=$id");
        $test=selectDatas($con, "SELECT * FROM professori WHERE pwd='$oldPwdMd5'", "", false);
        if(count($test)==0) runQuery($con, "DELETE FROM decriptazione WHERE md5='$oldPwdMd5'");
        runQuery($con, "INSERT IGNORE INTO decriptazione (md5,password) VALUES ('$newPwdMd5','$newPwd')");
        echo json_encode(array("id"=>$id));
    }

    // 5. Close
    $con->close();
}

?>