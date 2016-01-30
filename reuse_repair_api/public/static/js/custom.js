$(".edit-org-entry").click(function () {
	org_id = $(this).find(".org_id").html();
	
	//$("#modal-edit-organization input[name=input_org_id]").val(org_id).prop("disabled", false);

	parent_ele = document.getElementById("org_"+org_id);
	org_type = document.getElementById("org_type_"+org_id).innerHTML;
	org_name = document.getElementById("org_name_"+org_id).innerHTML;
	org_url = document.getElementById("org_url_"+org_id).innerHTML;
	org_phone = document.getElementById("org_phone_"+org_id).innerHTML;
	org_notes = document.getElementById("org_notes_"+org_id).innerHTML;

	//org_addr1 = document.getElementById("org_addr1_"+org_id).innerHTML;
	//org_addr2 = document.getElementById("org_addr2_"+org_id).innerHTML;
	//org_city = document.getElementById("org_city_"+org_id).innerHTML;
	//org_state = document.getElementById("org_state_"+org_id).innerHTML;
	org_zip = document.getElementById("org_zip_"+org_id).innerHTML;

	console.log("org_type_"+org_id);
	console.log(org_type);

});