
'use strict'

# Declare app level module which depends on filters, and services
App = angular.module('app', [
  'ui.state'
  'ngCookies'
  'ngResource'
  'app.controllers'
  'app.directives'
  'app.filters'
  'app.services'
  'app.templates'
  'app.todo.controllers'
  'app.view1.controllers'
  'app.view2.controllers'
])

App.config([
  '$stateProvider'
  '$urlRouterProvider'

  ($stateProvider, $urlRouterProvider) ->

    # default to the todo page
    $urlRouterProvider.otherwise("/todo")
    
    $stateProvider

      .state('todo', 
          url: "/todo"
          views:
            "main-content": 
              templateUrl: "app/sections/home/partials/todo.jade"
      )

      .state('view1', 
          url: "/view1"
          views:
            "main-content": 
              templateUrl: "app/sections/view1/partials/partial1.jade"
      )

      .state('view2', 
          url: "/view2"
          views:
            "main-content": 
              templateUrl: "app/sections/view2/partials/partial2.jade"
      )
])
