
module.exports = class ItemView extends Backbone.View

  tagName: 'div'

  initialize: ->
    @template = require "templates/items/show"

  events: =>
    "click .close": "closeModel"

  closeModel: =>
    @model.close()

  render: ->
    @$el.html @template
      model: @model
    @
