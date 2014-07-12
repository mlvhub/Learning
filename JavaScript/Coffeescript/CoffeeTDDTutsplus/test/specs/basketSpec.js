(function() {
  define(['basket', 'item'], function(Basket, Item) {
    return describe("Basket", function() {
      var basket;
      basket = {};
      beforeEach(function() {
        return basket = new Basket();
      });
      return it("should keep track of items in the basket", function() {
        var item;
        item = new Item();
        basket.add(item);
        expect(basket.count).toEqual(1);
        basket.add(item);
        return expect(basket.count).toEqual(2);
      });
    });
  });

}).call(this);
