{% include 'admin/header.php' %}
{% include 'admin/modals_items.php' %}
<!-- MAIN CONTAINER
================================================================= -->
<div class="container">

<div class="page-header">
  <h1>Items
    <small>List All</small>
    <button type="button" class="btn btn btn-primary btn-lg pull-right add-org-entry" data-toggle="modal" href='#modal-insert-items'>ADD Item</button>
  </h1>
</div>

  <div class="panel panel-default">
    <div class="panel-body">
  <table class="table table-hover">
    <thead>
      <tr>
        <th>id</th>
        <th>Category</th>
        <th>Description</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
    {% for item in results %}
      <tr class="row_entry_{{ item.category }}">
        <td id="item_id_{{item.id}}" >{{ item.id }}</td>
        <td id="item_category_{{item.id}}" >{{ item.category }}</td>
        <td id="item_desc_{{item.id}}" >{{ item.description }}</td>
        <td>
      <div class="btn-group btn-group-xs" role="group" aria-label="...">
        <button type="button" class="btn btn-warning edit-item-entry" data-toggle="modal" href='#modal-insert-items'>
          <span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>
          <span class="hidden item_id">{{ item.id }}</span>
        </button>
        <button type="button" class="btn btn-danger delete-item-entry" data-toggle="modal" href='#modal-delete-items'>
          <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
        </button>
      </div>
        </td>

      </tr>
    {% endfor %}
    </tbody>

    </table>
    </div>
  </div>

</div>


{% include 'admin/footer.php' %}
