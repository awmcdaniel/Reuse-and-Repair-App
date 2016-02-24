angular.module('app.routes', [])

.config(function($stateProvider, $urlRouterProvider) {

  // Ionic uses AngularUI Router which uses the concept of states
  // Learn more here: https://github.com/angular-ui/ui-router
  // Set up the various states which the app can be in.
  // Each state's controller can be found in controllers.js
  $stateProvider
    
      
        
    .state('navigation.home', {
      url: '/home_base',
      views: {
        'side-menu22': {
          templateUrl: 'templates/home.html',
          controller: 'homeCtrl'
        }
      }
    })
        
      
    
      
    .state('navigation', {
      url: '/side_menu',
      abstract:true,
      templateUrl: 'templates/navigation.html'
    })
      
    
      
        
    .state('navigation.repairCategories', {
      url: '/repair_home',
      views: {
        'side-menu22': {
          templateUrl: 'templates/repairCategories.html',
          controller: 'repairCategoriesCtrl'
        }
      }
    })
        
      
    
      
        
    .state('navigation.reuseCategories', {
      url: '/reuse_home',
      views: {
        'side-menu22': {
          templateUrl: 'templates/reuseCategories.html',
          controller: 'reuseCategoriesCtrl'
        }
      }
    })
        
      
    
      
        
    .state('reuseCategoryItems', {
      cache: false,
      url: '/reuse_category_items',
      templateUrl: 'templates/reuseCategoryItems.html',
      controller: 'reuseCategoryItemsCtrl'
    })
        
      
    .state('repairItemOrganizations', {
      cache: false,
      url: '/repair_item_organizations',
      templateUrl: 'templates/repairItemOrganizations.html',
      controller: 'repairItemOrganizationsCtrl'
    })
        
    
    .state('reuseItemOrganizations', {
      cache: false,
      url: '/reuse_item_organizations',
      templateUrl: 'templates/reuseItemOrganizations.html',
      controller: 'reuseItemOrganizationsCtrl'
    })

    .state('organizationDetail', {
      cache: false,
      url: '/organization_detail',
      templateUrl: 'templates/organizationDetail.html',
      controller: 'organizationDetailCtrl'
    })

    .state('organizationMap', {
      cache: false,
      url: '/organization_map',
      templateUrl: 'templates/organizationMap.html',
      controller: 'OrganizationMapCtrl'
    })


    ;

  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/side_menu/home_base');

});