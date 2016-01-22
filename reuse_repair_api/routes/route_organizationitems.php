<?php

/* ===========================================================================
LIST ALL
=========================================================================== */

$organizationItems_listAll = function () use ($app, $db) {
    $results = array();
    foreach ($db->organizationitems() as $row) {

        $org_name = null;
        $item_name = null;

        //get the names
        $query = $db->organizations->where('id', intval($row['org_id']));
        if ($data = $query->fetch()) {
            $org_name = $data['name'];
        }

        $query = $db->items->where('id', intval($row['item_id']));
        if ($data = $query->fetch()) {
            $item_name = $data['name'];
        }

        $results[] = array(
            'id' => $row['id'],
            'org_id' => $org_name,
            'item_id' => $item_name
        );
    }

    $app->response()->header("Content-Type", "application/json");
    echo json_encode(["data" => $results]);
};

/* ===========================================================================
LIST ONE
=========================================================================== */

$organizationItems_listOne = function ($id) use ($app, $db) {

    $app->response()->header("Content-Type", "application/json");

    $query = $db->organizationitems()->where('id', $id);
    if ($row = $query->fetch()) {

        //get the names
        $query = $db->organizations->where('id', intval($row['org_id']));
        if ($data = $query->fetch()) {
            $org_name = $data['name'];
        }

        $query = $db->items->where('id', intval($row['item_id']));
        if ($data = $query->fetch()) {
            $item_name = $data['name'];
        }

        $results[] = array(
            'id' => $row['id'],
            'org_id' => $org_name,
            'item_id' => $item_name
        );

        echo json_encode(["data" => $results]);

    } else {

        $app->response()->setStatus(404);
        echo json_encode([
            'status'  => 404,
            'message' => "OrganizationItem ID=$id was not found in server",
        ]);
    }
};

/* ===========================================================================
INSERT ONE
=========================================================================== */

$organizationItems_insert = function () use ($app, $db) {
    $app->response()->header("Content-Type", "application/json");

    //get the parameters
    $organization_id = $app->request()->post('org_id');
    $item_id = $app->request()->post('item_id');

    //check if business and service item exist
    $result_org = $db->organizations()->where("id", intval($organization_id))->fetch();
    $result_item = $db->items()->where("id", intval($item_id))->fetch();

    if ($result_org && $result_item) {
        //items exist, perform association
        $post_data = $app->request()->post();
        $id        = $db->organizationitems->insert($post_data);

        $row = $db->organizationitems()->where('id', $id)->fetch();
        if ($row) {
            //get the names
            $query = $db->organizations->where('id', intval($row['org_id']));
            if ($data = $query->fetch()) {
                $org_name = $data['name'];
            }

            $query = $db->items->where('id', intval($row['item_id']));
            if ($data = $query->fetch()) {
                $item_name = $data['name'];
            }

            $results[] = array(
                'id' => $row['id'],
                'org_id' => $org_name,
                'item_id' => $item_name
            );

            echo json_encode(["message" => "Successfull insertion.","data" => $results]);
        } else {
            $app->response()->setStatus(404);
            echo json_encode([
                'status'  => 404,
                'message' => "There was an error with the insertion. Could not find row.",
            ]);

        }

    } else {
       //items do not exist, ask user to add them first

        $msg = array();

        if (!$result_org) {
            $msg[] = "Organization ID=$organization_id does not exist in DB. Use POST /api/organizations to add organizations.";
        }

        if (!$result_item) {
            $msg[] = "Item ID=$item_id does not exist in DB. USE POST /api/item to add items.";
        }

        $results[] = array(
            'status' => 404,
            'message' => $msg,
        );

        $app->response()->setStatus(404);
        echo json_encode($msg);
    }
    


};

/* ===========================================================================
UPDATE ONE
=========================================================================== */

$organizationItems_update = function ($id) use ($app, $db) {

    $app->response()->header("Content-Type", "application/json");

    $query = $db->organizationitems()->where("id", intval($id));

    if ($row = $query->fetch()) {

        $post_data = $app->request()->put();
        $result    = $query->update($post_data); //result = true/false

        //get the updated data
        $row  = $db->organizationitems()->where("id", intval($id))->fetch();
        $query = $db->organizations->where('id', intval($row['org_id']));
        if ($data = $query->fetch()) {
            $org_name = $data['name'];
        }

        $query = $db->items->where('id', intval($row['item_id']));
        if ($data = $query->fetch()) {
            $item_name = $data['name'];
        }

        $results[] = array(
            'id' => $row['id'],
            'organization' => $org_name,
            'item' => $item_name
        );

        echo json_encode(["message" => "Successfull update.","data" => $results]);

    } else {

        $app->response()->setStatus(404);
        echo json_encode([
            'status'  => 404,
            'message' => "OrganizationItem ID=$id was not found in server",
        ]);
    }
};

/* ===========================================================================
DELETE ONE
=========================================================================== */

$organizationItems_delete = function ($id) use ($app, $db) {
    $app->response()->header("Content-Type", "application/json");

    $query = $db->organizationitems()->where('id', $id);
    if ($query->fetch()) {
        $result = $query->delete();
        echo json_encode(array(
            "status"  => true,
            "message" => "OrganizationItem deleted successfully",
        ));
    } else {
        $app->response()->setStatus(404);
        echo json_encode(array(
            "status"  => 404,
            "message" => "OrganizationItem id=$id does not exist",
        ));
    }
};
