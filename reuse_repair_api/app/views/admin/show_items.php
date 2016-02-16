{% extends "admin/master.php" %}

{% block body_content %}


{% include 'admin/modals_items.php' %}
<!-- MAIN CONTAINER
================================================================= -->
<div class="container">

<div class="page-header">
  <h1>ITEMS
    <button type="button" class="btn btn btn-primary add-org-entry"
            data-toggle="modal" href='#modal-insert-items' id="btn_add_item">
            <i class="fa fa-plus-circle"></i> New Record</button>
  </h1>

</div>


  <table class="table table-hover">
    <thead>
      <tr>
        <th>Category</th>
        <th>Description</th>
        <th></th>
      </tr>
    </thead>
    <tbody id="tbody-items">
    {% for item in results %}
      <tr class="filter_{{item.category_id}}" id="record_{{item.id}}">
        <td class="col-md-4" id="item_category_{{item.id}}" >{{ item.category }}</td>
        <td class="col-md-7" id="item_desc_{{item.id}}" >{{ item.description }}</td>
        <td class="col-md-1" id="item_action_{{item.id}}">
          <div class="btn-group btn-group-xs" role="group" aria-label="...">
            <button class="btn btn-primary edit-item-entry bg-gray-dark1" data-toggle="modal" href='#modal-insert-items' data-record-id="{{item.id}}" data-record-desc="{{item.description}}">
              <span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>
            </button>
            <button class="btn btn-danger delete-item-entry bg-gray-dark2" data-toggle="modal" href='#modal-delete-items' data-record-id="{{item.id}}" data-record-desc="{{item.description}}">
              <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
            </button>
          </div>
        </td>

      </tr>
    {% endfor %}
    </tbody>

    </table>

</div>

{% endblock %}
