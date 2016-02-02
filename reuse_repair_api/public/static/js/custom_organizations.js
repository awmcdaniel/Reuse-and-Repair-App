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
	$("#form_insert_organizations").attr("method", "POST");

	//disable the hidden id input
	$("#form_insert_organizations").find("input[name=id]").prop('disabled', true);
	$("#form_insert_organizations").find("input[name=id]").val("")

	//change action
	$("#form_insert_organizations").attr("action", base_url + '/api/organization');


	//$("#input_org_items").prop('disabled', true);

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
	$("#modal-edit-organization input[id=input_name]").val(org_name);
	$("#modal-edit-organization input[id=input_url]").val(org_url);
	$("#modal-edit-organization input[id=input_phone]").val(org_phone);
	$("#modal-edit-organization input[id=input_notes]").val(org_notes);
	$("#modal-edit-organization input[id=input_addr1]").val(org_addr1);
	$("#modal-edit-organization input[id=input_addr2]").val(org_addr2);
	$("#modal-edit-organization input[id=input_city]").val(org_city);
	$("#modal-edit-organization select#input_state.form-control option[value="+org_state+"]").prop('selected', true);
	$("#modal-edit-organization input[id=input_zipcode]").val(org_zip);

	$("#form_container_orgtype.form-group select").empty();
	create_selectlist_options("#form_container_orgtype.form-group select", org_categories);

	var selected_val = get_key(org_type, org_categories);
	if (selected_val != undefined) {
		$("#form_container_orgtype.form-group select option[value="+selected_val+"]").prop('selected', true);
	};

	//change method
	$("#form_insert_organizations").attr("method", "PUT");
	$("#form_insert_organizations").find("input[name=id]").prop('disabled', false);
	$("#form_insert_organizations").find("input[name=id]").val(org_id);

	//change action
	$("#form_insert_organizations").attr("action", base_url + '/api/organization/' + org_id);

	//$("#input_org_items").prop('disabled', true);
});

$("#form_insert_organizations").submit(function(event) {
	//stop default event
	event.preventDefault();

	//get all the input data
	var postData = $(this).serializeArray();
	var method = $("#form_insert_organizations").attr("method");
	var action = $("#form_insert_organizations").attr("action");

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

		//close the modal
		$("#modal-edit-organization").modal('hide');
	});
});