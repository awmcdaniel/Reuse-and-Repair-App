<?php

/* ===========================================================================
LIST ALL
=========================================================================== */
$app->get('/api/organizationtypes', function () use ($app, $db) {
    $itemtypes = array();
    foreach ($db->organizationtype() as $item) {
        $itemtypes[] = array(
            'id'          => $item['id'],
            'description' => $item['description'],
        );
    }
    $app->response()->header("Content-Type", "application/json");
    echo json_encode(["data" => $itemtypes]);
});

/* ===========================================================================
LIST ONE
=========================================================================== */

$app->get('/api/organizationtype/:id', function ($id) use ($app, $db) {

    $app->response()->header("Content-Type", "application/json");

    $type = $db->organizationtype()->where('id', $id);
    if ($data = $type->fetch()) {
        echo json_encode(array(
            'id'          => $data['id'],
            'description' => $data['description'],
        ));

    } else {

        $app->response()->setStatus(404);
        echo json_encode(array(
            'status'  => 404,
            'message' => "OrganizationType ID=$id was not found in server",
        ));
    }
});



/* ===========================================================================
INSERT ONE
=========================================================================== */
$app->post('/api/organizationtype', function () use ($app, $db) {
    $app->response()->header("Content-Type", "application/json");
    $description = $app->request()->post('description');

    //check if it already exist
    $type = $db->organizationtype()->where('description', $description);
    if ($data = $type->fetch()) {
        $app->response()->setStatus(409);
        echo json_encode(array(
            'status'  => 409,
            'message' => "OrganizationType with same description already exist in DB.",
        ));
    } else {
        //splice body and get only the description
        $add_type = ['description' => $description];
        $id       = $db->itemtype->insert($add_type);

        $row = $db->organizationtype()->where('id', $id)->fetch();
        $results = array(
            'id'          => $row['id'],
            'description' => $row['description'],
        );

        echo json_encode(["message" => "successfull insert", "data" => $results]);
    }
});


/* ===========================================================================
UPDATE ONE
=========================================================================== */

$app->put('/api/organizationtype/:id', function ($id) use ($app, $db) {

    $app->response()->header("Content-Type", "application/json");

    $query = $db->organizationtype()->where("id", intval($id));

    if ($row = $query->fetch()) {

        $post_data = $app->request()->put();
        $result    = $query->update($post_data); //returns true/false
        $row       = $db->organizationtype()->where("id", intval($id))->fetch();

        $results = array(
            'id'          => $row['id'],
            'description' => $row['description'],
        );

        echo json_encode(["message" => "Successfull update of OrganizationType to DB.", "data" => $results]);

    } else {

        $app->response()->setStatus(404);
        echo json_encode([
            'status'  => 404,
            'message' => "OrganizationType ID=$id was not found in server",
        ]);
    }
});


/* ===========================================================================
DELETE ONE
=========================================================================== */

$app->delete('/api/organizationtype/:id', function ($id) use ($app, $db) {
    $app->response()->header("Content-Type", "application/json");

    $query = $db->organizationtype()->where('id', $id);
    if ($query->fetch()) {
        $result = $query->delete();
        echo json_encode(array(
            "status"  => true,
            "message" => "OrganizationType deleted successfully",
        ));
    } else {
        $app->response()->setStatus(404);
        echo json_encode(array(
            "status"  => 404,
            "message" => "OrganizationType id $id does not exist",
        ));
    }
});