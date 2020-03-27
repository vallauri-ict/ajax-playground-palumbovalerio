### Es_11_Ajax_Banche 

Manegement of a simulation of the Italian banking system

--------------------------------
*Project version: __1.0.0__*

*Project specifics:*
1. Allows you to choose a bank from the database;
2. The branches list is automatically fill with branches associated with the chosen bank;
3. Show a table with datas of the chosen branche;

--------------------------------

# libreria.js
```javascript
function inviaRichiesta(method, url, parameters=""){} //Send a request for ajax
function error(jqXHR, text_status, string_error){}    //In case of error it returns the type
```

At the error function the parameters are automatically injected

# library.php
```php
function connection($dbName){}  //Create the connection with the database
function runQuery($con, $sql){} //Run a specific query
function parameterControl($parameter, $responseCode, $secondaryCondition=true){} //Control of a specific parameter
function isNumericControl($parameterName, $con){} //Control if a parameter is numeric. If this is true, it return the parameter
```

--------------------------------

my Social Media | Links
------------- | ------------------------------------------------------------------
my Instagram: | [palumbo__valerio](https://www.instagram.com/palumbo__valerio/)
my Youtube Channel: | [RedX64](https://www.youtube.com/channel/UCWOLxDm6jrNPUvrkjsRmscg?view_as=subscriber)
my Website: | [valepaluseba.altervista.org](https://valepaluseba.altervista.org/)

*By Palumbo Valerio Sebastiano*
