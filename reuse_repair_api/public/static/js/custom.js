
$(document).ready(function() {

	$.when(
		$.getScript('../static/js/jquery-ui.min.js'),
		$.getScript('../static/js/bootstrap-tokenfield.min.js'),
		$.getScript('../static/js/custom_functions.js'), //keep this at the top
		$.getScript('../static/js/custom_organizations.js'),
		$.getScript('../static/js/custom_items.js'),
		$.getScript('../static/js/custom_categories.js'),
	    $.Deferred(function( deferred ){
	        $( deferred.resolve );
	    })
	).done(function(){


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




	});
});




