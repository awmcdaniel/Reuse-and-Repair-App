<?php

/* ===========================================================================
LIST ALL ORGS THAT ACCEPT A PARTICULAR ITEM (ITEM_ID IN THE URL)
=========================================================================== */
$app->get('/web/organizations/:item_id', $authenticated_user(), function ($item_id) use ($app, $db) {
    $results = array();

    foreach ($db->organizationitems->where('item_id', $item_id) as $item_row) {
       $org_row = $db->organizations->where('id', $item_row['org_id'])->fetch();

        $org_type = null;
        $query    = $db->organizationtype->where('id', intval($org_row['org_type']));
        if ($data = $query->fetch()) {
            $org_type = $data['description'];
        }
       
       $results[] = array(
            'id'            => $org_row['id'],
            'name'          => utf8_encode($org_row['name']),
            'org_type'      => $org_type,
            'street_1'      => $org_row['street1'],
            'street_2'      => $org_row['street2'],
            'city'          => $org_row['city'],
            'state'         => $org_row['state'],
            'zip_code'      => $org_row['zip'],
            'webpage'       => $org_row['webpage'],
            'phone'         => $org_row['phone'],
            'notes'         => $org_row['notes'],
       );
    }

    $app->render('web/organizations.php', [
        'results' => $results,
    ]);

});