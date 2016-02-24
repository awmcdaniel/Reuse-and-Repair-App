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
            'org_name'  => utf8_encode($org_name),
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

$app->get('/api/organizationhours/:id', function ($id) use ($app, $db) {

    $app->response()->header("Content-Type", "application/json");

    $query = $db->organizationhours()->where('org_id', $id);
    if ($row = $query->fetch()) {

        //get the name
        $query = $db->organizations->where('id', intval($row['org_id']));
        if ($data = $query->fetch()) {
            $org_name = $data['name'];
        }

        $result[] = array(
            'org_name'  => utf8_encode($org_name),
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

/* ===========================================================================
UPDATE ONE
=========================================================================== */

$app->put('/api/organizationhours/:id', function ($id) use ($app, $db) {

    $app->response()->header("Content-Type", "application/json");
    $err_msg = array();

    $query = $db->organizationhours->where("org_id = ?", intval($id))->limit(1);
    if ($row = $query->fetch()) {
        $request = $app->request()->put();

        $postData = array(
            'mon_start' => $request['mon_start'],
            'mon_end'   => $request['mon_end'],
            'tue_start' => $request['tue_start'],
            'tue_end'   => $request['tue_end'],
            'wed_start' => $request['wed_start'],
            'wed_end'   => $request['wed_end'],
            'thu_start' => $request['thu_start'],
            'thu_end'   => $request['thu_end'],
            'fri_start' => $request['fri_start'],
            'fri_end'   => $request['fri_end'],
            'sat_start' => $request['sat_start'],
            'sat_end'   => $request['sat_end'],
            'sun_start' => $request['sun_start'],
            'sun_end'   => $request['sun_end'],
        );

        //validate the data
        $time_pattern = "/^([01]?[0-9]|2[0-3])\:+[0-5][0-9](:[0-5][0-9])?$/";
        foreach ($postData as $key => $value) {

            if (isset($postData[$key]) && $postData[$key] != "") {
                $check = preg_match($time_pattern, $postData[$key]);
                if (!$check) {
                    $err_msg[] = "$key:$value is invalid. Expected value is HH:MM:SS";
                }
            } else if ($postData[$key] == "") {
                $postData[$key] = null;
            } else {
                unset($postData[$key]); //was not passed in the request
            }
        }

        //return if errors found
        if (!empty($err_msg)) {
            $app->response()->setStatus(400);
            echo json_encode([
                "status"  => "400",
                "message" => $err_msg,
                "data"    => $postData,
            ]);
            die();
        }

        $result = $query->update($postData);
        echo json_encode([
            "status"  => "200",
            "message" => "Successfull insertion to DB.",
            "data"    => $postData,
            "request" => $request,
        ]);

    } else {

        $app->response()->setStatus(404);
        echo json_encode([
            'status'  => 404,
            'message' => "Item ID=$id was not found in server",
        ]);
    }

});
