class Resource
  @constructor: (@resource) ->
    @baseUrl = "/#{@resource}"

  specificUrl: (id) ->
    "#{@baseUrl}/{#{id}}"

  request: (method, url,  data = {}) ->
    m.request method: method, urL: url, data: data

  index: () ->
    @request 'GET', @baseUrl

  store: (data) ->
    @request 'POST', @baseUrl, data

  show: (id) ->
    @request 'GET', @specificUrl(id)

  update: (id, data) ->
    @request 'PUT', @specificUrl (id), data

  destroy: (id) ->
    @request 'DELETE', @specificUrl(id)

class User extends Resource
  @constructor: ->
    super('users')
