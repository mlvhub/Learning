define [], ->

  class Basket
    items: []
    count: 0
    
    add: (item) ->
      @items.push item
      @count++
