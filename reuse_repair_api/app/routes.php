<?php

/* ============================================
Load the API routes
===============================================*/
$routes_api = array(
    'itemcategories.php',
    'items.php',
    'organizationtypes.php',
    'organizationitems.php',
    'organizationhours.php',
    'organizations.php',
);

define("ROUTES_API", "routes/api/");
foreach ($routes_api as $api_fname) {
    require_once ROUTES_API . $api_fname;
}

/* ============================================
Load the WEB page routes
===============================================*/
define("ROUTES_WEB", "routes/web/");
$routes_web = array(
    'home.php',
);

foreach ($routes_web as $web_fname) {
    require_once ROUTES_WEB . $web_fname;
}
