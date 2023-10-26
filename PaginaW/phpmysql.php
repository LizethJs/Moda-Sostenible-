<!DOCTYPE html>
<html lang="en">
<head>
<meta charset = "UTF - 8">
<meta name = "viewport" content="width=device-width, initial-sacale=1.0">
<title>Document</title>
</head>
<body>
<?php
require_once 'dbconfig.php';
try {
    $mbd= new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    foreach($mbd->query('SELECT * from descripcionprendas') as $fila) {
        print_r($fila);
    }
    $mbd = null;
} catch (PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}
?>
</body>
</html>