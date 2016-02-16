/*=====================================================================
ITEM CATEGORY
=======================================================================*/

$(document).on('click', '.edit-itemcat-entry', function () {
	var itemcat_id = $(this).attr('data-record-id');

	/* GET THE DATA*/
	itemcat_desc = $("#itemcat_desc_"+itemcat_id).html();

	/* PREFILL DATA */
	$("#modal-insert-itemcategories input[name=description]").val(itemcat_desc);

	//change method
	$("#form_insert_itemcategories").attr("method", "PUT");
	$("#form_insert_itemcategories").find("input[name=id]").prop('disabled', false);
	$("#form_insert_itemcategories").find("input[name=id]").val(itemcat_id);

	//change action
	$("#form_insert_itemcategories").attr("action", base_url + '/api/itemcategory/' + itemcat_id);
});


$("#btn_add_category").click(function () {
	$("#form_insert_itemcategories #input_description").val("");

	//change method
	$("#form_insert_itemcategories").attr("method", "POST");

	//disable the hidden id input
	$("#form_insert_itemcategories").find("input[name=id]").prop('disabled', true);
	$("#form_insert_itemcategories").find("input[name=id]").val("")

	//change action
	$("#form_insert_itemcategories").attr("action", base_url + '/api/itemcategory');
});

$("#form_insert_itemcategories").submit(function(event) {

	//stop default event
	event.preventDefault();

	//get all the input data
	var postData = $(this).serializeArray();
	var method = $("#form_insert_itemcategories").attr("method");
	var action = $("#form_insert_itemcategories").attr("action");
	console.log(postData);

	$.ajax({
			url: action,
			type: method,
			data: postData,
			dataType: "json", 
			success: function (response) {
				var new_id = response['data']['id'];
				var new_desc = response['data']['description'];
				
				if (method === "POST") {
					var tr = document.createElement('tr');
					tr.setAttribute('id', 'record_'+new_id);
					tr.setAttribute('class', 'new_record');

					var td_desc = document.createElement('td');
					td_desc.setAttribute('id', 'itemcat_desc_'+new_id);
					td_desc.innerHTML = new_desc;

					var td_action = document.createElement('td');
					td_action.setAttribute('id', 'itemcat_action_'+new_id);

					var div_action = document.createElement('div');
					div_action.setAttribute('class', 'btn-group btn-group-xs');
					div_action.setAttribute('role', 'group');
					div_action.setAttribute('aria-label', '...');

					var btn_edit = document.createElement('button');
					btn_edit.setAttribute('class', 'btn btn-warning edit-itemcat-entry');
					btn_edit.setAttribute('data-toggle', 'modal');
					btn_edit.setAttribute('href', '#modal-insert-itemcategories');
					btn_edit.setAttribute('data-record-id', new_id);

					var span_edit = document.createElement('span');
					span_edit.setAttribute('class', 'glyphicon glyphicon-pencil');
					span_edit.setAttribute('aria-hidden', 'true');

					var btn_delete = document.createElement('button');
					btn_delete.setAttribute('class', 'btn btn-danger delete-itemcat-entry');
					btn_delete.setAttribute('data-toggle', 'modal');
					btn_delete.setAttribute('href', '#modal-delete-itemcategories');
					btn_delete.setAttribute('data-record-id', new_id);
					btn_delete.setAttribute('data-record-desc', new_desc);

					var span_delete = document.createElement('span');
					span_delete.setAttribute('class', 'glyphicon glyphicon-remove');
					span_delete.setAttribute('aria-hidden', 'true');


					btn_edit.appendChild(span_edit);
					btn_delete.appendChild(span_delete);
					div_action.appendChild(btn_edit);
					div_action.appendChild(btn_delete);
					td_action.appendChild(div_action);
					tr.appendChild(td_desc);
					tr.appendChild(td_action);

					var node = document.getElementById('tbody-itemcategories');
					node.insertBefore(tr, node.childNodes[0]);

				} else {
					var node = document.getElementById('itemcat_desc_'+new_id);
					node.innerHTML = new_desc;
				}
				
			}
		})
	.done(function(response) {

		//clean up
		$("#input_description").val("");

		//close the modal
		$("#modal-insert-itemcategories").modal('hide');
	});
});


$(document).on('click', '.delete-itemcat-entry', function(event){

	//get the id to be deleted
	var itemcat_id = $(this).attr('data-record-id');
	$("#modal-delete-itemcategories input[name=id]").val(itemcat_id);
	
	var item_desc = $(this).attr('data-record-desc');
	$("#modal-delete-itemcategories #itemcat_del_item").html(item_desc);
	console.log(item_desc);

});

$("#form_delete_itemcategories").submit(function(){

	//stop default event
	event.preventDefault();

	//get all the input data
	var itemcat_id = $(this).find("input[name=id]").val();

	$.ajax({
			url: base_url + '/api/itemcategory/' + itemcat_id,
			type: 'delete',
			dataType: "json", 
			success: function (data) {
				$("#record_"+itemcat_id).remove();
			}
		})
	.done(function(data) {

		//clean up
		$("#input_description").val("");

		//close the modal
		$("#modal-delete-itemcategories").modal('hide');
	});

});

