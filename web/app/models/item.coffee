
module.exports = class Item extends Backbone.Model

  initialize: -> 

  close: () =>
    @trigger "closed", @


    