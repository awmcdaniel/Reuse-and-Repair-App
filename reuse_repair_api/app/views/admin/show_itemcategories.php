{% include 'admin/header.php' %}
{% include 'admin/modals_itemcategories.php' %}

<!-- MAIN CONTAINER
================================================================= -->
<div class="container">

<div class="page-header">
  <h1>Item Category
    <small>List All</small>
    <button type="button" class="btn btn btn-primary btn-lg pull-right add-org-entry" data-toggle="modal" href='#modal-insert-itemcategories'>ADD Category</button>
  </h1>
</div>


  <div class="panel panel-default">
    <div class="panel-body">
  <table class="table table-hover">
    <thead>
      <tr>
        <th>id</th>
        <th>Description</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
    {% for item in results %}
      <tr >
        <td id="itemcat_id_{{item.id}}" class="row_itemcat_id ">{{ item.id }}</td>
        <td id="itemcat_desc_{{item.id}}" class="row_itemcat_desc ">{{ item.description }}</td>
        <td>
      <div class="btn-group btn-group-xs" role="group" aria-label="...">
        <button type="button" class="btn btn-warning edit-itemcat-entry" data-toggle="modal" href='#modal-insert-itemcategories'>
          <span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>
          <span class="hidden itemcat_id">{{ item.id }}</span>
        </button>
        <button type="button" class="btn btn-danger delete-itemcat-entry" data-toggle="modal" href='#modal-delete-itemcategories'>
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
