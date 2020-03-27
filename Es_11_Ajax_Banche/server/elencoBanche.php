<?php

    header("Content-type:application/json;charset=utf-8");
    require ("library.php");
	
    $con=connection("4b_banche");
    
	$sql = "SELECT cBanca, nome FROM banche";
    $data = runQuery($con, $sql);
    echo json_encode($data);
    $con->close();

?>