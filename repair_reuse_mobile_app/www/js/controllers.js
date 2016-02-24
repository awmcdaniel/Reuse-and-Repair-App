angular.module('app.controllers', [])

.filter('startFrom', function() {
	/* http://stackoverflow.com/questions/28411220/ng-repeat-specify-a-starting-index */
    return function(input, start) {
        if(input) {
            start = +start; //parse to int
            return input.slice(start);
        }
        return [];
    }
})


/* ---------------------------------------------------
	HOME
   --------------------------------------------------- */    
.controller('homeCtrl', function($scope) {

})

/* ---------------------------------------------------
	REPAIR
   --------------------------------------------------- */      
.controller('repairCategoriesCtrl', function($scope, RepairCategories, ActiveCategory, $state, $ionicHistory, ItemOrganizations) {

	var active = ActiveCategory;
	$scope.$on('$ionicView.beforeEnter', function() {
		active.clear();
	});

	RepairCategories.getAll().then(function(response) {
		$scope.items = response;
	});

	$scope.btn_getOrgnanizations = function(item_id) {
		var item = ItemOrganizations;
		item.query(item_id).then(function(response) {
			$state.go('repairItemOrganizations');
		});
	};

})

.controller('repairItemOrganizationsCtrl', function(ActiveOrganization, $scope, RepairCategories, ActiveCategory, $state, $ionicHistory, ItemOrganizations) {
	var item = ItemOrganizations;

	$scope.page_title = item.item_desc();
	$scope.organizations = item.organizations();


    $scope.goBackHistory = function() {
        $ionicHistory.goBack();
    };

    $scope.btn_getOrganizationDetail = function(org) {
    	var active_organization = ActiveOrganization;
    	active_organization.set(org);
    	$state.go('organizationDetail');
    };
})
 

/* ---------------------------------------------------
	REUSE
   --------------------------------------------------- */    
.controller('reuseCategoriesCtrl', function($scope, ReuseCategories, ActiveCategory, $state, $ionicHistory, ItemOrganizations) {

	var active = ActiveCategory;

    $scope.goBackHistory = function() {
        $ionicHistory.goBack();
    };

	$scope.$on('$ionicView.beforeEnter', function() {
		active.clear();
	});

	ReuseCategories.getAll().then(function(response) {
		$scope.categories = response;
		
	});

	$scope.btn_categoryDetail = function(category_object) {
		active.set(category_object);
		$state.go('reuseCategoryItems');
	};
})
   
.controller('reuseCategoryItemsCtrl', function($scope, $state, ActiveCategory, ItemOrganizations, $ionicHistory) {

    var active = ActiveCategory;
	$scope.items = active.items();
	$scope.page_title = active.description();


    $scope.goBackHistory = function() {
        $ionicHistory.goBack();
    };

	$scope.btn_getOrgnanizations = function(item_id) {
		var item = ItemOrganizations;
		item.query(item_id).then(function(response) {
			$state.go('reuseItemOrganizations');
		});
	};

})
   
.controller('reuseItemOrganizationsCtrl', function($scope, ItemOrganizations, ActiveOrganization, $state) {
	var item = ItemOrganizations;

	$scope.page_title = item.item_desc();
	$scope.organizations = item.organizations();

    $scope.btn_getOrganizationDetail = function(org) {
    	var active_organization = ActiveOrganization;
    	active_organization.set(org);
    	$state.go('organizationDetail');
    };
}) 

/* ---------------------------------------------------
	SHARED VIEW
   --------------------------------------------------- */ 

.controller('organizationDetailCtrl', function(ActiveOrganization, $scope, $state, $ionicHistory) {

	var active_organization = ActiveOrganization;


	$scope.organization = active_organization.get();

    $scope.$on( "$ionicView.afterEnter", function( scopes, states ) {

    });

    $scope.drawMap = function() {
    	$state.go('organizationMap');
    }

	$scope.openWEB = function(url) {
		window.open(url, '_system','location=yes');
	};

    $scope.goBackHistory = function() {
        $ionicHistory.goBack();
    };

})

.controller('OrganizationMapCtrl', function(ActiveOrganization,$scope, $ionicLoading, $compile) {

	var active_organization = ActiveOrganization;
	$scope.address = active_organization.address();

	var address = $scope.address;


	function handleLocationError(browserHasGeolocation, infoWindow, pos) {
	  infoWindow.setPosition(pos);
	  infoWindow.setContent(browserHasGeolocation ?
	                        'Error: The Geolocation service failed.' :
	                        'Error: Your browser doesn\'t support geolocation.');
	}

	function initMap(address) {

	  var myLatlng = {lat: 0, lng: 0};
	  var marker;

	  var map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 15,
	    center: myLatlng
	  });

	  marker = new google.maps.Marker({
	    position: myLatlng,
	    map: map,
	  });

	  var geocoder = new google.maps.Geocoder();
	  geocoder.geocode({'address': address}, function(results, status) {
	    if (status === google.maps.GeocoderStatus.OK) {
	      map.setCenter(results[0].geometry.location);
	      marker = new google.maps.Marker({
	        map: map,
	        position: results[0].geometry.location
	      });
	    } else {
	      console.log('Geocode was not successful for the following reason: ' + status);
	    }
	  });

	  var infoWindow = new google.maps.InfoWindow({map: map});

	  // Try HTML5 geolocation.
	  if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(function(position) {
	      var pos = {
	        lat: position.coords.latitude,
	        lng: position.coords.longitude
	      };

	      infoWindow.setPosition(pos);
	      infoWindow.setContent('You');
	      map.setCenter(pos);
	    }, function() {
	      handleLocationError(true, infoWindow, map.getCenter());
	    });
	  } else {
	    // Browser doesn't support Geolocation
	    handleLocationError(false, infoWindow, map.getCenter());
	  }

	}

	$scope.getMap = function() {
		initMap(address);
	};
  
})