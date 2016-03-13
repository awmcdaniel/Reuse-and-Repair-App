<?php

/* ===========================================================================
DELETE ONE
=========================================================================== */

$app->delete('/api/organizationitems/:id', function ($id) use ($app, $db) {
    $app->response()->header("Content-Type", "application/json");

    $query = $db->organizationitems()->where('id', $id);
    if ($query->fetch()) {
        $result = $query->delete();
        echo json_encode(array(
            "status"  => 200,
            "message" => "Item deleted successfully",
        ));
    } else {
        $app->response()->setStatus(404);
        echo json_encode(array(
            "status"  => 404,
            "message" => "Id $id does not exist",
        ));
    }
});
