<?php

namespace Reuseapp\Validation;

use Reuseapp\User\User;
use Violin\Violin;

/**
 *
 */
class Validator extends Violin
{
    protected $user;

    public function __construct(User $user)
    {
        $this->user = $user;

        $this->addFieldMessages([
            'username' => [
                'uniqueUsername' => 'Duplicate detected.',
            ],
        ]);

    }

    public function validate_uniqueUsername($value, $input, $args)
    {
        return !(bool) $this->user->where('username', $value)->count();
    }
}
