'use strict';

eventsApp.controller('SaveEventController', function SaveEventController($scope) {

    $scope.saveEvent = function(event, saveEventForm) {
        console.log(saveEventForm);
        if(saveEventForm.$valid) {
            alert("valid form!");
        }
    };
    
    $scope.cancelSave = function() {
        window.location = "/app/eventDetails.html";   
    }
    
});
                     