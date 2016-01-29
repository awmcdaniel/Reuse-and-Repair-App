<?php

/* ===========================================================================
LIST ALL
=========================================================================== */
$app->get('/api/organizationhours', function () use ($app, $db) {
    $result = array();

    foreach ($db->organizationhours() as $row) {

        //get the name
        $query = $db->organizations->where('id', intval($row['org_id']));
        if ($data = $query->fetch()) {
            $org_name = $data['name'];
        }

        $result[] = array(
            'org_name'  => $org_name,
            'org_id'    => $row['org_id'],
            'mon_start' => $row['mon_start'],
            'mon_end'   => $row['mon_end'],
            'tue_start' => $row['tue_start'],
            'tue_end'   => $row['tue_end'],
            'wed_start' => $row['wed_start'],
            'wed_end'   => $row['wed_end'],
            'thu_start' => $row['thu_start'],
            'thu_end'   => $row['thu_end'],
            'fri_start' => $row['fri_start'],
            'fri_end'   => $row['fri_end'],
            'sat_start' => $row['sat_start'],
            'sat_end'   => $row['sat_end'],
            'sun_start' => $row['sun_start'],
            'sun_end'   => $row['sun_end'],
        );
    }

    $app->response()->header("Content-Type", "application/json");
    echo json_encode(["data" => $result]);
});

/* ===========================================================================
LIST ONE
=========================================================================== */

$app->get('/api/organizationhour/:id', function ($id) use ($app, $db) {

    $app->response()->header("Content-Type", "application/json");

    $query = $db->organizationhours()->where('org_id', $id);
    if ($row = $query->fetch()) {

        //get the name
        $query = $db->organizations->where('id', intval($row['org_id']));
        if ($data = $query->fetch()) {
            $org_name = $data['name'];
        }

        $result[] = array(
            'org_name'  => $org_name,
            'org_id'    => $row['org_id'],
            'mon_start' => $row['mon_start'],
            'mon_end'   => $row['mon_end'],
            'tue_start' => $row['tue_start'],
            'tue_end'   => $row['tue_end'],
            'wed_start' => $row['wed_start'],
            'wed_end'   => $row['wed_end'],
            'thu_start' => $row['thu_start'],
            'thu_end'   => $row['thu_end'],
            'fri_start' => $row['fri_start'],
            'fri_end'   => $row['fri_end'],
            'sat_start' => $row['sat_start'],
            'sat_end'   => $row['sat_end'],
            'sun_start' => $row['sun_start'],
            'sun_end'   => $row['sun_end'],
        );

        echo json_encode(["data" => $result]);

    } else {

        $app->response()->setStatus(404);
        echo json_encode([
            'status'  => 404,
            'message' => "OrganizationItem ID=$id was not found in server",
        ]);
    }
});
