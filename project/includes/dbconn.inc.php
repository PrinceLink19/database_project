

<?php
    //database handler method
    
    $serverName = "localhost";
    $dbUser = $_SERVER['DB_USER'];
    $dbPassword = $_SERVER['DB_PASS'];
    $dbName = "mschyns_".$_SERVER['DB_USER'];

    $conn = mysqli_connect($serverName, $dbUser, $dbPassword, $dbName);
    
    if (!$conn) {
        die ("Connection failed: " . mysql_connect_error());
    }