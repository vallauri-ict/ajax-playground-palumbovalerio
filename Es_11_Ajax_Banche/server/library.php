<?php

function connection($dbName){
    define('DBHOST', 'localhost');
    define('DBUSER', 'root');
    define('DBPASS', '');
    mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
    try
    {
        $con = new mysqli(DBHOST, DBUSER, DBPASS, $dbName);
        $con->set_charset("utf8");
        return $con;
    }
    catch (mysqli_sql_exception $ex)
    {
        http_response_code(503);
        die ("Errore connessione db: " . $ex->getMessage());
    }
}


function runQuery($con, $sql){
    try{
        $rs=$con->query($sql);
    }
    catch (mysqli_sql_exception $ex)
    {
        $con->close();
        http_response_code(500);
        die("Errore esecuzione query. " . $ex->getMessage());
    }

    if(!is_bool($rs))
        $data=$rs->fetch_all(MYSQLI_ASSOC);
    else
        $data=$rs;
    return $data;
}

function parameterControl($parameter, $responseCode, $secondaryCondition=true)
{
    if(!isset($_REQUEST["$parameter"]) && $secondaryCondition)
    {
        http_response_code($responseCode);
        die("Parametro mancante ($parameter)");
    }
    else
        return $_REQUEST["$parameter"];
}

function isNumericControl($parameterName, $con)
{
    $parameter = $con->real_escape_string($_REQUEST["$parameterName"]);
    if (!is_numeric($parameter))
    {
        $con->close();
        http_response_code(400);
        die ("Il parametro $parameterName deve essere numerico.");
    }
    return $parameter;
}
?>