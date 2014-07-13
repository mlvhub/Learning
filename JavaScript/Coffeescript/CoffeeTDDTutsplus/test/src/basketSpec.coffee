define ['basket', 'item'], (Basket, Item) ->

  describe "Basket", ->

    basket = null

    beforeEach ->
      basket = new Basket()
      console.log "BASKET: ", basket.items

    it "should keep track of the total count of items in a basket", ->
      laptop = new Item(1, "Laptop", 400)
      mouse = new Item(2, "Mouse", 10)

      basket.add laptop
      expect(basket.totalCount).toEqual 1

      basket.add laptop
      expect(basket.totalCount).toEqual 2

      basket.add mouse
      expect(basket.totalCount).toEqual 3

    it "should keep track of the count of distinct items in a basket", ->
      laptop = new Item(1, "Laptop", 400)
      mouse = new Item(2, "Mouse", 10)

      basket.add laptop
      expect(basket.distinctCount).toEqual 1

      basket.add laptop
      expect(basket.distinctCount).toEqual 1

      basket.add mouse
      expect(basket.distinctCount).toEqual 2
