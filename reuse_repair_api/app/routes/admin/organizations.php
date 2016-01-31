<?php

/* ===========================================================================
LIST ALL
=========================================================================== */
$app->get('/admin/organizations', function () use ($app, $db) {
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
            'name'          => $row['name'],
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
