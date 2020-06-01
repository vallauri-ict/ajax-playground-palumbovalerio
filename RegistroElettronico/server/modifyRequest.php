<?php

header("Content-type:application/json;charset=utf-8");
require("../libraries/library.php");

if($_SERVER["REQUEST_METHOD"]=="POST"){
    // 1. Controllo parametri
    $tabella=parameterControl("tabella", 400);
    $codAlunno=parameterControl("codAlunno", 400);
    $media=parameterControl("media", 400);

    // 2. Connessione
    $con=connection("4b_scuola");

    // 3. Query
    runQuery($con, "UPDATE $tabella SET media=$media WHERE codAlunno=$codAlunno");

    echo json_encode(array("ris"=>"ok"));

    // 4. Close
    $con->close();
}

?>