Piece '#ui-slider-voice',
  initialize: ->

    $item = $("#ui-slider-voice")

    console.log($("#user_speaker_attributes_timbre_level").val())
    $item.slider
      orientation: "horizontal"
      range: "min"
      min: 0
      max: 2
      step: 1
      value: $("#user_speaker_attributes_timbre_level").val()
      change: (event, ui) ->
        $("#user_speaker_attributes_timbre_level").val ui.value
