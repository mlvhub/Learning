'use strict';
console.log('SliderModule');
angular.module('slider.directive', []).
directive('slider', function($timeout) {
  return {
    restrict: 'E',
  replace: true,
  scope: {
    images: '=images'
  },
  link: function(scope, elem, attrs) {
    scope.currentIndex = 0; // Initially the index is at the first image
    console.log('Link CI: '+scope.currentIndex);
    scope.next = function() {
      scope.currentIndex < scope.images.length - 1 ? scope.currentIndex++ : scope.currentIndex = 0;
      console.log('Next CI: '+scope.currentIndex);
    };

    scope.prev = function() {
      scope.currentIndex > 0 ? scope.currentIndex-- : scope.currentIndex = scope.images.length - 1;
      console.log('Prev CI: '+scope.currentIndex);
    };

    scope.$watch('currentIndex', function() {
      console.log('Watch CI: '+scope.currentIndex);
      scope.images.forEach(function(image) {
        image.visible = false; // make every image invisible
      });

      scope.images[scope.currentIndex].visible = true; // make the current image visible
    });
  },
  templateUrl: 'views/templates/slider.html'
  };
});
