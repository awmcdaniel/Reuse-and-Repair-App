{% extends "admin/master.php" %}

{% block body_content %}


{% include 'admin/modals_itemcategories.php' %}

<!-- MAIN CONTAINER
================================================================= -->
<div class="container">

<div class="page-header">
  <h1>Item Category
    <small>List All</small>
    <button type="button" class="btn btn btn-primary btn-lg pull-right add-org-entry"
            data-toggle="modal" href='#modal-insert-itemcategories' id="btn_add_category">ADD Category</button>
  </h1>
</div>


  <div class="panel panel-default">
    <div class="panel-body">
  <table class="table table-hover" id="table-itemcategories">
    <thead>
      <tr>
        <th>Description</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody id="tbody-itemcategories">
    {% for item in results %}
      <tr id="record_{{item.id}}">
        <td id="itemcat_desc_{{item.id}}">{{ item.description }}</td>
        <td id="itemcat_action_{{item.id}}">
      <div class="btn-group btn-group-xs" role="group" aria-label="...">
        <button class="btn btn-primary edit-itemcat-entry" data-toggle="modal" href='#modal-insert-itemcategories' data-record-id="{{item.id}}">
          <span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>
        </button>

        <button class="btn btn-danger delete-itemcat-entry" data-toggle="modal" href='#modal-delete-itemcategories' data-record-id="{{item.id}}" data-record-desc="{{ item.description }}">
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

{% endblock %}
