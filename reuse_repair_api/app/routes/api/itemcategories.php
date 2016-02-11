<?php

/* ===========================================================================
LIST ALL
=========================================================================== */

$app->get('/api/itemcategories', function () use ($app, $db) {
    $results = array();

    foreach ($db->itemcategories()->order('description') as $row) {

        //get the items associated with this category
        $item_list = array();
        $items     = $db->items()
            ->select('id, description')
            ->where('category = ?', $row['id'])
            ->order('description');

        foreach ($items as $key => $value) {
            $item_list[] = $value;
        }

        $results[] = array(
            'id'          => $row['id'],
            'description' => $row['description'],
            'items'       => $item_list,
        );
    }

    $app->response()->header("Content-Type", "application/json");
    echo json_encode(["data" => $results]);
});

/* ===========================================================================
LIST ONE
=========================================================================== */

$app->get('/api/itemcategory/:id', function ($id) use ($app, $db) {
    $app->response()->header("Content-Type", "application/json");

    $query = $db->itemcategories()->where('id', $id)->order('description');
    if ($row = $query->fetch()) {

        //get the items associated with this category
        $item_list = array();
        $items     = $db->items->select('id', 'description')->where('category', $row['id'])->order('description');
        foreach ($items as $key => $value) {
            $item_list[] = $value;
        }

        $results = array(
            'id'          => $row['id'],
            'description' => $row['description'],
            'items'       => $item_list,
        );

        echo json_encode(["data" => $results]);

    } else {

        $app->response()->setStatus(404);
        echo json_encode([
            'status'  => 404,
            'message' => "ItemCategory ID=$id was not found in server",
        ]);
    }
});

/* ===========================================================================
INSERT ONE
=========================================================================== */

$app->post('/api/itemcategory', function () use ($app, $db) {
    $app->response()->header("Content-Type", "application/json");

    //check if data already exist
    $description = $app->request()->post('description');

    $query = $db->itemcategories()->where('description', $description);
    if ($data = $query->fetch()) {
        $app->response()->setStatus(409);
        $id = $data['id'];
        echo json_encode(array(
            'status'  => 409,
            'message' => "ItemCategory with same description already exist in DB. See /itemcategory/$id",
        ));
    } else {

        //no duplicate found
        $post_data = $app->request()->post();
        $result    = $db->itemcategories->insert($post_data); //returns the index
        $query     = $db->itemcategories()->where('id', $result);
        if ($row = $query->fetch()) {

            $results = array(
                'id'          => $row['id'],
                'description' => $row['description'],
            );

            echo json_encode(["data" => $results]);

        } else {

            $app->response()->setStatus(500);
            echo json_encode([
                'status'  => 500,
                'message' => "Error. Could not find item category recently added. ",
            ]);
        }
    }

});

/* ===========================================================================
UPDATE ONE
=========================================================================== */

$app->put('/api/itemcategory/:id', function ($id) use ($app, $db) {
    $app->response()->header("Content-Type", "application/json");

    $query = $db->itemcategories()->where("id", intval($id));

    if ($row = $query->fetch()) {

        $post_data = $app->request()->put();
        $result    = $query->update($post_data); //returns true/false

        $row     = $db->itemcategories()->where("id", intval($id))->fetch();
        $results = array(
            'id'          => $row['id'],
            'description' => $row['description'],
        );

        echo json_encode(["message" => "Successfull insertion to DB.", "data" => $results]);

    } else {

        $app->response()->setStatus(404);
        echo json_encode([
            'status'  => 404,
            'message' => "Item category ID=$id was not found in server",
        ]);
    }
});

/* ===========================================================================
DELETE ONE
=========================================================================== */

$app->delete('/api/itemcategory/:id', function ($id) use ($app, $db) {
    $app->response()->header("Content-Type", "application/json");

    $query = $db->itemcategories()->where('id', $id);
    if ($query->fetch()) {
        $result = $query->delete();
        echo json_encode(array(
            "status"  => true,
            "message" => "Item category deleted successfully",
        ));
    } else {
        $app->response()->setStatus(404);
        echo json_encode(array(
            "status"  => 404,
            "message" => "Item category id $id does not exist",
        ));
    }
});
