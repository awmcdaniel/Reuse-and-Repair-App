<?php

namespace Reuseapp\Helpers;

/**
 * for hashing passwords
 */

if(!function_exists('hash_equals')) {
  function hash_equals($str1, $str2) {
    if(strlen($str1) != strlen($str2)) {
      return false;
    } else {
      $res = $str1 ^ $str2;
      $ret = 0;
      for($i = strlen($res) - 1; $i >= 0; $i--) $ret |= ord($res[$i]);
      return !$ret;
    }
  }
}
        
class Hash
{
    protected $config;

    public function __construct($config)
    {
        $this->config = $config;
    }

    public function password($password)
    {
        //uses php password hasher
        return password_hash(
            $password,
            $this->config->get('app.hash.algo'),
            ['cost' => $this->config->get('app.hash.cost')]
        );
    }

    public function passwordCheck($password, $hash)
    {
        //php hash verifier
        return password_verify($password, $hash);
    }

    public function hash($input)
    {
        return hash('sha256', $input);
    }


    public function hashCheck($known, $user)
    {
        return hash_equals($known, $user);
    }


}
