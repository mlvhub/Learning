'use strict';

angular.module('todoApp.todos')
  .factory('todosFactory', function() {
    return {
      put: function(title, description) {
        var todo = {
          title: title,
          description: description,
          done: false
        };
        localStorage.setItem(title, todo);
      },
      get: function(title) {
        if(title) {
          return localStorage.getItem(title);
        } else {
          
        }
      }
    };
  });
