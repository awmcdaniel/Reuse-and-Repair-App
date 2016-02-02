
$.when(
	$.getScript('../static/js/custom_functions.js'),
    $.Deferred(function( deferred ){
        $( deferred.resolve );
    })
).done(function(){
	get_db_itemcategories();
	get_db_orgcategories();

});


$(".add-org-entry").click(function () {
	$("#modal-edit-organization input[name=input_org_id]").val("").prop("disabled", true);

	/* CLEAR THE FORM*/
	$("#modal-edit-organization .modal-title").html("ADD new entry");
	$("#modal-edit-organization #input_orgtype").val("");
	$("#modal-edit-organization #input_name").val("");
	$("#modal-edit-organization #input_addr1").val("");
	$("#modal-edit-organization #input_addr2").val("");
	$("#modal-edit-organization #input_city").val("");
	$("#modal-edit-organization #input_state").val("");
	$("#modal-edit-organization #input_zipcode").val("");
	$("#modal-edit-organization #input_zipcode").attr("placeholder", "zip-code");
	$("#modal-edit-organization #input_url").val("");
	$("#modal-edit-organization #input_phone").val("");
	$("#modal-edit-organization #input_notes").val("");

	$("#form_container_orgtype.form-group select").empty();
	create_selectlist_options("#form_container_orgtype.form-group select", org_categories);

});

$(".edit-org-entry").click(function () {
	org_id = $(this).find(".org_id").html();
	
	//$("#modal-edit-organization input[name=input_org_id]").val(org_id).prop("disabled", false);
	//parent_ele = document.getElementById("org_"+org_id);

	$("#modal-edit-organization .modal-title").html("EDITING");
	/* GET THE DATA*/
	org_type = $("#org_type_"+org_id).html();
	org_name = $("#org_name_"+org_id).html();
	org_url = $("#org_url_"+org_id).attr('href');
	org_phone = $("#org_phone_"+org_id).html();
	org_notes = $("#org_notes_"+org_id).html();

	org_addr1 = $("#org_addr1_"+org_id);
	org_addr2 = $("#org_addr2_"+org_id);
	org_city = $("#org_city_"+org_id);
	org_state = $("#org_state_"+org_id);
	org_zip = $("#org_zip_"+org_id);

	org_addr1 = (org_addr1 == null) ? "" : org_addr1.html();
	org_addr2 = (org_addr2 == null) ? "" : org_addr2.html();
	org_city = (org_city == null) ? "" : org_city.html();
	org_state = (org_state == null) ? "" : org_state.html();
	org_zip = (org_zip == null) ? "" : org_zip.html();


	/* PREFILL DATA */
	$("#modal-edit-organization input[name=input_name]").val(org_name);
	$("#modal-edit-organization input[name=input_url]").val(org_url);
	$("#modal-edit-organization input[name=input_phone]").val(org_phone);
	$("#modal-edit-organization input[name=input_notes]").val(org_notes);
	$("#modal-edit-organization input[name=input_addr1]").val(org_addr1);
	$("#modal-edit-organization input[name=input_addr2]").val(org_addr2);
	$("#modal-edit-organization input[name=input_city]").val(org_city);
	$("#modal-edit-organization select#input_state.form-control option[value="+org_state+"]").prop('selected', true);
	$("#modal-edit-organization input[name=input_zipcode]").val(org_zip);

	$("#form_container_orgtype.form-group select").empty();
	create_selectlist_options("#form_container_orgtype.form-group select", org_categories);

	var selected_val = get_key(org_type, org_categories);
	if (selected_val != undefined) {
		$("#form_container_orgtype.form-group select option[value="+selected_val+"]").prop('selected', true);
	};
});

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

/*=====================================================================
ITEMS
=======================================================================*/

$(".edit-item-entry").click(function () {
	item_id = $(this).find(".item_id").html();

	/* GET THE DATA*/
	item_desc = $("#item_desc_"+item_id).html();
	item_cat = $("#item_category_"+item_id).html();

	/* PREFILL DATA */
	$("#modal-insert-items input[name=input_description]").val(item_desc);

	$("#form_container_category.form-group select").empty();
	create_selectlist_options("#form_container_category.form-group select", item_categories);

	var selected_val = get_key(item_cat, item_categories);
	if (selected_val != undefined) {
		$("#form_container_category.form-group select option[value="+selected_val+"]").prop('selected', true);
	};

});

