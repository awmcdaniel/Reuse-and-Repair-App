<?php
/* to prevent caching: http://stackoverflow.com/questions/1907653/how-to-force-page-not-to-be-cached-in-php */
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
header("Expires: Sat, 26 Jul 1997 05:00:00 GMT");

require '../app/bootstrap.php';

/*
This page is left blank intentionally. Do everything in app folder.
 */
