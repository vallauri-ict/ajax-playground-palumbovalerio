# Registro Elettronico 

1. In caso di password smarrita, premendo sul link apposito nella pagina di login, si viene reindirizzati ad una pagina apposita che,
   dopo una serie di accertamenti, reimposta la password in "*profNome_utente*" e rimanda alla pagina di login, copiando in clipboard la password;
2. Dopo il login vengono caricate le combobox con le materie e le classi del professore; 
3. Scegliendo una classe (o una materia se ce ne fossero più di due e la combo delle classi non ha -1 come selected index)
   la tabella viene riempita con i dati degli studenti corrispondenti;
4. Con il pulsante modifica si può modificare la media dello studente corrispondente. Finchè il valore della media rimane quello salvato
   nel database, il pulsante rimane disattivato;
5. Sempre nell'index, partendo da destra, si può eseguire il logout dell'utente, che riporta alla pagina di login dopo aver cancellato la sessione
   corrente;
6. Abbiamo poi un apposito pulsante **"cambia password"** con il quale si può reimpostare manualmente la propria password. Si viene reindirizzati ad
   una pagina apposita;
7. Infine, con il pulsante **"Gestisci utente: *nome_utente*"**  si può modificare il proprio nome utente e la propria domanda di sicurezza, utile in caso ci
   si dimenticasse la propria password, con relativa risposta.

--------------------------------

### libreria.js
```javascript
function inviaRichiesta(method, url, parameters=""){} //Send a request for ajax
function error(jqXHR, text_status, string_error){}    //In case of error it returns the type
function pwEncrypton(password) {}  //MD5 password encryption
function showLblError(lblError, textPointer, text) {}  //Show error label
function setError(control) {}  //Set an error with red border
function removeError(control) {}  //Remove the error
function copyInClipboard(copyText) {}  //Copy in the clipboard a specific text
function removeDumplicateValue(myArray) {}  //Remove the duplicate value from an array
```

At the error function the parameters are automatically injected

### library.php
```php
function connection($dbName){}  //Create the connection with the database
function selectDatas($con, $sql, $parameter, $onlyOne=true){}  //Select and return one or more datas with SQL Query
function runQuery($con, $sql){} //Run a specific query
function checkSession($key){}  //Check the esistence of the session or if this is expired
function parameterControl($parameter, $responseCode, $secondaryCondition=true){} //Control of a specific parameter
function isNumericControl($parameterName, $con){} //Control if a parameter is numeric. If this is true, it return the parameter
function error($responseCode, $message){}  //Do an error
function destroySession(){}  //Destroy the courrent session
```

### library.css
```css
.icona-rossa{
	color: #dc3545;  /* color used by is-invalid */
	border:1px solid #dc3545; 
	border-right:transparent;
}
```

--------------------------------

my Social Media | Links
------------- | ------------------------------------------------------------------
my Instagram: | [palumbo__valerio](https://www.instagram.com/palumbo__valerio/)
my Youtube Channel: | [RedX64](https://www.youtube.com/channel/UCWOLxDm6jrNPUvrkjsRmscg?view_as=subscriber)
my Website: | [valepaluseba.altervista.org](https://valepaluseba.altervista.org/)

*By Palumbo Valerio Sebastiano*
