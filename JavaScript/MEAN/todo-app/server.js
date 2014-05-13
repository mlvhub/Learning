var express = require('express'),
    app = express(),
    mongoose = require('mongoose'),
    logger = require('morgan');

mongoose.connect('mongodb://localhost/todo');

app.use(express.static(__dirname + '/public'));
app.use(logger());
app.use(express.bodyParser());
app.use(express.methodOverride());

var Todo = mongoose.model('Todo', {
  text: String
});

// Routes
app.get('/api/todos', function (req, res) {
  Todo.find(function(err, todos) {
    if (err)
      res.send(err);
    
    res.json(todos);
  });
});

app.post('/api/todos', function(req, res) {
  Todo.create({
    text: req.body.text,
    done: false
  }, function(err, todo) {
      if(err)
        res.send(err);

      Todo.find(function(err, todos) {
        if(err)
          res.send(err);
        
        res.json(todos);
      });
  });
});

app.delete('/api/todos/:todo_id', function(req, res){
  Todo.remove({
    _id: req.params.todo_id
  }, function(err, todo) {
    if(err)
      res.send(err);
    
    Todo.find(function(err, todos) {
      res.json(todos);
    });
  });
});

app.get('*', function (req, res) {
  res.sendfile('./public/index.html');
});

app.listen(3030);
console.log('App listening on port 3030');
