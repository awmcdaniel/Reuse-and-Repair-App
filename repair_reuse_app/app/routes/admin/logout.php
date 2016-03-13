<?php

$app->get('/logout', function () use ($app) {
    unset($_SESSION[$app->config->get('auth.session')]);
    $app->response->redirect($app->urlFor('login'));
})->name('logout');
