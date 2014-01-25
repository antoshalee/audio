Piece '.toggle-btn',
  click: ->
    target = $($(this).data("target"))
    target.toggle()
    return false