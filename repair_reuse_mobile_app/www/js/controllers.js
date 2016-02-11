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
.controller('repairCategoriesCtrl', function($scope, RepairCategories, ActiveCategory, $state, $ionicHistory) {

    $scope.goBackHistory = function() {
        $ionicHistory.goBack();
    };

	var active = ActiveCategory;
	$scope.$on('$ionicView.beforeEnter', function() {
		active.clear();
	});

	RepairCategories.getAll().then(function(response) {
		$scope.categories = response;
	});

	$scope.btn_categoryDetail = function(category_object) {
		active.set(category_object);
		console.log(active.description());
		$state.go('repairCategoryItems');
	};

})

.controller('repairCategoryItemsCtrl', function($scope, ActiveCategory) {
	var active = ActiveCategory;
	$scope.items = active.items();
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
   
.controller('reuseItemOrganizationsCtrl', function($scope, ItemOrganizations) {
	var item = ItemOrganizations;

	$scope.page_title = item.item_desc();
	$scope.organizations = item.organizations();
}) 

