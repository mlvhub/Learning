(function() {
  define([], function() {
    var Basket;
    return Basket = (function() {
      function Basket() {}

      Basket.prototype.items = [];

      Basket.prototype.count = 0;

      Basket.prototype.add = function(item) {
        this.items.push(item);
        return this.count++;
      };

      return Basket;

    })();
  });

}).call(this);
