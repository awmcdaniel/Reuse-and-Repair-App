<?php

/* ============================================
Load the API routes
===============================================*/
$routes_api = array(
    'itemcategories.php',
    'items.php',
    'organizationtypes.php',
    'itemorganizations.php',
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
$routes_web = array(
    'home.php',
);

define("ROUTES_WEB", "routes/web/");
foreach ($routes_web as $web_fname) {
    require_once ROUTES_WEB . $web_fname;
}

/* ============================================
Load the ADMIN page routes
===============================================*/
$routes_admin = array(
    'organizations.php',
    'itemcategories.php',
    'items.php',
);

define("ROUTES_ADMIN", "routes/admin/");
foreach ($routes_admin as $admin_fname) {
    require_once ROUTES_ADMIN . $admin_fname;
}
