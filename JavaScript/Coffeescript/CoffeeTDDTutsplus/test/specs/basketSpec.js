(function() {
  define(['basket', 'item'], function(Basket, Item) {
    return describe("Basket", function() {
      var basket;
      basket = null;
      beforeEach(function() {
        basket = new Basket();
        return console.log("BASKET: ", basket.items);
      });
      it("should keep track of the total count of item in a basket", function() {
        var laptop, mouse;
        laptop = new Item(1, "Laptop", 400);
        mouse = new Item(2, "Mouse", 10);
        basket.add(laptop);
        expect(basket.totalCount).toEqual(1);
        basket.add(laptop);
        expect(basket.totalCount).toEqual(2);
        basket.add(mouse);
        return expect(basket.totalCount).toEqual(3);
      });
      return it("should keep track of the count of distinct items in a basket", function() {
        var laptop, mouse;
        laptop = new Item(1, "Laptop", 400);
        mouse = new Item(2, "Mouse", 10);
        basket.add(laptop);
        expect(basket.distinctCount).toEqual(1);
        basket.add(laptop);
        expect(basket.distinctCount).toEqual(1);
        basket.add(mouse);
        return expect(basket.distinctCount).toEqual(2);
      });
    });
  });

}).call(this);
