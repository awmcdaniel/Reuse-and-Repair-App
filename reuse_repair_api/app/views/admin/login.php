<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../static/css/login.css">
  </head>
  <body>

    <div class="container">
      {% if failedLogin %}
      <div class="alert alert-danger" role="alert">{{ failedLogin }}</div>
      {% endif %}
      <form class="form-signin" id="form-admin-login" action="{{ urlFor('login.post') }}" method="POST" autocomplete="off">
         <input type="hidden" name="{{csrf_key}}" value="{{csrf_token}}"></input>
        <h2 class="form-signin-heading" id="heading">ADMIN CMS</h2>

        <label for="input_username" class="sr-only">Username</label>
        <input type="text" id="input_username" name="username" class="form-control" placeholder="Username" autofocus>
        <span class="help-block">
          {% if errors.first('username') %}
            {{ errors.first('username') }}
          {% endif %}
        </span>

        <label for="input_password" class="sr-only">Password</label>
        <input type="password" id="input_password" name="password" class="form-control" placeholder="Password" >
        <span class="help-block">
          {% if errors.first('password') %}
            {{ errors.first('password') }}
          {% endif %}
        </span>

        <button class="btn btn-lg btn-primary btn-block" type="submit" id="button_signin">Sign in</button>
      </form>

    </div> <!-- /container -->



    <!-- Bootstrap -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
  </body>
</html>
