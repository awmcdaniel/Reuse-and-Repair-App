<?php

$app->get('/admin/items', function () use ($app, $db) {

    $results = array();
    foreach ($db->items() as $row) {

        $cat_desc = null;
        $cat_id   = null;

        //get the category the item is under
        $query = $db->itemcategories()->where('id', intval($row['category']));
        if ($data = $query->fetch()) {
            $cat_desc = $data['description'];
            $cat_id   = $data['id'];
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
    ]);
});
