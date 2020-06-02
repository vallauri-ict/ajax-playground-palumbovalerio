<?php
    header("Content-type:application/json;charset=utf-8");
    require("../libraries/library.php");

    session_start();
    destroySession();
    echo(json_encode(array("ris"=>"ok")));
?>