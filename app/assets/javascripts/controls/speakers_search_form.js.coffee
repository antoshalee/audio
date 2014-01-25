Piece '.speakers_search_form',
  initialize: ->
    $form = $('.speakers_search_form')
    $('.speakers_search_form input').change ->
      paramsString = $form.serialize()
      $.get "/speakers/count?#{paramsString}",
      (data) ->
        console.log data
