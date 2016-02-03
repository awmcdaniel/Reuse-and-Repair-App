/*=====================================================================
ORGANIZATION
=======================================================================*/
$("#btn_add_organizations").click(function () {

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

	//change method
	$("#form_insert_organization").attr("method", "POST");

	//disable the hidden id input
	$("#form_insert_organization").find("input[name=id]").prop('disabled', true);
	$("#form_insert_organization").find("input[name=id]").val("")

	//change action
	$("#form_insert_organization").attr("action", base_url + '/api/organization');

});


$(".edit-org-entry").click(function () {

	org_id = $(this).find(".org_id").html();
	
	$("#modal-edit-organization input[name=org_id]").val(org_id).prop("disabled", false);

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

	if($(document).find("#org_state_"+org_id).length == 0) {
		$("#modal-edit-organization select#input_state.form-control").val("");
	} else {
		org_state = org_state.html();
		$("#modal-edit-organization select#input_state.form-control option[value="+org_state+"]").prop('selected', true);
	}

	org_zip = (org_zip == null) ? "" : org_zip.html();


	/* PREFILL DATA */

	$("#modal-edit-organization input[id=input_name]").val(org_name);
	$("#modal-edit-organization input[id=input_url]").val(org_url);
	$("#modal-edit-organization input[id=input_phone]").val(org_phone);
	$("#modal-edit-organization input[id=input_notes]").val(org_notes);
	$("#modal-edit-organization input[id=input_addr1]").val(org_addr1);
	$("#modal-edit-organization input[id=input_addr2]").val(org_addr2);
	$("#modal-edit-organization input[id=input_city]").val(org_city);
	
	$("#modal-edit-organization input[id=input_zipcode]").val(org_zip);

	$("#form_container_orgtype.form-group select").empty();
	create_selectlist_options("#form_container_orgtype.form-group select", org_categories);

	var selected_val = get_key(org_type, org_categories);
	if (selected_val != undefined) {
		$("#form_container_orgtype.form-group select option[value="+selected_val+"]").prop('selected', true);
	};

	//change method
	$("#form_insert_organization").attr("method", "PUT");
	$("#form_insert_organization").find("input[name=id]").prop('disabled', false);
	$("#form_insert_organization").find("input[name=id]").val(org_id);

	//change action
	$("#form_insert_organization").attr("action", base_url + '/api/organization/' + org_id);
});

$("#form_insert_organization").submit(function(event) {
	//stop default event
	event.preventDefault();

	//get all the input data
	var method = $("#form_insert_organization").attr("method");
	var action = $("#form_insert_organization").attr("action");

	var postData = $("#form_insert_organization :input[value!='']").serializeArray();
	var postData_filtered = [];
	$.each(postData, function(index, object) {
		if(object['value'] !== "") {
			postData_filtered.push(object);
		}
	});

	$.ajax({
			url: action,
			type: method,
			data: postData_filtered,
			dataType: "json", 
			success: function (data) {
				console.log(data);
			}
		})
	.done(function(data) {

		//close the modal
		$("#modal-edit-organization").modal('hide');
	});
});

$(".delete-org-entry").click(function(event){


	//get the id to be deleted
	var id = $(this).find(".org_id").html();
	$("#modal-delete-organization input[name=id]").val(id);
	
	var name = $(this).find(".org_name").html();
	$("#modal-delete-organization #org_del_item").html(name);

});


$("#form_delete_organization").submit(function(){

	//stop default event
	event.preventDefault();

	//get all the input data
	var id = $(this).find("input[name=id]").val();

	$.ajax({
			url: base_url + '/api/organization/' + id,
			type: 'delete',
			dataType: "json", 
			success: function (data) {
				console.log(data);
			}
		})
	.done(function(data) {

		//close the modal
		$("#modal-delete-organization").modal('hide');
	});

});


/*==========================================================
	Adding Items to Organizations
  ========================================================== */
$(".add-orgitem-entry").click(function(event){

	//get the id to be deleted
	var id = $(this).find(".org_id").html();
	$("#modal-insert-organizationitem input[name=id]").val(id);


	$.ajax({
			url: base_url + '/api/organizations/' + id,
			type: 'GET',
			dataType: "json", 
			success: function (response) {
				var items_arr = response['data']['items'];
				console.log(items_arr);

				var org_items = [];
				console.log(org_items);
				$.each(items_arr, function(index, obj) {
					var val = obj['item_id'];
					var desc = obj['description'];
					$("#input_org_items").tokenfield('createToken', { value:  val, label: desc});
				});
			}
		})
	.done(function(data) {

	});

	var name = $(this).find(".org_name").html();
	$("#modal-insert-organizationitem #org_add_item").html(name);

});


$("#form_insert_organizationitem").submit(function(){

	//stop default event
	event.preventDefault();

	//get all the input data
	var org_id = parseInt($(this).find("input[name=id]").val());
	$("#input_org_items").tokenfield('beautify', false);
	var tokens = $("#input_org_items").tokenfield('getTokensList', '%%').split('%%');

	//create the post data
	var postData = [];

	var id = {name: "id", value: org_id};
	postData.push(id);

	$.each(tokens, function(index, value) {
		var n = "items["+index+"]";
		var items = {name: n, value: parseInt(value.trim())}
		postData.push(items);
	});

	// send the data
	$.ajax({
			url: base_url + '/admin/organizations/items',
			type: 'POST',
			dataType: "json", 
			data: postData,
			success: function (data) {
				console.log(data);
			}
		})
	.done(function(data) {

		//close the modal
		$("#modal-insert-organizationitem").modal('hide');
	});

});
