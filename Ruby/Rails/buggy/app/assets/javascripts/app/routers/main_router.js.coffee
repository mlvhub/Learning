class App.Routers.MainRouter extends Backbone.Router

  routes:
    "": "index"

  index: ->
    console.log "Hello from Router"
