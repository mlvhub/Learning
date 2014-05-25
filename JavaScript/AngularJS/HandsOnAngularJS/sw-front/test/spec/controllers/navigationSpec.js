'use strict';

describe('NavigationController', function() {

  beforeEach(module('swFrontApp'));

  var location, scope;

  beforeEach(inject(function($controller, $rootScope, $location) {
    location = $location;
    scope = $rootScope.$new();
    $controller('NavigationController', { $scope: scope });
  }));

  describe('isActive', function() {
    it('returns true when paths are the same', function() {
      location.path('/test');
      expect(scope.isActive('/test')).toBeTruthy();
    });
    it('returns false when paths are different', function() {
      location.path('/ersfg');
      expect(scope.isActive('/test')).toBeFalsy();
    });
    it('returns true if it starts with same word', function() {
      location.path('/test/1/show');
      expect(scope.isActive('/test')).toBeTruthy();
    });
    it('returns true if it start with same word followed by query string', function() {
      location.path('/test?id=1');
      expect(scope.isActive('/test')).toBeTruthy();
    });
  });

});
