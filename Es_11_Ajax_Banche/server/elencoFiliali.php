<?php
    header("Content-type:application/json;charset=utf-8");
    require ("library.php");

    parameterControl("cBanca", 422);
    $con=connection("4b_banche");
    $cBanca = isNumericControl("cBanca", $con);

    $sql = "SELECT f.cFiliale, f.nome AS nomeFiliale, c.nome AS nomeComune FROM filiali f, comuni c WHERE f.cComune = c.cComune AND f.cBanca = $cBanca;";
    $data = runQuery($con, $sql);
    echo json_encode($data);
    $con->close();
?>