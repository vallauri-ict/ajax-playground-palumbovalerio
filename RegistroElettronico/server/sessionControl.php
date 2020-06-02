<?php
    header("Content-type:application/json;charset=utf-8");
    require("../libraries/library.php");

    checkSession("codProf");
    echo(json_encode(array("ris"=>"ok")));
?>