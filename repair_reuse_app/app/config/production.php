<?php
if (!defined('PASSWORD_BCRYPT')) {
    define('PASSWORD_BCRYPT', 1);
}

return array(
    'app'  => [
        'url'       => 'http://myapp.sustainablecorvallis.org/',
        'staticUrl' => 'http://myapp.sustainablecorvallis.org/static',
        'adminUrl'  => 'http://myapp.sustainablecorvallis.org/admin',
        'hash'      => [
            'algo' => PASSWORD_BCRYPT,
            'cost' => 10,
        ],
    ],
    'db'   => [
        'driver'    => 'mysql',
        'host'      => 'localhost',
        'name'      => 'repair_reuse_app',
        'username'  => 'root',
        'password'  => '',
        'charset'   => 'utf8',
        'collation' => 'utf8_unicode_ci',
        'prefix'    => '',
        'method'    => 'mysql:host=localhost;dbname=',
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
