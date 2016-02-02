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

$app->get('/admin/itemcategories/items', function () use ($app, $db) {

    $temp = get_all_itemcategories($db);

    $results = array();
    foreach ($temp as $category) {
        foreach ($category['items'] as $item) {
            //$results[] = "[" . $category['description'] . "] " . $item['description'];
            $label     = "[" . $category['description'] . "] " . $item['description'];
            $results[] = array("label" => $label, "value" => $item['id']);
        }

    }

    echo json_encode($results);
});
