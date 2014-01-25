Piece '.speakers_search_form',
  initialize: ->
    $form = $('.speakers_search_form')
    $('.speakers_search_form input').change ->
      paramsString = $form.serialize()
      $.get "/speakers/count?#{paramsString}",
      (data) ->
        str = utils.pluralize(data.count, 'предложение', 'предложения', 'предложений')
        $('.speakers_search_form_submit').text("Показать #{data.count} #{str}")

