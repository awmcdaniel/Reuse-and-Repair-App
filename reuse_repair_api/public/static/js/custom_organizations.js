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

			}
		})
	.done(function(data) {
		$("#modal-edit-organization").modal('hide');

		// Add items to organization
		setTimeout(function() { /* This timeout is to prevent a bug in bootstrap from adding padding to body */
			if(method.toLowerCase() == "post") {
				//do something
			}
		}
		, 350);

		// Add business hours


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
				setTimeout(function() {
					$("#record_"+id).remove();
				}, 700);
				$("#record_"+id).attr('class', 'animated infinite bounceOut');
			}
		})
	.done(function(data) {
		$("#modal-delete-organization").modal('hide');
	});

});


/*==========================================================
	Adding Items to Organizations
  ========================================================== */

$(document).on('click', '.delete_item', function() {
	var id = $(this).attr('data-record-id');

	event.preventDefault();
	$.ajax({
			url: base_url + '/api/organizationitems/' + id,
			type: 'delete',
			dataType: "json", 
			success: function (data) {
				setTimeout(function() {
					$("#record_"+id).remove();
				}, 600);
				$("#record_"+id).attr('class', 'animated infinite bounceOut');
			}
		})
	.done(function(data) {
		console.log('done');
	});
});


$("#btn_org_add_item").click(function() {
	console.log("button");
});


$("#form_insert_organizationitem").submit(function() {
	event.preventDefault();
	
	var postData = [];
	var org_id = $(this).find("input[name=id]").val();

	$("#input_org_items").tokenfield('beautify', false);
	var tokens = $("#input_org_items").tokenfield('getTokensList', '%%').split('%%');

	var id = {name: 'id', value: org_id};
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
			success: function (response) {
				console.log(response);
				$('#input_org_items').tokenfield('setTokens', []);

				var frag = document.createDocumentFragment();

				$.each(response['added'], function( index, object ) {
					
					var tr = document.createElement('tr');
					tr.setAttribute('id', 'record_'+object['record_id']);
					tr.setAttribute('class', 'animated lightSpeedIn new_record');

					var td_category = document.createElement('td');
					td_category.innerHTML = object['category_desc'];

					var td_item = document.createElement('td');
					td_item.innerHTML = object['item_desc'];

					var td_action = document.createElement('td');

					var btn_delete = document.createElement('button');
					btn_delete.setAttribute('class', 'btn btn-danger org_edit delete_item');
					btn_delete.setAttribute('data-record-id', object['record_id']);

					var span_icon = document.createElement('span');
					span_icon.setAttribute('class', 'glyphicon glyphicon-remove');
					span_icon.setAttribute('aria-hidden', 'true');

					btn_delete.appendChild(span_icon);
					td_action.appendChild(btn_delete);

					tr.appendChild(td_category);
					tr.appendChild(td_item);
					tr.appendChild(td_action);
					frag.appendChild(tr);
				});

				var node = document.getElementById('tbody-org-items');
				node.insertBefore(frag, node.childNodes[0]);
			}
		})
	.done(function(response) {

	});

});

/*==========================================================
	Business Hours
  ========================================================== */

$(".add-orghours-entry").click(function() {

  	//clear
  	$("#modal-insert-organizationhours input").val("");

	//get the id to be updated
	var id = $(this).find(".org_id").html();
	$("#modal-insert-organizationhours input[name=id]").val(id);

  	//request
	$.ajax({
			url: base_url + '/api/organizationhours/' + id,
			type: 'GET',
			dataType: "json", 
			success: function (response) {
				$.each(response['data'][0], function(key, value) {
					if(key != "org_id" && key != "org_name") {
						$("#modal-insert-organizationhours input[name="+key+"]").val(value);
					} 
				});
			},
			error: function(response) {
				
			}
		})
	.done(function(response) {

	});

});

$("#form_insert_organizationhours").submit(function(){

	//stop default event
	event.preventDefault();

  	var id = $("#modal-insert-organizationhours input[name=id]").val();

  	var postData = $(this).serializeArray();

  	$.each(postData, function(index, object) {
  		if( object['value'] == "") {
  			object['value'] = 'null';
  		}
  	});


	// send the data
	$.ajax({
			url: base_url + '/api/organizationhours/' + id,
			type: 'PUT',
			dataType: "json", 
			data: postData,
			success: function (data) {
				console.log(data);
			}
		})
	.done(function(data) {

		//close the modal
		$("#modal-insert-organizationhours").modal('hide');
	});

});

$(function () {
  $('[data-tooltip="tooltip"]').tooltip();
})