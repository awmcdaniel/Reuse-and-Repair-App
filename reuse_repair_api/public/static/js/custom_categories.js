/*=====================================================================
ITEM CATEGORY
=======================================================================*/

$(".edit-itemcat-entry").click(function () {
	itemcat_id = $(this).find(".itemcat_id").html();

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
		$("#modal-insert-itemcategories").modal('hide');
	});
});


$(".delete-itemcat-entry").click(function(event){

	//get the id to be deleted
	var itemcat_id = $(this).find(".itemcat_id").html();
	$("#modal-delete-itemcategories input[name=id]").val(itemcat_id);
	
	var item_desc = $(this).find(".itemcat_desc").html();
	$("#modal-delete-itemcategories #itemcat_del_item").html(item_desc);
	console.log(item_desc);

});

$("#form_delete_itemcategories").submit(function(){

	//stop default event
	event.preventDefault();

	//get all the input data
	itemcat_id = $(this).find("input[name=id]").val();

	$.ajax({
			url: base_url + '/api/itemcategory/' + itemcat_id,
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
		$("#modal-delete-itemcategories").modal('hide');
	});

});

