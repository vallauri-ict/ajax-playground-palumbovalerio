<?php

header("Content-type:application/json;charset=utf-8");
require("../libraries/library.php");

if($_SERVER["REQUEST_METHOD"]=="POST"){
    $table=parameterControl("tabella", 400);
    $class=parameterControl("classe", 400);
    checkSession("codProf");

    $con=connection("4b_scuola");
    $id=$_SESSION["codProf"];

    $datas=selectDatas($con, "SELECT * FROM $table WHERE codProf=$id AND classe='$class'", "", false);

    echo json_encode(array($datas));

    $con->close();
}

?>