(function() {
  define(['lodash'], function(_) {
    var Basket;
    return Basket = (function() {
      function Basket() {
        this.items = [];
        this.totalCount = 0;
        this.distinctCount = 0;
      }

      Basket.prototype.add = function(item) {
        var itemInBasket;
        itemInBasket = _.find(this.items, function(basketItem) {
          return basketItem.item.id === item.id;
        });
        if (itemInBasket) {
          itemInBasket.quantity++;
        } else {
          this.items.push({
            item: item,
            quantity: 1
          });
        }
        this.distinctCount = this.items.length;
        return this.totalCount++;
      };

      return Basket;

    })();
  });

}).call(this);
