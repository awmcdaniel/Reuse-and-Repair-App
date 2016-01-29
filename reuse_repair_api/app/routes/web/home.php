<?php

$app->get('/', function () use ($app) {
    echo "hello 2";
})->name('home');
