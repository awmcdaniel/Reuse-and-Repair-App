<?php

/* ===========================================================================
LIST ALL
=========================================================================== */
$app->get('/api/organizations', function () use ($app, $db) {

    $results = array();
    foreach ($db->organizations() as $row) {

        $org_type = null;
        $query    = $db->organizationtype->where('id', intval($row['org_type']));
        if ($data = $query->fetch()) {
            $org_type = $data['description'];
        }

        $service_items = $db->organizationitems->select('item_id')->where('org_id', intval($row['id']));
        $items         = array();
        foreach ($service_items as $key => $value) {
            $items[] = $db->items->select('description')->where('id', $value['item_id'])->fetch()['description'];
        }

        $results[] = array(
            'id'            => $row['id'],
            'name'          => utf8_encode($row['name']),
            'org_type'      => $org_type,
            'street_1'      => $row['street1'],
            'street_2'      => $row['street2'],
            'city'          => $row['city'],
            'state'         => $row['state'],
            'zip_code'      => $row['zip'],
            'webpage'       => $row['webpage'],
            'phone'         => $row['phone'],
            'notes'         => $row['notes'],
            'service_items' => $items,
        );
    }

    $app->response()->header("Content-Type", "application/json");
    echo json_encode(["data" => $results]);
});

/* ===========================================================================
LIST ONE
=========================================================================== */

$app->get('/api/organizations/:id', function ($id) use ($app, $db) {

    $app->response()->header("Content-Type", "application/json");

    $query = $db->organizations()->where('id', $id);
    if ($row = $query->fetch()) {

        //get the type as text instead of id
        $org_type   = null;
        $type_query = $db->organizationtype()->where('id', intval($row['org_type']));
        if ($data = $type_query->fetch()) {
            $org_type = $data['description'];
        }

        $service_items = $db->organizationitems->select('item_id')->where('org_id', $id);
        $items         = array();
        foreach ($service_items as $key => $value) {
            $items[] = $db->items->select('id as item_id', 'description')->where('id', $value['item_id'])->fetch();
        }

        $results = array(
            'id'       => $row['id'],
            'name'     => htmlentities(utf8_encode($row['name'])),
            'org_type' => $org_type,
            'street_1' => $row['street1'],
            'street_2' => $row['street2'],
            'city'     => $row['city'],
            'state'    => $row['state'],
            'zip_code' => $row['zip'],
            'webpage'  => $row['webpage'],
            'phone'    => $row['phone'],
            'notes'    => $row['notes'],
            'items'    => $items,
        );

        echo json_encode(["data" => $results]);

    } else {

        $app->response()->setStatus(404);
        echo json_encode([
            'status'  => 404,
            'message' => "Organizations ID=$id was not found in server",
        ]);
    }
});

/* ===========================================================================
INSERT ONE
=========================================================================== */

$app->post('/api/organization', function () use ($app, $db) {
    $app->response()->header("Content-Type", "application/json");

    //check if data already exist
    $name    = $app->request()->post('name');
    $street1 = $app->request()->post('street1');
    $zip     = $app->request()->post('zip');

    $query = $db->organizations()->where('name=? AND street1=? AND zip=?', $name, $street1, $zip);
    if ($data = $query->fetch()) {
        $app->response()->setStatus(409);
        $id = $data['id'];
        echo json_encode(array(
            'status'  => 409,
            'message' => "Organization with same name and physical address already exist in DB. See /organization/$id",
        ));
    } else {

        //no duplicate found

        //add to organizations table
        $post_data = $app->request()->post();
        $result    = $db->organizations->insert([
            'org_type' => isset($post_data['org_type']) ? $post_data['org_type'] : null,
            'name'     => isset($post_data['name']) ? $post_data['name'] : null,
            'street1'  => isset($post_data['street1']) ? $post_data['street1'] : null,
            'street2'  => isset($post_data['street2']) ? $post_data['street2'] : null,
            'city'     => isset($post_data['city']) ? $post_data['city'] : null,
            'state'    => isset($post_data['state']) ? $post_data['state'] : null,
            'zip'      => isset($post_data['zip']) ? $post_data['zip'] : null,
            'webpage'  => isset($post_data['webpage']) ? $post_data['webpage'] : null,
            'phone'    => isset($post_data['phone']) ? $post_data['phone'] : null,
            'notes'    => isset($post_data['notes']) ? $post_data['notes'] : null,
        ]);
        $query = $db->organizations()->where('id', $result);
        if ($row = $query->fetch()) {

            //get the type as text instead of id
            $org_type   = null;
            $type_query = $db->organizationtype()->where('id', intval($row['org_type']));
            if ($data = $type_query->fetch()) {
                $org_type = $data['description'];
            }

            $results = array(
                'id'       => $row['id'],
                'name'     => htmlentities(utf8_encode($row['name'])),
                'org_type' => $org_type,
                'street_1' => $row['street1'],
                'street_2' => $row['street2'],
                'city'     => $row['city'],
                'state'    => $row['state'],
                'zip_code' => $row['zip'],
                'webpage'  => $row['webpage'],
                'phone'    => $row['phone'],
                'notes'    => $row['notes'],
            );

            echo json_encode(["message" => "Successfull insertion to DB.", "data" => $results]);

        } else {

            $app->response()->setStatus(500);
            echo json_encode([
                'status'  => 500,
                'message' => "Error. Could not find organization recently added. ",
            ]);
        }
    }

});

/* ===========================================================================
UPDATE ONE
=========================================================================== */
$app->put('/api/organization/:id', function ($id) use ($app, $db) {

    $app->response()->header("Content-Type", "application/json");

    $query = $db->organizations()->where("id", intval($id));

    if ($row = $query->fetch()) {

        $post_data = $app->request()->put();
        $result    = $query->update([
            'org_type' => isset($post_data['org_type']) ? $post_data['org_type'] : null,
            'name'     => isset($post_data['name']) ? $post_data['name'] : null,
            'street1'  => isset($post_data['street1']) ? $post_data['street1'] : null,
            'street2'  => isset($post_data['street2']) ? $post_data['street2'] : null,
            'city'     => isset($post_data['city']) ? $post_data['city'] : null,
            'state'    => isset($post_data['state']) ? $post_data['state'] : null,
            'zip'      => isset($post_data['zip']) ? $post_data['zip'] : null,
            'webpage'  => isset($post_data['webpage']) ? $post_data['webpage'] : null,
            'phone'    => isset($post_data['phone']) ? $post_data['phone'] : null,
            'notes'    => isset($post_data['notes']) ? $post_data['notes'] : null,
        ]);

        //get the type as text instead of id
        $row        = $db->organizations()->where("id", intval($id))->fetch();
        $org_type   = null;
        $type_query = $db->organizationtype()->where('id', intval($row['org_type']));
        if ($data = $type_query->fetch()) {
            $org_type = $data['description'];
        }

        $results = array(
            'id'       => $row['id'],
            'name'     => htmlentities(utf8_encode($row['name'])),
            'org_type' => $org_type,
            'street_1' => $row['street1'],
            'street_2' => $row['street2'],
            'city'     => $row['city'],
            'state'    => $row['state'],
            'zip_code' => $row['zip'],
            'webpage'  => $row['webpage'],
            'phone'    => $row['phone'],
            'notes'    => $row['notes'],
        );

        echo json_encode(array(
            "message" => "Successfull insertion to DB.",
            "data"    => $results,
        ));

    } else {

        $app->response()->setStatus(404);
        echo json_encode([
            'status'  => 404,
            'message' => "Organizations ID=$id was not found in server",
        ]);
    }
});

/* ===========================================================================
DELETE ONE
=========================================================================== */

$app->delete('/api/organization/:id', function ($id) use ($app, $db) {
    $app->response()->header("Content-Type", "application/json");

    $query = $db->organizations()->where('id', $id);
    if ($query->fetch()) {
        $result = $query->delete();
        echo json_encode(array(
            "status"  => true,
            "message" => "Organization deleted successfully",
        ));
    } else {
        $app->response()->setStatus(404);
        echo json_encode(array(
            "status"  => 404,
            "message" => "Organization id $id does not exist",
        ));
    }
});
