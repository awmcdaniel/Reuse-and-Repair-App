<?php

/* ===========================================================================
LIST ALL
=========================================================================== */
$app->get('/admin/organizations', $authenticated_user(), function () use ($app, $db) {
    $results = array();
    $filters = array();
    foreach ($db->organizations()->order('name') as $row) {

        $org_type = null;
        $org_id   = null;
        $query    = $db->organizationtype->where('id', intval($row['org_type']));
        if ($data = $query->fetch()) {
            $org_id   = $data['id'];
            $org_type = $data['description'];
        }

        // update filter
        if (!array_key_exists($org_id, $filters)) {
            $filters[$org_id] = array(
                'description' => $org_type,
                'count'       => 1,
            );
        } else {
            $count                     = $filters[$org_id]['count'];
            $filters[$org_id]['count'] = intval($count + 1);
        }

        //get descriptions
        $service_items = $db->organizationitems->select('item_id')->where('org_id', intval($row['id']));
        $items         = array();
        foreach ($service_items as $key => $value) {
            $items[] = $db->items->select('description')->where('id', $value['item_id'])->order('description')->fetch()['description'];
        }

        $results[] = array(
            'id'            => $row['id'],
            'name'          => utf8_encode($row['name']),
            'org_type'      => $org_type,
            'org_id'        => $org_id,
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
        'filters' => $filters,
    ]);

})->name('organizations.showall');

$app->get('/admin/organizations/:org_id', $authenticated_user(), function ($org_id) use ($app, $db) {
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

$app->post('/admin/organizations/items', $authenticated_user(), function () use ($app, $db) {

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
    $temp          = array();

    //add all items remaining
    foreach ($items_arr as $item_id) {
        $temp[] = $item_id;
        $query  = $db->organizationitems()->where('item_id=? AND org_id=?', intval($item_id), intval($org_id));
        if ($data = $query->fetch()) {
            $already_exist[] = $item_id;
        } else {
            $insert_obj = $db->organizationitems()->insert(array("org_id" => $org_id, "item_id" => $item_id));
            if ($insert_obj) {
                $temp_item = $db->items()->select('id, description, category')->where('id=?', $item_id)->fetch();
                $category  = $db->itemcategories()->where('id=?', $temp_item['category'])->fetch()['description'];

                $new_items[] = array(
                    'record_id'     => $insert_obj['id'], // organizationitems id
                    'item_id'       => $temp_item['id'], // items id
                    'item_desc'     => $temp_item['description'],
                    'category_id'   => $temp_item['category'], // the category which this item falls under
                    'category_desc' => $category,
                );
            } else {
                $not_processed[] = $item_id;
            }

        }

    }

    echo json_encode(array(
        "status"        => 200,
        "added"         => $new_items,
        "already_exist" => $already_exist,
        "error_adding"  => $not_processed,
        "orig"          => $temp,
    ));

});
