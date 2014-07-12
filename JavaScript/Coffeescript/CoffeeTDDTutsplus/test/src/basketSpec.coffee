define ['basket', 'item'], (Basket, Item) ->

  describe "Basket", ->

    basket = {}

    beforeEach ->
      basket = new Basket()

    it "should keep track of items in the basket", ->
      item = new Item()
      basket.add item

      expect(basket.count).toEqual 1

      basket.add item

      expect(basket.count).toEqual 2
