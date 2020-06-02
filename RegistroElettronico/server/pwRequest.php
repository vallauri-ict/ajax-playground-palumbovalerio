<?php

header("Content-type:application/json;charset=utf-8");
require("../libraries/library.php");

if($_SERVER["REQUEST_METHOD"]=="POST"){
    checkSession("codProf");
    $tempPw=parameterControl("tempPw", 400);

    $con=connection("4b_scuola");
    $id=$_SESSION["codProf"];

    runQuery($con, "UPDATE professori SET pwd='$tempPw' WHERE codProf=$id");

    echo json_encode(array("ris"=>$tempPw));
    destroySession();

    $con->close();
}

?>