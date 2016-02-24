<?php

$app->get('/admin', $guest_user(), function () use ($app) {
    $app->render('admin/login.php');
})->name('login');

$app->post('/admin', $guest_user(), function () use ($app) {
    $request = $app->request;

    $username = $request->post('username');
    $password = $request->post('password');

    $v = $app->validation;

    $v->validate([
        'username' => [$username, 'required'],
        'password' => [$password, 'required'],
    ]);

    if ($v->passes()) {
        //lookup user
        $user = $app->user->where('username', $username)->first();

        if ($user && ($password == $user->password)) {
            $_SESSION[$app->config->get('auth.session')] = $user->id;

            $app->response->redirect($app->urlFor('organizations.showall'));
        } else {

            $app->render('admin/login.php', [
                'failedLogin' => "Login combination not found.",
            ]);
            die();

        }

    }

    //echo json_encode(["user" => $username, "pass" => $password]);

    $app->render('admin/login.php', [
        'errors'  => $v->errors(),
        'request' => $request,
    ]);

})->name('login.post');
