<?php
header("Access-Control-Allow-Origin: *");

session_cache_limiter(false);
session_start();

ini_set('display_errors', 'On'); //remove for production

define('INC_ROOT', dirname(__DIR__)); //root folder

require INC_ROOT . '/vendor/autoload.php';
require INC_ROOT . '/plugins/NotORM.php';

use Noodlehaus\Config;
use Reuseapp\Helpers\Hash;
use Reuseapp\User\User;
use Reuseapp\Validation\Validator;
use Slim\Slim;
use Slim\Views\Twig;
use Slim\Views\TwigExtension;

/* ============================================
INITS
===============================================*/

$app = new Slim([
    'mode'           => rtrim(file_get_contents(INC_ROOT . '/mode.php')),
    'view'           => new Twig(),
    'templates.path' => INC_ROOT . '/app/views',
]);

$app->configureMode($app->config('mode'), function () use ($app) {
    $app->config = Config::load(INC_ROOT . "/app/config/$app->mode.php");
});

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
$view                = $app->view();
$view->parserOptions = [
    'debug' => $app->config->get('twig.debug'),
];
$view->parserExtensions = [
    new TwigExtension(),
];

$app->hook('slim.before', function () use ($app) {
    $app->view()->appendData(array(
        'AssetsURL'    => 'http://localhost:4000/static',
        'baseAdminURL' => 'http://localhost:4000/admin',
    ));
});

/* ============================================
Custom Models
===============================================*/
$app->container->set('user', function () {
    return new User;
});

$app->container->singleton('hash', function () use ($app) {
    return new Hash($app->config);
});

$app->container->singleton('validation', function () use ($app) {
    return new Validator;
});

/* ============================================
ROUTES
===============================================*/
require 'routes.php';

/* ============================================
RUN
===============================================*/
$app->run();
