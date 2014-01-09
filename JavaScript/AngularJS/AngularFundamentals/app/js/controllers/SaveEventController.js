'use strict';

eventsApp.controller('SaveEventController', function SaveEventController($scope, eventData) {

        $scope.saveEvent = function (event, form) {
            console.log(form);
            if (form.$valid) {
                eventData.save(event)
                    .then(
                        function (response) {
                            console.log('success', response);
                        },
                        function (response) {
                            console.log('failure', response);
                        }
                );
            }
        };

        $scope.cancelSave = function () {
            window.location = "/app/eventDetails.html";
        }
    }
});