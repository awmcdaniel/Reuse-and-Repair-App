<?php

namespace Reuseapp\User;

use Illuminate\Database\Eloquent\Model as Eloquent;

class User extends Eloquent
{
    protected $table = 'users';

    protected $fillable = [
        'username',
        'password',
    ];

    public function getIdentity()
    {
        return "$this->username";
    }

    public function active()
    {
        return "$this->active";
    }
}
