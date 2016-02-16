{% extends "admin/master.php" %}

{% block body_content %}
<div class="container" id="body-edit-items">

<div class="page-header">
  <h1>{{organization}}
    <small>Items</small>
  </h1>
<button class="btn btn-primary" data-toggle="collapse" data-target="#filter_container">Filters</button>
<button class="btn btn-success" data-toggle="collapse" data-target="#container_form_orgitems">Add New Item</button>
</div>

<div id="container_form_orgitems" class="panel panel-default collapse bg-gray">
	<div id="container_org_items" >
		<form method="POST" id="form_insert_organizationitem">
		<input type="text" id="input_org_id" name="id" class="hidden" value="{{org_id}}">
     	<input type="text" class="form-control"  id="input_org_items" name="items[]" Placeholder="Service Items">
      	<button type="submit" class="btn" id="btn_org_add_item">Add Item(s)</button>
		</form>
	</div>
</div>



<div class="panel panel-default collapse bg-blue" id="filter_container">
{% if filters is defined %}
  <div class="panel-body">
  {% for key, value in filters %}
    <label class="checkbox-inline"><input type="checkbox" value="{{key}}" checked>{{ value.description }}
    <span class="badge">{{value.count}}</span></label>
  {% endfor %}
  </div>
{% endif %}
</div>




<table class="table table-hover">
	<thead>
		<tr>
			<th class="col-md-4">Category</th>
			<th class="col-md-6">Item</th>
			<th class="col-md-2">Action</th>
		</tr>
	</thead>

	<tbody id="tbody-org-items">
	{% for item in results %}
		<tr id="record_{{item.record_id}}">
			<td class="col-md-4">{{ item.category }}</td>
			<td class="col-md-6">{{ item.description }}</td>
			<td class="col-md-2">
				<button class="btn btn-danger org_edit delete_item" data-record-id="{{item.record_id}}">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
				</button>
			</td>
		</tr>
	{% endfor %}
	</tbody>
</table>


</div>

{% endblock %}
