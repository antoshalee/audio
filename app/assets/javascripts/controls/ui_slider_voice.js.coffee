Piece '#ui-slider-voice',
  initialize: ->
    $item = $("#ui-slider-voice")
    $input = $($item.data('input-selector'))

    $item.slider
      orientation: "horizontal"
      range: "min"
      min: 0
      max: 2
      step: 1
      value: $input.val()
      change: (event, ui) ->
        $input.val ui.value
