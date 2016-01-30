<?php

/* ===========================================================================
LIST ALL
=========================================================================== */
$app->get('/admin/organizations', function () use ($app, $db) {
    $results = array();
    foreach ($db->organizations() as $row) {

        $org_type = null;

        $query = $db->organizationtype->where('id', intval($row['org_type']));
        if ($data = $query->fetch()) {
            $org_type = $data['description'];
        }

        $results[] = array(
            'id'       => $row['id'],
            'name'     => $row['name'],
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
    }

    $app->render('admin/show_organizations.php', [
        'results' => $results,
    ]);

})->name('organizations.showall');
