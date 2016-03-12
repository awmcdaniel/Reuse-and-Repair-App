<?php

$app->get('/admin/items', $authenticated_user(), function () use ($app, $db) {

    $results = array();
    $filters = array();

    foreach ($db->items() as $row) {

        $cat_desc = null;
        $cat_id   = null;

        //get the category the item is under
        $query = $db->itemcategories()->where('id', intval($row['category']));
        if ($data = $query->fetch()) {
            $cat_desc = $data['description'];
            $cat_id   = $data['id'];

            //update filter list
            if (!array_key_exists($row['category'], $filters)) {
                $filters[$row['category']] = array(
                    'description' => $cat_desc,
                    'count'       => 1,
                );
            } else {
                $count                              = $filters[$row['category']]['count'];
                $filters[$row['category']]['count'] = intval($count + 1);
            }

        }

        $results[] = array(
            'id'          => $row['id'],
            'description' => $row['description'],
            'category'    => $cat_desc,
            'category_id' => $cat_id,
            'created_at'  => $row['created_at'],
            'updated_at'  => $row['updated_at'],
        );
    }

    $app->render('admin/show_items.php', [
        'results' => $results,
        'filters' => $filters,
    ]);
});
