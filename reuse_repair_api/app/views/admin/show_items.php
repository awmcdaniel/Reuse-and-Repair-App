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
  <button class="btn btn-warning" data-toggle="collapse" data-target="#filter_container">
    <i class="fa fa-filter"></i> Filters
  </button>
  </h1>

</div>

<div class="panel panel-default collapse bg-gray" id="filter_container">
{% if filters is defined %}
  <div class="panel-body">
  {% for key, value in filters %}
    <label class="checkbox-inline" for="cb_{{key}}">
    <input type="checkbox" value="{{key}}" class="filter_cb" id="cb_{{key}}" checked>

      {{ value.description }} <span class="badge">{{value.count}}</span>
    </label>
  {% endfor %}
  </div>
{% endif %}
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
      <tr class="row_{{item.category_id}}" id="record_{{item.id}}">
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
