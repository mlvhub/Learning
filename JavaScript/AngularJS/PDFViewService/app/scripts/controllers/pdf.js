'use strict';

angular.module('pdfServiceApp')
  .controller('PdfCtrl', ['$scope', 'bookmarkService', function ($scope, bookmarkService){
    var src = 'pdfs/scala.pdf',
        bookmark = bookmarkService.findByUrl(src),
        currentPage = (bookmark) ? bookmark.page : 1;

    console.log('Bookmark', bookmark);

    $scope.pdf = {
      src: src,
      currentPage: currentPage
    };

    $scope.next = function() {
      $scope.pdf.currentPage++;
    };

    $scope.prev = function() {
      if($scope.pdf.currentPage > 1) {
        $scope.pdf.currentPage--;
      }
    };

    $scope.pdf.goTo = function(page) {
      $scope.pdf.currentPage = page;
    };
  }]);
