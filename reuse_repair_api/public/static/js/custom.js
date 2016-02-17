var static_url_folder = '../../static/js/';
var base_url = 'http://localhost:4000';




$(document).ready(function() {

	$.when(
		$.getScript( static_url_folder+'jquery-ui.min.js' ),
		$.getScript( static_url_folder+'bootstrap-tokenfield.min.js' ),
		$.getScript( static_url_folder+'custom_functions.js' ), //keep this at the top
		$.getScript( static_url_folder+'custom_organizations.js' ),
		$.getScript( static_url_folder+'custom_items.js' ),
		$.getScript( static_url_folder+'custom_categories.js' ),
	    $.Deferred(function( deferred ){
	        $( deferred.resolve );
	    })
	).done(function(){


	});
});




