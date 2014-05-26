describe('todosFactory', function() {
  var factory;

  beforeEach(function() {
    module('todoApp.todos');

    inject(function(todosFactory) {
      factory = todosFactory;
    });

    var todos = [
      {
        title: 'Todo1',
        description: 'This is the Todo1',
        done: false
      }, 
      {
        title: 'Todo2',
        description: 'This is the Todo3',
        done: false
      }, 
      {
        title: 'Todo3',
        description: 'This is the Todo3',
        done: false
      }
    ];
  });
});
