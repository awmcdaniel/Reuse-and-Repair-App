<?php

/* ADMIN */
$authenticationCheck = function ($required) use ($app) {
    return function () use ($required, $app) {
        if ((!$app->auth && $required) || ($app->auth && !$required)) {
            $app->redirect($app->urlFor('login'));
        }
    };
};

$authenticated_user = function () use ($authenticationCheck) {
    return $authenticationCheck(true);
};

$guest_user = function () use ($authenticationCheck) {
    return $authenticationCheck(false);
};
