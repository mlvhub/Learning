'use strict';

eventsApp.controller('EventController', function EventController($scope, $anchorScroll, eventData) {
    $scope.sortorder = 'name';
    
    $scope.event = eventData.getEvent();
    /*
    $scope.event.then(
        function (event) { console.log(event); },
        function (response) { console.log(response); } 
    );
    */
    
    $scope.scrollToSession = function () {
      $anchorScroll();  
    };
    
    $scope.upVoteSession = function (session) {
        session.upVoteCount++;
    };
    
    $scope.downVoteSession = function (session) {
        session.upVoteCount--;
    };
    
});
                     