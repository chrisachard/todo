
Item = require "models/item"

ItemCollection = require "collections/items"

ItemCollectionView = require "views/items/item_collection"


App =
  init: ->
    first_thing = new Item
      name: "First Thing"

    second_thing = new Item
      name: "Second Thing"

    items = new ItemCollection
    items.add first_thing
    items.add second_thing

    items_view = new ItemCollectionView
      collection: items
    
    items_view.render()


module.exports = App

