<?php
    header("Content-type:application/json;charset=utf-8");
    require ("library.php");

    parameterControl("cFiliale", 422);
    $con=connection("4b_banche");
    $cFiliale = isNumericControl("cFiliale",$con);

    $sql = "SELECT cor.cCorrentista, cor.nome AS nomeCorrentista, com.nome AS comuneCorrentista, cor.telefono, con.cConto, con.saldo FROM correntisti cor, comuni com, conti con WHERE cor.cComune = com.cComune AND cor.cCorrentista = con.cCorrentista AND con.cFiliale = $cFiliale;";
    $data = runQuery($con, $sql);
    echo json_encode($data);
    $con->close();
?>