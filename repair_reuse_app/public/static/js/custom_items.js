/*=====================================================================
ITEMS
=======================================================================*/

$("#btn_add_item").click(function () {

	//generate list
	get_db_itemcategories();
	create_selectlist_options("#form_container_category.form-group select", item_categories);

	$("#form_insert_items #input_description").val("");

	//change method
	$("#form_insert_items").attr("method", "POST");

	//disable the hidden id input
	$("#form_insert_items").find("input[name=id]").prop('disabled', true);
	$("#form_insert_items").find("input[name=id]").val("")

	//change action
	$("#form_insert_items").attr("action", base_url + '/api/item');
});

$(document).on('click', '.edit-item-entry', function () {

	var item_id = $(this).attr('data-record-id');

	/* GET THE DATA*/
	var item_desc = $(this).attr('data-record-desc');
	var item_cat = $("#item_category_"+item_id).html();

	/* PREFILL DATA */
	$("#modal-insert-items input[name=description]").val(item_desc);
	$("#form_container_category.form-group select").empty();

	create_selectlist_options("#form_container_category.form-group select", item_categories);
	var selected_val = get_key(item_cat, item_categories);
	if (selected_val != undefined) {
		$("#form_container_category.form-group select option[value="+selected_val+"]").prop('selected', true);
	};

	//change method
	$("#form_insert_items").attr("method", "PUT");
	$("#form_insert_items").find("input[name=id]").prop('disabled', false);
	$("#form_insert_items").find("input[name=id]").val(item_id);

	//change action
	$("#form_insert_items").attr("action", base_url + '/api/item/' + item_id);

});

$("#form_insert_items").submit(function(event) {

	//stop default event
	event.preventDefault();

	//get all the input data
	var postData = $(this).serializeArray();
	var method = $("#form_insert_items").attr("method");
	var action = $("#form_insert_items").attr("action");

	$.ajax({
			url: action,
			type: method,
			data: postData,
			dataType: "json",
			complete: function(xhr, textStatus) {
				if (xhr['status'] != 200 ) {
					var resp_obj = JSON.parse(xhr['responseText']);
					var status = resp_obj['status'];
					var message = resp_obj['message'];
					toastr.error(message, "Error Code: " + status);
				}
			},
			success: function (response) {

				var new_id = response['data']['id'];
				var item_desc = response['data']['description'];
				var cat_desc = response['data']['category']['cat_desc'];
				var cat_id = response['data']['category']['cat_id'];

				if (method == "POST") {

					var tr = document.createElement('tr');
					tr.setAttribute('id', 'record_'+new_id);
					tr.setAttribute('class', 'animated lightSpeedIn new_record filter_'+cat_id);

					var td_category = document.createElement('td');
					td_category.setAttribute('id', 'item_category_'+new_id);
					td_category.innerHTML = cat_desc;

					var td_desc = document.createElement('td');
					td_desc.setAttribute('id', 'item_desc_'+new_id);
					td_desc.innerHTML = item_desc;

					var td_action = document.createElement('td');
					td_action.setAttribute('id', 'item_action_'+new_id);

					var div_action = document.createElement('div');
					div_action.setAttribute('class', 'btn-group btn-group-xs');
					div_action.setAttribute('role', 'group');
					div_action.setAttribute('aria-label', '...');

					var btn_edit = document.createElement('button');
					btn_edit.setAttribute('class', 'btn btn-primary edit-item-entry');
					btn_edit.setAttribute('data-toggle', 'modal');
					btn_edit.setAttribute('href', '#modal-insert-items');
					btn_edit.setAttribute('data-record-id', new_id);
					btn_edit.setAttribute('data-record-desc', item_desc);

					var span_edit = document.createElement('span');
					span_edit.setAttribute('class', 'glyphicon glyphicon-pencil');
					span_edit.setAttribute('aria-hidden', 'true');

					var btn_delete = document.createElement('button');
					btn_delete.setAttribute('class', 'btn btn-danger delete-item-entry');
					btn_delete.setAttribute('data-toggle', 'modal');
					btn_delete.setAttribute('href', '#modal-delete-items');
					btn_delete.setAttribute('data-record-id', new_id);
					btn_delete.setAttribute('data-record-desc', item_desc);

					var span_delete = document.createElement('span');
					span_delete.setAttribute('class', 'glyphicon glyphicon-remove');
					span_delete.setAttribute('aria-hidden', 'true');

					btn_edit.appendChild(span_edit);
					btn_delete.appendChild(span_delete);
					div_action.appendChild(btn_edit);
					div_action.appendChild(btn_delete);
					td_action.appendChild(div_action);
					tr.appendChild(td_category);
					tr.appendChild(td_desc);
					tr.appendChild(td_action);

					var node = document.getElementById('tbody-items');
					node.insertBefore(tr, node.childNodes[0]);

				} else {

					var old_category = document.getElementById('item_category_'+new_id);
					old_category.innerHTML = cat_desc;
					var old_description = document.getElementById('item_desc_'+new_id);
					old_description.innerHTML = item_desc;

				}
			}
		})
	.done(function(response) {

		//clean up
		$("#input_description").val("");

		//close the modal
		$("#modal-insert-items").modal('hide');
	});
});


$(document).on('click', '.delete-item-entry', function(event){

	//get the id to be deleted
	var item_id = $(this).attr('data-record-id');
	$("#modal-delete-items input[name=id]").val(item_id);
	
	var item_desc =$(this).attr('data-record-desc');
	$("#modal-delete-items #item_del_item").html(item_desc);

});

$("#form_delete_items").submit(function(){

	//stop default event
	event.preventDefault();

	//get all the input data
	var item_id = $(this).find("input[name=id]").val();
	var postData = $(this).serializeArray();

	$.ajax({
			url: base_url + '/api/item/' + item_id,
			type: 'delete',
			data: postData,
			dataType: "json", 
			success: function (data) {
				setTimeout(function() {
					$("#record_"+item_id).remove();
				}, 600);
				$("#record_"+item_id).attr('class', 'animated infinite bounceOut');

			}
		})
	.done(function(data) {

		//clean up
		$("#input_description").val("");

		//close the modal
		$("#modal-delete-items").modal('hide');
	});

});
