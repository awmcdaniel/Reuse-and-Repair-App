/*=====================================================================
ITEMS
=======================================================================*/

$("#btn_add_item").click(function () {
	$("#form_insert_items #input_description").val("");

	//change method
	$("#form_insert_items").attr("method", "POST");

	//disable the hidden id input
	$("#form_insert_items").find("input[name=id]").prop('disabled', true);
	$("#form_insert_items").find("input[name=id]").val("")

	//change action
	$("#form_insert_items").attr("action", base_url + '/api/item');
});

$(".edit-item-entry").click(function () {
	item_id = $(this).find(".item_id").html();

	/* GET THE DATA*/
	item_desc = $("#item_desc_"+item_id).html();
	item_cat = $("#item_category_"+item_id).html();

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
			success: function (data) {
				console.log(data);
			}
		})
	.done(function(data) {

		//clean up
		$("#input_description").val("");

		//close the modal
		$("#modal-insert-items").modal('hide');
	});
});


$(".delete-item-entry").click(function(event){

	//get the id to be deleted
	var item_id = $(this).find(".item_id").html();
	$("#modal-delete-items input[name=id]").val(item_id);
	
	var item_desc = $(this).find(".item_desc").html();
	$("#modal-delete-items #item_del_item").html(item_desc);

});

$("#form_delete_items").submit(function(){

	//stop default event
	event.preventDefault();

	//get all the input data
	item_id = $(this).find("input[name=id]").val();

	$.ajax({
			url: base_url + '/api/item/' + item_id,
			type: 'delete',
			dataType: "json", 
			success: function (data) {
				console.log(data);
			}
		})
	.done(function(data) {

		//clean up
		$("#input_description").val("");

		//close the modal
		$("#modal-delete-items").modal('hide');
	});

});
