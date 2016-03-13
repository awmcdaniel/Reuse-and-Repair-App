<?php
if (!defined('PASSWORD_BCRYPT')) {
    define('PASSWORD_BCRYPT', 1);
}

return array(
    'app'  => [
        'url'       => 'http://localhost:4000',
        'staticUrl' => 'http://localhost:4000/static',
        'adminUrl'  => 'http://localhost:4000/admin',
        'hash'      => [
            'algo' => PASSWORD_BCRYPT,
            'cost' => 10,
        ],
    ],
    'db'   => [
        'driver'    => 'mysql',
        'host'      => '127.0.0.1',
        'name'      => 'test_api',
        'username'  => 'root',
        'password'  => '',
        'charset'   => 'utf8',
        'collation' => 'utf8_unicode_ci',
        'prefix'    => '',
        'method'    => 'mysql:host=127.0.0.1;dbname=',
    ],
    'auth' => [
        'session'  => 'user_id',
        'remember' => 'user_r',
    ],
    'twig' => [
        'debug' => true,
    ],
    'csrf' => [
        'key' => 'csrf_token',
    ],
);
