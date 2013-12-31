'use strict';

eventsApp.factory('eventData', function ($resource, $q) {
    var resource = $resource('geturl/:id', {
        id: '@id'
    });

    return {
        getEvent: function () {
            // Promise
            var deferred = $q.defer(),
                success = function (event) {
                    deferred.resolve(event);
                },
                failure = function (response) {
                    deferred.reject(response);
                };


            resource.get({
                id: 1
            }, success, failure);

            return deferred.promise;
        },
        save: function (event) {
            var deferred = $q.defer();
            resource.save(event,
                function (response) {
                    deferred.resolve(response);
                },
                function (response) {
                    deferred.reject(response);
                }
            );
            return deferred.promise;
        }
    };
});
/*
{
        getEvent: function() {
            name: 'Angular Course',
            date: '01/01/2013',
            time: '10:30 a.m.',
            location: {
                address: 'Google Headquarters',
                city: 'Mountain View',
                province: 'CA'
            },
            imageUrl: 'img/angularjs-logo.png',
            sessions: [
                {
                    name: 'Directives Masterclass',
                    creatorName: 'Bob Smith',
                    duration: 1,
                    level: 'Advanced',
                    abstract: 'In this lecture we are going to learn the superfun AngularJS                             Directives.',
                    upVoteCount: 0
                },
                {
                    name: 'Services Masterclass',
                    creatorName: 'John Doe',
                    duration: 2,
                    level: 'Beginner',
                    abstract: 'In this lecture we are going to learn the superfun AngularJS                             Services.',
                    upVoteCount: 0
                },
                {
                    name: 'Controllers Masterclass',
                    creatorName: 'Jane Doe',
                    duration: 4,
                    level: 'Intermediate',
                    abstract: 'In this lecture we are going to learn the superfun AngularJS                             Controllers.',
                    upVoteCount: 0
                }
            ]
        }
    };
    */