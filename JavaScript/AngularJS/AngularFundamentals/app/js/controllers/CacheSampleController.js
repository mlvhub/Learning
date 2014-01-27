'use strict';

eventsApp.controller('CacheSampleController',
    function CacheSampleController($scope, myCache) {
        
        $scope.addToCache = function (key, value) {
            myCache.put(key, value);
            console.log(myCache.info());
        };

        $scope.readFromCache = function (key) {
            return myCache.get(key);
        };

        $scope.getCacheStats = function () {
            return myCache.info();
        };
    });