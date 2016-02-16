function create_org_entry(response) {

	var data = response['data'];

	var org_type = data['org_type'];
	var new_id = data['id'];
	var name = data['name'];
	var webpage = data['webpage'];
	var phone = data['phone'];
	var street1 = data['street_1'];
	var street2 = data['street_2'];
	var city = data['city'];
	var state = data['state'];
	var zip_code = data['zip_code'];
	var notes = data['notes'];

	var tr = document.createElement('tr');
	tr.setAttribute('id', 'record_'+new_id);
	tr.setAttribute('class', 'animated lightSpeedIn new_record filter_'+org_type);

	var td_orgtype = document.createElement('td');
	td_orgtype.setAttribute('id', 'org_type_'+new_id);
	td_orgtype.setAttribute('class', 'col-md-1 hidden-xs');
	td_orgtype.innerHTML = org_type;

	/* Business Column */
	var td_business = document.createElement('td');
	td_business.setAttribute('id', 'org_type_'+new_id);
	td_business.setAttribute('class', 'col-md-3');

	// name
	var b_strong = document.createElement('strong');
	var b_span_name = document.createElement('span');
	b_span_name.setAttribute('id', 'org_name_'+new_id);
	b_span_name.setAttribute('class', 'row_org_name');
	b_span_name.innerHTML = name;

	b_strong.appendChild(b_span_name);
	td_business.appendChild(b_strong);
	td_business.appendChild(document.createElement('br'));


	//website
	if (webpage) {
		var b_a_webpage = document.createElement('a');
		b_a_webpage.setAttribute('href', webpage);
		b_a_webpage.setAttribute('id', 'org_url_'+new_id);
		b_a_webpage.setAttribute('class', 'row_org_url');
		b_a_webpage.setAttribute('target', '_blank');
		b_a_webpage.innerHTML = "WWW";

		td_business.appendChild(b_a_webpage);
	}

	//phone
	if (phone) {
		var b_span_phone = document.createElement('span');
		b_span_phone.setAttribute('id', 'org_phone_'+new_id);
		b_span_phone.setAttribute('class', 'row_org_phone');
		b_span_phone.innerHTML = phone;
		td_business.appendChild(b_span_phone);
		td_business.appendChild(document.createElement('br'));
	}


	//street 1
	if (street1) {
		var b_span_addr1 = document.createElement('span');
		b_span_addr1.setAttribute('id', 'org_addr1_'+new_id);
		b_span_addr1.setAttribute('class', 'row_org_addr1');
		b_span_addr1.innerHTML = street1;

		td_business.appendChild(b_span_addr1);
		td_business.appendChild(document.createElement('br'));
	}


	//street 2
	if (street2) {
		var b_span_addr2 = document.createElement('span');
		b_span_addr2.setAttribute('id', 'org_addr2_'+new_id);
		b_span_addr2.setAttribute('class', 'row_org_addr2');
		b_span_addr2.innerHTML = street2;

		td_business.appendChild(b_span_addr2);
		td_business.appendChild(document.createElement('br'));
	}


	//city
	if (city) {
		var b_span_city = document.createElement('span');
		b_span_city.setAttribute('id', 'org_city_'+new_id);
		b_span_city.setAttribute('class', 'row_org_city');
		b_span_city.innerHTML = city;

		td_business.appendChild(b_span_city);
	}

	//state
	if (state) {
		var b_span_state = document.createElement('span');
		b_span_state.setAttribute('id', 'org_state_'+new_id);
		b_span_state.setAttribute('class', 'row_org_state');
		b_span_state.innerHTML = state;

		td_business.appendChild(b_span_state);
	}

	//zipcode
	if (zip_code) {
		var b_span_zipcode = document.createElement('span');
		b_span_zipcode.setAttribute('id', 'org_zip_'+new_id);
		b_span_zipcode.setAttribute('class', 'row_org_zip');
		b_span_zipcode.innerHTML = zip_code;

		td_business.appendChild(b_span_zipcode);
	}

	//notes
	if (notes) {

		var b_span_notes_container = document.createElement('span');
		b_span_notes_container.innerHTML = "Info: ";

		var b_em = document.createElement('em');
		var b_span_notes = document.createElement('span');
		b_span_notes.setAttribute('id', 'org_notes_'+new_id);
		b_span_notes.setAttribute('class', 'row_org_note');
		b_span_notes.innerHTML = notes;

		b_em.appendChild(b_span_notes);
		td_business.appendChild(document.createElement('br'));
		td_business.appendChild(document.createElement('br'));
		td_business.appendChild(b_span_notes_container);
		td_business.appendChild(b_em);
	}


	/* Item Column */
	var td_items = document.createElement('td');
	td_items.setAttribute('class', 'col-md-7');

	/* Action Column */
	var td_action = document.createElement('td');
	td_action.setAttribute('class', 'col-md-1');

	//button container
	var div_action = document.createElement('div');
	div_action.setAttribute('class', 'btn-group btn-group-xs');
	div_action.setAttribute('role', 'group');
	div_action.setAttribute('aria-label', '...');

	//edit info
	var act_btn_info = document.createElement('button');
	act_btn_info.setAttribute('class', 'btn edit-org-entry org_edit btn-gray-dark1');
	act_btn_info.setAttribute('data-toggle', 'modal');
	act_btn_info.setAttribute('href', '#modal-edit-organization');
	act_btn_info.setAttribute('data-record-id', new_id);

	var act_btn_info_icon = document.createElement('span');
	act_btn_info_icon.setAttribute('class', 'glyphicon glyphicon-pencil');
	act_btn_info_icon.setAttribute('aria-hidden', 'true');

	//edit items
	var act_a_items = document.createElement('a');
	act_a_items.setAttribute('class', 'btn org_edit btn-gray-dark2');
	act_a_items.setAttribute('href', 'organizations/'+new_id);
	var act_a_items_icon = document.createElement('span');
	act_a_items_icon.setAttribute('class', 'glyphicon glyphicon-briefcase');
	act_a_items_icon.setAttribute('aria-hidden', 'true');

	//edit hours
	var act_btn_hours = document.createElement('button');
	act_btn_hours.setAttribute('class', 'btn add-orghours-entry org_edit btn-gray-dark2');
	act_btn_hours.setAttribute('data-toggle', 'modal');
	act_btn_hours.setAttribute('href', '#modal-insert-organizationhours');
	act_btn_hours.setAttribute('data-record-id', new_id);
	act_btn_hours.setAttribute('data-record-name', name);

	var act_btn_hours_icon = document.createElement('span');
	act_btn_hours_icon.setAttribute('class', 'glyphicon glyphicon-time');
	act_btn_hours_icon.setAttribute('aria-hidden', 'true');

	//delete organization
	var act_btn_delete = document.createElement('button');
	act_btn_delete.setAttribute('class', 'btn delete-org-entry org_edit btn-gray-dark1');
	act_btn_delete.setAttribute('data-toggle', 'modal');
	act_btn_delete.setAttribute('href', '#modal-delete-organization');
	act_btn_delete.setAttribute('data-record-id', new_id);
	act_btn_delete.setAttribute('data-record-name', name);

	var act_btn_delete_icon = document.createElement('span');
	act_btn_delete_icon.setAttribute('class', 'glyphicon glyphicon-remove');
	act_btn_delete_icon.setAttribute('aria-hidden', 'true');


	act_btn_info.appendChild(act_btn_info_icon);
	act_a_items.appendChild(act_a_items_icon);
	act_btn_hours.appendChild(act_btn_hours_icon);
	act_btn_delete.appendChild(act_btn_delete_icon);

	div_action.appendChild(act_btn_info);
	div_action.appendChild(act_a_items);
	div_action.appendChild(act_btn_hours);
	div_action.appendChild(act_btn_delete);

	td_action.appendChild(div_action);

	tr.appendChild(td_orgtype);
	tr.appendChild(td_business);
	tr.appendChild(td_items);
	tr.appendChild(td_action);

	return tr;
};


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


$(document).on('click', ".edit-org-entry", function () {

	var org_id = $(this).attr('data-record-id');
	
	$("#modal-edit-organization input[name=org_id]").val(org_id).prop("disabled", false);

	$("#modal-edit-organization .modal-title").html("EDITING");
	/* GET THE DATA*/
	var org_type = $("#org_type_"+org_id).html();
	var org_name = $("#org_name_"+org_id).html();
	var org_url = $("#org_url_"+org_id).attr('href');
	var org_phone = $("#org_phone_"+org_id).html();
	var org_notes = $("#org_notes_"+org_id).html();

	var org_addr1 = $("#org_addr1_"+org_id);
	var org_addr2 = $("#org_addr2_"+org_id);
	var org_city = $("#org_city_"+org_id);
	var org_state = $("#org_state_"+org_id);
	var org_zip = $("#org_zip_"+org_id);

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
		if(object['value'] == "") {
			object['value'] = null;
		}
		postData_filtered.push(object);
	});

	console.log(postData_filtered);
	$.ajax({
			url: action,
			type: method,
			data: postData_filtered,
			dataType: "json", 
			success: function (response) {

				if (method === "POST") {
					var tr = create_org_entry(response);
					var node = document.getElementById('tbody-organizations');
					node.insertBefore(tr, node.childNodes[0]);
				} else {
					var new_node = create_org_entry(response);
					var parent_node = document.getElementById('tbody-organizations');
					var old_node = document.getElementById('record_'+response['data']['id']);
					parent_node.replaceChild(new_node, old_node);
				}
			}
		})
	.done(function(response) {
		$("#modal-edit-organization").modal('hide');
	});
});

$(document).on('click', '.delete-org-entry', function(event){

	//get the id to be deleted
	var id = $(this).attr('data-record-id');
	$("#modal-delete-organization input[name=id]").val(id);
	
	var name = $(this).attr('data-record-name');
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

$(document).on('click', ".add-orghours-entry", function() {

  	//clear
  	$("#modal-insert-organizationhours input").val("");

	//get the id to be updated
	var id = $(this).attr('data-record-id');
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
