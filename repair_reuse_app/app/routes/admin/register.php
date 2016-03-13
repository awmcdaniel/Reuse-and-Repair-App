<?php

$app->get('/register', $guest_user(), function () use ($app) {
    $app->render('auth/register.php');
})->name('register');

$app->post('/register', $guest_user(), function () use ($app) {
    $request = $app->request;

    $email            = $request->post('email');
    $username         = $request->post('username');
    $password         = $request->post('password');
    $password_confirm = $request->post('password_confirm');

    //validation
    $v = $app->validation;
    $v->validate([
        'username'         => [$username, 'required|alnumDash|max(20)|uniqueUsername'],
        'password'         => [$password, 'required|min(6)'],
        'password_confirm' => [$password_confirm, 'required|matches(password)'],
    ]);

    if ($v->passes()) {
        $app->user->create([
            'username' => $username,
            'password' => $app->hash->password($password),
        ]);

        $app->flash('global', 'You have been registered');
        $app->response->redirect($app->urlFor('home'));

    }

    $app->render('auth/register.php', array(
        'errors'  => $v->errors(),
        'request' => $request,
    ));

})->name('register.post');
