define ['lodash'], (_) ->

  class Basket
    constructor: ->
      @items = []
      @totalCount = 0
      @distinctCount = 0
    
    add: (item) ->
      itemInBasket = _.find @items, (basketItem) -> 
        basketItem.item.id is item.id
      if itemInBasket
        itemInBasket.quantity++
      else
        @items.push
          item: item
          quantity: 1
      
      @distinctCount = @items.length
      @totalCount++
