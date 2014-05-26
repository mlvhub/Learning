'use strict';

angular.module('pdfViewDirective').directive('pdfView', ['pdfService', function (pdfService) {
  return {
    restrict: 'E',
    template: '<canvas id="pdf-canvas"></canvas>',
    scope: {
      src: '@',
      currentPage: '@'
    },
    link: function(scope, elem, attrs) {

      var canvas = elem.find('#pdf-canvas').get(0);

      scope.load = function() {
        pdfService.load(scope.src, scope.currentPage, canvas);
      };

      scope.render = function(numPage) {
        pdfService.render(numPage);
      };

      scope.$watch('currentPage', function(value) {
        if(pdfService.isLoaded) {
          console.log('watch: CurrentPage: ', value);
          scope.currentPage = value;
          scope.render(parseInt(scope.currentPage));
        }
      });

      scope.$watch('src', function(value) {
        console.log('watch: Src: ', value);
        scope.src = value;
        scope.load();
      });

    }
  };
}]);
