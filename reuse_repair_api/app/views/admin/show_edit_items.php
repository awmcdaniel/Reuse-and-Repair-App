{% extends "admin/master.php" %}

{% block body_content %}
<div class="container" id="body-edit-items">

<div class="page-header">
  <h1>{{organization}}
    <small>Items</small>
	<button class="btn btn-primary" data-toggle="collapse" data-target="#container_form_orgitems">
		<i class="fa fa-plus-circle"></i> New Record
	</button>
	<button class="btn btn-warning" data-toggle="collapse" data-target="#filter_container">
		<i class="fa fa-filter"></i> Filters
	</button>
  </h1>

</div>

<div id="container_form_orgitems" class="panel panel-default collapse bg-gray">
	<div id="container_org_items" >
		<form method="POST" id="form_insert_organizationitem">
		<input type="text" id="input_org_id" name="id" class="hidden" value="{{org_id}}">
     	<input type="text" class="form-control"  id="input_org_items" name="items[]" Placeholder="Service Items">
      	<button type="submit" class="btn btn-primary" id="btn_org_add_item">Add Item(s)</button>
		</form>
	</div>
</div>



<div class="panel panel-default collapse bg-gray" id="filter_container">
{% if filters is defined %}
  <div class="panel-body">
  {% for key, value in filters %}
  	<label class="checkbox-inline" for="cb_{{key}}">
    <input type="checkbox" value="{{key}}" id="cb_{{key}}" checked>

    	{{ value.description }} <span class="badge">{{value.count}}</span>
    </label>
  {% endfor %}
  </div>
{% endif %}
</div>




<table class="table table-hover">
	<thead>
		<tr>
			<th class="col-md-4">Category</th>
			<th class="col-md-7">Item</th>
			<th class="col-md-1"></th>
		</tr>
	</thead>

	<tbody id="tbody-org-items">
	{% for item in results %}
		<tr id="record_{{item.record_id}}">
			<td class="col-md-4">{{ item.category }}</td>
			<td class="col-md-7">{{ item.description }}</td>
			<td class="col-md-1">
				<button class="btn btn-danger org_edit delete_item bg-gray-dark2" data-record-id="{{item.record_id}}">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
				</button>
			</td>
		</tr>
	{% endfor %}
	</tbody>
</table>


</div>

{% endblock %}

{% block other_js %}
<script type="text/javascript">

</script>
{% endblock %}


