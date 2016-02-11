<?php

/* ===========================================================================
LIST ALL
=========================================================================== */

$app->get('/api/itemorganizations', function () use ($app, $db) {
    $results = array();

    foreach ($db->items()->select('id, description, category')->order('description') as $row) {
        $organizations = $db->organizationitems()->where('item_id = ?', $row['id']);

        $org_results = array();
        foreach ($organizations as $org_row) {
            $org_name      = $db->organizations()->select('name, id as org_id')->where('id', intval($org_row['org_id']))->fetch();
            $org_results[] = $org_name;
        }

        $cat_desc = $db->itemcategories()->where('id = ?', $row['category'])->fetch();

        $results[] = array(
            'item_id'       => $row['id'],
            'item_desc'     => $row['description'],
            'item_category' => $cat_desc['description'],
            'organizations' => $org_results,
        );

    }

    $app->response()->header("Content-Type", "application/json");
    echo json_encode(["data" => $results]);
});

/* ===========================================================================
LIST ONE
=========================================================================== */

$app->get('/api/itemorganizations/:id', function ($id) use ($app, $db) {

    $app->response()->header("Content-Type", "application/json");

    $query = $db->items()->where('id', $id);
    if ($row = $query->fetch()) {

        $organizations = $db->organizationitems()->where('item_id = ?', $row['id']);

        $org_results = array();
        foreach ($organizations as $org_row) {
            $org_name      = $db->organizations()->select('name, id as org_id, zip')->where('id', intval($org_row['org_id']))->fetch();
            $org_results[] = $org_name;
        }

        $cat_desc = $db->itemcategories()->where('id = ?', $row['category'])->fetch();

        $results[] = array(
            'item_id'       => $row['id'],
            'item_desc'     => $row['description'],
            'item_category' => $cat_desc['description'],
            'organizations' => $org_results,
        );

        echo json_encode(["data" => $results]);

    } else {

        $app->response()->setStatus(404);
        echo json_encode([
            'status'  => 404,
            'message' => "Item ID=$id was not found in server",
        ]);
    }
});
