<?php

function get_all_itemcategories($db)
{
    $results = array();

    foreach ($db->itemcategories() as $row) {

        //get the items associated with this category
        $item_list = array();
        $items     = $db->items->select('id', 'description')->where('category', $row['id']);
        foreach ($items as $key => $value) {
            $item_list[] = $value;
        }

        $results[] = array(
            'id'          => $row['id'],
            'description' => $row['description'],
            'items'       => $item_list,
        );
    }

    return $results;
};

$app->get('/admin/itemcategories', function () use ($app, $db) {

    $app->render('admin/show_itemcategories.php', [
        'results' => get_all_itemcategories($db),
    ]);

});
