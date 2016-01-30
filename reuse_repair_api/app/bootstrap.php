<?php

require '../vendor/autoload.php';
require '../plugins/NotORM.php';
require '../plugins/GUMP/gump.class.php';

/* ============================================
INITS
===============================================*/
$app = new \Slim\Slim([
    'view' => new \Slim\Views\Twig(),
]);

/* ============================================
DATABASE
===============================================*/
$app->container->singleton('db', function () {
    $dbhost   = '127.0.0.1';
    $dbuser   = 'root';
    $dbpass   = '';
    $dbname   = 'test_api';
    $dbmethod = 'mysql:host=127.0.0.1;dbname=';

    $dsn = $dbmethod . $dbname;
    $pdo = new PDO($dsn, $dbuser, $dbpass);
    $db  = new NotORM($pdo);

    return $db;
});
$db = $app->db;

/* ============================================
VIEWS
===============================================*/
$view = $app->view();
$view->setTemplatesDirectory("../app/views");
$view->parserExtensions = [
    new \Slim\Views\TwigExtension(),
];

/* ============================================
ROUTES
===============================================*/
require 'routes.php';

/* ============================================
RUN
===============================================*/
$app->run();
