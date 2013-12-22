window.audio ||= {}
window.audio.pieces = []

window.Piece = (selector, object) ->
  @selector = selector
  @object = object
  window.audio.pieces.push({ selector, object })

jQuery ->
  for piece in window.audio.pieces
  	if $(piece.selector).size() > 0
  		if jQuery.isFunction(piece.object.initialize)
  			piece.object.initialize.apply(piece.object)
