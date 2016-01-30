<?php

function get_all_itemcategories($db)
{
    $results = array();

    foreach ($db->itemcategories() as $row) {
        $results[] = array(
            'id'          => $row['id'],
            'description' => $row['description'],
        );
    }

    return $results;
};

function get_one_itemcategory($db, $id)
{
    $query = $db->itemcategories()->where('id', $id);
    if ($row = $query->fetch()) {

        $results = array(
            'id'          => $row['id'],
            'description' => $row['description'],
        );

        return $results;

    } else {

        return false;
    }
}

$app->get('/admin/itemcategories', function () use ($app, $db) {

    $app->render('admin/show_itemcategories.php', [
        'results' => get_all_itemcategories($db),
    ]);

});

$app->get('/admin/itemcategories/:id', function ($id) use ($app, $db) {

    $results = get_one_itemcategory($db, $id);
    if (!$results) {
        $app->notFound();
    }

    $app->render('admin/show_itemcategory.php', [
        'results' => $results,
    ]);

});

$app->get('/admin/add_itemcategories', function () use ($app, $db) {

    $app->render('admin/add_itemcategories.php', [
        'results' => get_all_itemcategories($db),
    ]);

});
