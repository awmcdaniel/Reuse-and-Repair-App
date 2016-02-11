angular.module('app.services', [])

.factory('DataStore', function () {
	/* http://stackoverflow.com/questions/33599353/how-to-reuse-functions-in-an-angularjs-factory */
    var getStoreFunction = function (storeName) {
        var store = angular.fromJson(window.localStorage[storeName] || '[]');

        function persist() {
            window.localStorage[storeName] = angular.toJson(store);
        };

        return {
            list: function () {
                return store;
            },

            getItem: function (id) {
                return store.find(function (elem) {
                    return elem.id === id;
                });
            },

            createItem: function (item) {
                store.push(item);
                persist(store);
            }
        }
    };

    return  { getStore : getStoreFunction };
})

.factory('RepairCategories', function($http) {
	var API_PATH =  'http://localhost:4000/api/itemcategory/1';

	function query () {
		return $http.get(API_PATH).then(function(response){
					var result_arr = response.data.data.items;
					return result_arr;
				});
	};

	return {
		getAll: function() {
			return query();
		}
	}

})

.factory('ReuseCategories', function($http) {
	var API_PATH =  'http://localhost:4000/api/itemcategories';

	function query () {
		return $http.get(API_PATH).then(function(response){
					var result_arr = response.data.data;
					result_arr.forEach(function(arr_obj, index, array) {
						if(arr_obj['description'] == "Repair Items") {
							result_arr.splice(index, 1);
						}
					});
					return result_arr;
				});
	};

	return {
		getAll: function() {
			return query();
		}
	}

})

.factory('ActiveCategory', function() {
	var active = {};
	return {
		set: function(category_object) {
			active = category_object;
			return active;
		},
		get: function() {
			return active;
		},
		clear: function() {
			active = {};
			return active;
		},
		isset: function() {
			return (Object.keys(active).length > 0) ? true : false;
		},
		items: function() {
			return active.items;
		},
		description: function() {
			return active.description;
		},
		id: function() {
			return active.id;
		}
	}
})

.factory('ItemOrganizations', function($http) {
	var API_PATH =  'http://localhost:4000/api/itemorganizations/';
	var item_org = {};

	var getOrganizations = function (itemID) {
		return $http.get(API_PATH+itemID).then(function(response){
					item_org = response.data.data[0];
					return item_org;
				});
	};

	return {
		query: getOrganizations,
		isset: function() {
			return (Object.keys(active).length > 0) ? true : false;
		},
		get: function() {
			return item_org;
		},
		item_desc: function() {
			return item_org['item_desc'];
		},
		item_category: function() {
			return item_org['item_category'];
		},
		organizations: function() {
			return item_org['organizations'];
		}
	}
})

.service('BlankService', [function(){

}]);

