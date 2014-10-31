var chain = {};

chain.seven = function(subject) {
  var output = [];
  for (var i = 0; i < 7; i++) output.push(subject(i));
  return output;
};

chain.checks = function(ctrl, index) {
  return {
    onclick: function() {
      ctrl.check(index, this.checked);
    },
      checked: ctrl.isChecked(index)
  };
};
chain.indexAt = function(x, y) {
  var daysPerWeek = 7;
  return y * daysPerWeek + x;
};

// model
chain.save = function(list) {
  localStorage['chainApp.list'] = JSON.stringify(list);
};

chain.load = function() {
  return JSON.parse(localStorage['chainApp.list'] || "[]");
};

// date model
chain.today = function() {
  var now = new Date();
  return new Date(now.getFullYear(), now.getMonth(), now.getDate(), 0, 0, 0, 0);
};
chain.resetDate = function() {
  return ( localStorage["chain-app.start-date"] = chain.today().getTime() );
};
chain.startDate = function() {
  return new Date(parseInt(localStorage["chain-app.start-date"] || chain.resetDate()));
};
chain.dateAt = function(index) {
  var date = new Date(chain.startDate());
  date.setDate(date.getDate() + index);
  return date;
};

// controller
chain.controller = function() {
  var list = chain.load();

  this.isChecked = function(index) {
    return list[index];
  };
  this.check = function(index, status) {
    if (chain.dateAt(index).getTime() <= chain.today().getTime()) {
      list[index] = status;
      chain.save(list);
    }
  };
};

// view
chain.view = function(ctrl) {
  return m('table', chain.seven(function(){
    return m('tr', chain.seven(function() {
      return m('td', [
        m('input[type=checkbox]')
      ]);
    }));
  }));
};

m.module(document.body, chain);
