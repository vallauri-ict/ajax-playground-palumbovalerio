<?php

    header("Content-type:application/json;charset=utf-8");
    require("library.php");

    checkSession("codProf");
    // connessione
    $con=connection("4b_scuola");
    $id=$_SESSION["codProf"];

    // query
    $nomeUtente=selectDatas($con, "SELECT nominativo FROM professori WHERE codProf=$id", "nominativo");

    $materie=selectDatas($con, "SELECT materie FROM professori WHERE codProf=$id", "materie");
    $materia=explode("-", $materie);

    $classi=selectDatas($con, "SELECT classe FROM $materia[0] WHERE codProf=$id", "classe", false);

    $data=array("name" => $nomeUtente, "subjects"=>$materie, "classes"=>$classi);

    echo json_encode($data);

    $con->close();
?>