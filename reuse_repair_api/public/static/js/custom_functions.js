var base_url = 'http://localhost:4000';
var item_categories = {};
var org_categories = {};
var items_in_categories = [];


function addslashes( str ) {
    return (str + '').replace(/[\\"']/g, '\\$&').replace(/\u0000/g, '\\0');
}

/* ==================================================================
Creates a select list given the dictionary. 'Container' is the DOM 
element to attach this to.
=====================================================================*/
function create_selectlist_options (container, dictionary) {

	$.each(dictionary, function(key, value) {
		var option = "<option value='"+ key +"'>"+ value +"</option>";
		$(container).append(option);
	});
};


/* ==================================================================
Perform an ajax call to the API and retrieve item categories.
=====================================================================*/
function get_db_itemcategories () {

	if (Object.keys(item_categories).length < 1 ) {

		$.ajax({
				url: base_url + '/api/itemcategories',
				type: 'get',
				data: {},
				success: function (get_data) {

					$.each(get_data['data'], function(index, obj) {
						item_categories[obj['id']] = obj['description'];
					});
				}
			});
	} else {
		// do nothing if it's already been retrieved
	}
};


/* ==================================================================
Perform an ajax call to the API and retrieve organization categories.
=====================================================================*/
function get_db_orgcategories () {

	if (Object.keys(org_categories).length < 1 ) {

		$.ajax({
				url: base_url + '/api/organizationtypes',
				type: 'get',
				data: {},
				success: function (get_data) {

					$.each(get_data['data'], function(index, obj) {
						org_categories[obj['id']] = obj['description'];
					});
				}
			});
	} else {
		// do nothing if it's already been retrieved
	}


};



/* ==================================================================
Get the key of an item in a dictionary given a target value
=====================================================================*/
function get_key(get_value, dictionary) {
	var ret_key = undefined;

	$.each(dictionary, function(key, value) {
		if (String(get_value) == String(value)) {
			ret_key = key;
			return false;
		};
	});

	return ret_key;
};


function get_item_source(callback) {

    $.get(base_url + "/admin/itemcategories/items", function (data) {
       	items_in_categories = JSON.parse(data);
       	callback();
    });
};



var initialize_tokenfield = function() {
		$('#input_org_items')
		//prevent duplicates
		.on('tokenfield:createtoken', function (event) {
			var existingTokens = $(this).tokenfield('getTokens');
			$.each(existingTokens, function(index, token) {
				if (token.value === event.attrs.value)
					event.preventDefault();
			});
		})
		.tokenfield({
		  autocomplete: {
		    source: items_in_categories,
		    delay: 100,
		    appendTo: "#container_org_items"
		  },
		  showAutocompleteOnFocus: false
		});
};

// ------------------------------------------
get_db_itemcategories();
get_db_orgcategories();
get_item_source(initialize_tokenfield);


toastr.options = {
  "closeButton": true,
  "debug": false,
  "newestOnTop": false,
  "progressBar": false,
  "positionClass": "toast-top-right",
  "preventDuplicates": false,
  "onclick": null,
  "showDuration": "6000",
  "hideDuration": "1000",
  "timeOut": "5000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut"
}