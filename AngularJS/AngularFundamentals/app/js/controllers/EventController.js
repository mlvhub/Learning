'use strict';

eventsApp.controller('EventController', function EventController($scope, eventData) {
    $scope.snippet = "<span style='color:red'>hi there</span>";
    $scope.boolValue = false;
    $scope.myStyle = { color: 'red' }
    $scope.myClass = 'blue';
    $scope.buttonDisabled = true;
    $scope.sortorder = 'name';
    $scope.event = eventData;
    
    $scope.upVoteSession = function(session) {
        session.upVoteCount++;
    }
    
    $scope.downVoteSession = function(session) {
        session.upVoteCount--;
    }
    
});
                     