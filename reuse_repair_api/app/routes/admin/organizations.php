<?php

/* ===========================================================================
LIST ALL
=========================================================================== */
$app->get('/admin/organizations', function () use ($app, $db) {
    $results = array();
    foreach ($db->organizations()->order('name') as $row) {

        $org_type = null;
        $query    = $db->organizationtype->where('id', intval($row['org_type']));
        if ($data = $query->fetch()) {
            $org_type = $data['description'];
        }

        $service_items = $db->organizationitems->select('item_id')->where('org_id', intval($row['id']));
        $items         = array();
        foreach ($service_items as $key => $value) {
            $items[] = $db->items->select('description')->where('id', $value['item_id'])->order('description')->fetch()['description'];
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

    $app->render('admin/show_organizations.php', [
        'results' => $results,
    ]);

})->name('organizations.showall');

$app->get('/admin/organizations/:org_id', function ($org_id) use ($app, $db) {
    $results  = array();
    $filters  = array();
    $org_name = $db->organizations()->where('id=?', $org_id)->fetch()['name'];

    foreach ($db->organizationitems()->where('org_id=?', $org_id) as $row) {

        $item = $db->items()
            ->where('id=?', $row['item_id'])
            ->fetch();

        $category = $db->itemcategories()
            ->where('id=?', $item['category'])
            ->fetch()['description'];

        if (!array_key_exists($item['category'], $filters)) {
            $filters[$item['category']] = array(
                'description' => $category,
                'count'       => 1,
            );
        } else {
            $count                               = $filters[$item['category']]['count'];
            $filters[$item['category']]['count'] = intval($count + 1);
        }

        $results[] = array(
            'record_id'   => $row['id'], //the id in organizationitems table (for easy deletion)
            'item_id'     => $item['id'], //the item_id
            'description' => $item['description'],
            'category_id' => $item['category'],
            'category'    => $category,
            'created_at'  => $item['created_at'],
            'updated_at'  => $item['updated_at'],
        );
    }

    $app->render('admin/show_edit_items.php', [
        'results'      => $results,
        'filters'      => $filters,
        'organization' => $org_name,
        'org_id'       => $org_id,

    ]);

})->name('organizations.showitems');

/* ===========================================================================
Add/Update multiple items to organization entity
=========================================================================== */

$app->post('/admin/organizations/items', function () use ($app, $db) {

    $org_id    = $app->request()->post('id');
    $items_arr = $app->request()->post('items');

    $app->response()->header("Content-Type", "application/json");

    //check if organization exist
    $query = $db->organizations()->where('id', intval($org_id));
    if (!$query->fetch()) {
        $app->response()->setStatus(404);
        echo json_encode(array(
            "status"  => 404,
            "message" => "Organization id=$org_id does not exist",
        ));
        die();
    }

    //keep track of changes
    $already_exist = array();
    $new_items     = array();
    $not_processed = array();
    $deleted_items = array();

    //delete all items in the database that are not in the request
    $all_items = $db->organizationitems()->where('org_id=?', intval($org_id));
    foreach ($all_items as $row) {
        if (!in_array($row['item_id'], $items_arr)) {
            $deleted_items[] = $row['item_id'];
            $row->delete();
        }
    }

    //add all items remaining
    foreach ($items_arr as $item_id) {
        $query = $db->organizationitems()->where('item_id=? AND org_id=?', intval($item_id), intval($org_id));
        if ($data = $query->fetch()) {
            $already_exist[] = $item_id;
        } else {
            $insert_id = $db->organizationitems()->insert(array("org_id" => $org_id, "item_id" => $item_id));
            if ($insert_id) {
                $new_items[] = $item_id;
            } else {
                $not_processed[] = $item_id;
            }

        }

    }

    echo json_encode(array(
        "status"       => 200,
        "added"        => $new_items,
        "untouched"    => $already_exist,
        "error_adding" => $not_processed,
        "deleted"      => $deleted_items,
    ));

});
