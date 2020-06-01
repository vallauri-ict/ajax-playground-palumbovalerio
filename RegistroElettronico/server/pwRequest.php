<?php

header("Content-type:application/json;charset=utf-8");
require("../libraries/library.php");

if($_SERVER["REQUEST_METHOD"]=="POST"){
    checkSession("codProf");
    $con=connection("4b_scuola");
    $id=$_SESSION["codProf"];

    $pwdMd5=selectDatas($con, "SELECT pwd FROM professori WHERE codProf=$id", "pwd");
    $pwd=selectDatas($con, "SELECT password FROM decriptazione WHERE md5='$pwdMd5'", "password");

    echo json_encode(array("ris"=>$pwd));
    destroySession();

    $con->close();
}

?>