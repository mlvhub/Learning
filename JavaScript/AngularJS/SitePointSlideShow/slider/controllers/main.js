'use strict';

console.log('MainCtrl');

var app = angular.module('sliderApp');

app.controller('MainCtrl', function ($scope) {
  $scope.awesomeThings = [
  'HTML5 Boilerplate',
  'AngularJS',
  'Karma'
  ];
});

app.controller('SliderController', function($scope) {
  $scope.images = [{
    src: 'images/slider/img1.png',
  title: 'Pic 1'
  }, {
    src: 'images/slider/img2.jpg',
  title: 'Pic 2'
  }, {
    src: 'images/slider/img3.jpg',
  title: 'Pic 3'
  }, {
    src: 'images/slider/img4.png',
  title: 'Pic 4'
  }];
});
