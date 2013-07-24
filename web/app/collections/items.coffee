
Item = require "models/item"

module.exports = class ItemsController extends Backbone.Collection

  model: Item

  initialize: => 

  addNewItem: (itemName) =>
    return if itemName == ""
    new_item = new Item
      name: itemName
    @add new_item
    new_item
