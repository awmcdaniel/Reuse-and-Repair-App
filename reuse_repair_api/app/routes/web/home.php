<?php

$app->get('/admin', function () use ($app) {
    $app->render('admin/login.php', [

    ]);
})->name('home');

$app->get('/', function () use ($app) {
    echo "hello";
})->name('home');
