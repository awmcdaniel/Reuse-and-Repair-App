angular.module('app.routes', [])

.config(function($stateProvider, $urlRouterProvider) {

  // Ionic uses AngularUI Router which uses the concept of states
  // Learn more here: https://github.com/angular-ui/ui-router
  // Set up the various states which the app can be in.
  // Each state's controller can be found in controllers.js
  $stateProvider
    
      
        
    .state('navigation.reuse+Repair', {
      url: '/home_base',
      views: {
        'side-menu22': {
          templateUrl: 'templates/reuse+Repair.html',
          controller: 'reuse+RepairCtrl'
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
        
      
    
      
        
    .state('reuse_category_01', {
      url: '/reuse_category_01',
      templateUrl: 'templates/reuse_category_01.html',
      controller: 'reuse_category_01Ctrl'
    })
        
      
    
      
        
    .state('repair_category_01', {
      url: '/repair_category_01',
      templateUrl: 'templates/repair_category_01.html',
      controller: 'repair_category_01Ctrl'
    })
        
      
    ;

  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/side_menu/home_base');

});