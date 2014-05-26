'use strict';

angular
  .module('pdfServiceApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute',
    'pdfViewDirective',
    'bookmarks'
  ])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
      }) 
      .when('/pdf', {
        templateUrl: 'views/pdf.html',
        controller: 'PdfCtrl'
      })

      .otherwise({
        redirectTo: '/'
      });
  });
