<?php

    header("Content-type:application/json;charset=utf-8");
    require("library.php");

    checkSession("cCorrentista");

    // controllo parametri
    $cFiliale=$con->real_escape_string(parameterControl("cFiliale", 400));

    // connessione
    $con=connection("4b_banche");
    $id=$_SESSION["cCorrentista"];


    // query
    $sql="SELECT cConto FROM conti WHERE cCorrentista=$id AND cFiliale=$cFiliale";
    $data=eseguiQuery($con, $sql);
    $cConto=$data[0]["cConto"];

    $sql="SELECT * FROM movimenti WHERE cConto=$cConto";
    $data=eseguiQuery($con, $sql);
    
    echo json_encode($data);

    $con->close();
?>