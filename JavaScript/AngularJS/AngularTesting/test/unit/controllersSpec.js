'use strict';

describe('controllers', function() {
  beforeEach(module('todoApp'));

  describe('MainCtrl', function() {
    it('should have a default greeting', inject(function($rootScope, $controller) {
      var scope = $rootScope.$new();
      var mainCtrl = $controller('MainCtrl', { $scope: scope });
      expect(mainCtrl).toBeDefined();
      expect(scope.greeting).toEqual('Hello, AngularJS!');

    }));
  });
});
