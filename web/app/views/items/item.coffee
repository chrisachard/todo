
module.exports = class ItemView extends Backbone.View

  tagName: 'div'

  initialize: ->
    @template = require "templates/items/show"

  events: =>
    "click .close": "closeEvent"

  closeEvent: =>
    # Remove from collection here
    @model.trigger "closed", @model

  render: ->
    @$el.html @template
      model: @model
    @
