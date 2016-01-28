<?php

$app->get('/', function() use ($app) {
	echo "hello";
})->name('home');