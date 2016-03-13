<?php
header("Access-Control-Allow-Origin: *");

session_cache_limiter(false);
session_start();

ini_set('display_errors', 'On'); //remove for production

define('INC_ROOT', dirname(__DIR__)); //root folder

require INC_ROOT . '/vendor/autoload.php';
require INC_ROOT . '/plugins/NotORM.php';

use Illuminate\Database\Capsule\Manager as Capsule;
use Noodlehaus\Config;
use RandomLib\Factory as RandomLib;
use Reuseapp\Helpers\Hash;
use Reuseapp\Middleware\BeforeMiddleware;
use Reuseapp\Middleware\CsrfMiddleware;
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
Middlewares
===============================================*/
$app->add(new BeforeMiddleware);
$app->add(new CsrfMiddleware);

/* ============================================
DATABASE
===============================================*/

$app->container->singleton('db', function () use ($app) {
    $dbhost   = $app->config->get('db.host');
    $dbuser   = $app->config->get('db.username');
    $dbpass   = $app->config->get('db.password');
    $dbname   = $app->config->get('db.name');
    $dbmethod = $app->config->get('db.method');

    $dsn = $dbmethod . $dbname;
    $pdo = new PDO($dsn, $dbuser, $dbpass);
    $db  = new NotORM($pdo);

    return $db;
});
$db = $app->db;

$capsule = new Capsule;

$capsule->addConnection([
    'driver'    => $app->config->get('db.driver'),
    'host'      => $app->config->get('db.host'),
    'database'  => $app->config->get('db.name'),
    'username'  => $app->config->get('db.username'),
    'password'  => $app->config->get('db.password'),
    'charset'   => $app->config->get('db.charset'),
    'collation' => $app->config->get('db.collation'),
    'prefix'    => $app->config->get('db.prefix'),
]);

$capsule->bootEloquent();

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
        'AssetsURL'    => $app->config->get('app.staticUrl'),
        'baseAdminURL' => $app->config->get('app.adminUrl'),
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
    return new Validator($app->user);
});

$app->container->singleton('randomlib', function () use ($app) {
    $factory = new RandomLib;
    return $factory->getMediumStrengthGenerator();
});

/* ============================================
ROUTES
===============================================*/
require 'filters.php';
require 'routes.php';

/* ============================================
RUN
===============================================*/
$app->run();
