<?php

$app->get('/admin/items', function () use ($app, $db) {

    $results = array();
    foreach ($db->items() as $row) {

        $item_category = null;

        //get the category the item is under
        $query = $db->itemcategories->where('id', intval($row['category']));
        if ($data = $query->fetch()) {
            //$item_category = ['cat_id' => $data['id'], 'cat_desc' => $data['description']];
            $item_category = $data['description'];
        }

        $results[] = array(
            'id'          => $row['id'],
            'description' => $row['description'],
            'category'    => $item_category,
            'created_at'  => $row['created_at'],
            'updated_at'  => $row['updated_at'],
        );
    }

    $app->render('admin/show_items.php', [
        'results' => $results,
    ]);
});
