Piece '.order_wizard_form',
  initialize: ->
    $('.order_wizard_form_submit').click ->
    	$('.order_wizard_form').submit()
    	return false

