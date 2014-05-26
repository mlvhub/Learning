'use strict';

angular.module('bookmarks')
  .controller('BookmarkCtrl', ['$scope', 'bookmarkService', function($scope, bookmarkService) {
    $scope.bookmarks = bookmarkService.all();

    $scope.deleteBookmark = function(id) {
      bookmarkService.delete(id);
      $scope.bookmarks = bookmarkService.all();
    };

    $scope.createBookmark = function(url, page) {
      console.log('Creating ', url, page);
      var bookmark = {
        url: url,
        page: page
      };
      bookmarkService.create(bookmark);
      $scope.bookmarks = bookmarkService.all();
    };
  }]);
