{% extends "admin/master.php" %}

{% block body_content %}


{% include 'admin/modals_itemcategories.php' %}

<!-- MAIN CONTAINER
================================================================= -->
<div class="container">

<div class="page-header">
  <h1>ITEM CATEGORY

    <button type="button" class="btn btn-primary add-org-entry" data-toggle="modal" href='#modal-insert-itemcategories' id="btn_add_category">
            <i class="fa fa-plus-circle"></i> New Record
    </button>

  </h1>

</div>


  <table class="table table-hover" id="table-itemcategories">
    <thead>
      <tr>
        <th>Description</th>
        <th></th>
      </tr>
    </thead>
    <tbody id="tbody-itemcategories">
    {% for item in results %}
      <tr id="record_{{item.id}}">
        <td class="col-md-11" id="itemcat_desc_{{item.id}}">{{ item.description }}</td>
        <td class="col-md-1" id="itemcat_action_{{item.id}}">
          <div class="btn-group btn-group-xs" role="group" aria-label="...">
            <button class="btn btn-primary edit-itemcat-entry bg-gray-dark1" data-toggle="modal" href='#modal-insert-itemcategories' data-record-id="{{item.id}}">
              <span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>
            </button>

            <button class="btn btn-danger delete-itemcat-entry bg-gray-dark2" data-toggle="modal" href='#modal-delete-itemcategories' data-record-id="{{item.id}}" data-record-desc="{{ item.description }}">
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
