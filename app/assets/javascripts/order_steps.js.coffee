Piece '.order_wizard_form',
  initialize: ->
    $('.order_wizard_form_submit').click ->
    	$('.order_wizard_form').submit()
    	return false

Piece '#ui-slider-time',
  initialize: ->
  	$slider = $('#ui-slider-time')
  	$slider.slider
      orientation: "horizontal",
      range: "min",
      value: $('#order_duration').val(),
      change: (event, ui) ->
        $('#order_duration').val(ui.value)
      min: 0,
      max: 50,
      step: 10


