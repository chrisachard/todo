
Item = require "models/item"
ItemView = require "views/items/item"


module.exports = class ItemCollectionView extends Backbone.View

  el: $ '#app'

  initialize: ->
    @template = require "templates/items/list"

  events: =>
    "click .add_new_item": "addNewItem"
    "keypress input[type=text]": "addOnEnter"

  addNewItem: =>
    @collection.addNewItem @$el.find("#new_item").val()
    @render()

  addOnEnter: (e) =>
    if e.keyCode == 13 # On Enter
      @addNewItem()

  modClosed: (mod) =>
    @collection.remove mod

  render: =>
    @$el.html @template
    
    item_container = @$el.find(".items_list")

    for model in @collection.models
      model.on "closed", @modClosed

      item_view = new ItemView
        model: model
      item_view.render()
      item_container.append(item_view.el)

    @$el.find("input[type=text]").focus()
    @
