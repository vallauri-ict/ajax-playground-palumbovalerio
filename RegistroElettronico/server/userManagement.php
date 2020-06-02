<?php

    header("Content-type:application/json;charset=utf-8");
    require("../libraries/library.php");

    checkSession("codProf");
    // connessione
    $con=connection("4b_scuola");
    $id=$_SESSION["codProf"];

    // query
    $nomeUtente=selectDatas($con, "SELECT nominativo FROM professori WHERE codProf=$id", "nominativo");
    $qna=selectDatas($con, "SELECT domanda, risposta FROM domande WHERE codProf=$id", "", false);

    $data=array("name" => $nomeUtente, "question"=>$qna[0]["domanda"], "answer"=>$qna[0]["risposta"]);

    echo json_encode($data);

    $con->close();
?>