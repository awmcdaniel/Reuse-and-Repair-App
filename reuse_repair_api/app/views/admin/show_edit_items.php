{% extends "admin/master.php" %}

{% block body_content %}
<div class="container">

<div class="page-header">
  <h1>{{organization}}
    <small>Items</small>
  </h1>
<button class="btn btn-primary" data-toggle="collapse" data-target="#filter_container">Filters</button>
<button class="btn btn-success" data-toggle="collapse" data-target="#container_org_items">Add New Item</button>
</div>

<div id="container_org_items" class="panel panel-default collapse bg-green">
	<input type="text" class="form-control"  id="input_org_items" name="items[]" Placeholder="Service Items">
	<p>red</p>
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
			<th>Category</th>
			<th>Item</th>
			<th>Action</th>
		</tr>
	</thead>

	<tbody>
	{% for item in results %}
		<tr id="record_{{item.record_id}}">
			<td>{{ item.category }}</td>
			<td>{{ item.description }}</td>
			<td>
				<button type="button" class="btn btn-danger org_edit delete_item" data-record-id="{{item.record_id}}">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
				</button>
			</td>
		</tr>
	{% endfor %}
	</tbody>
</table>


</div>

{% endblock %}
