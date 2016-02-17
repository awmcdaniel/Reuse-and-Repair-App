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
	var map;

	$scope.organization = active_organization.get();

	var run_geocode = function () {
		GMaps.geocode({
		  address: $('#address').val().trim(),
		  callback: function(results, status) {
		    if (status == 'OK') {
		      var latlng = results[0].geometry.location;
		      map.setCenter(latlng.lat(), latlng.lng());
		      map.addMarker({
		        lat: latlng.lat(),
		        lng: latlng.lng()
		      });
		    }
		  }
		});
	};

    $scope.$on( "$ionicView.afterEnter", function( scopes, states ) {
    	
    	if ( $scope.organization.zip || ($scope.organization.city && $scope.organization.state) ) {
			map = new GMaps({
				el: '#map',
				lat: 0,
				lng: 0,
				zoom: 15
			});
			$scope.map_exist = true;
			run_geocode();
    	}

    });

	$scope.openWEB = function(url) {
		window.open(url, '_system','location=yes');
	};

    $scope.goBackHistory = function() {
        $ionicHistory.goBack();
    };

})