<?php

/* Database Configuration */
$dbhost   = '127.0.0.1';
$dbuser   = 'root';
$dbpass   = '';
$dbname   = 'test_api';
$dbmethod = 'mysql:host=127.0.0.1;dbname=';

$dsn = $dbmethod.$dbname;
$pdo = new PDO($dsn, $dbuser, $dbpass);
$db = new NotORM($pdo);