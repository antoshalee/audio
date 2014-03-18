Piece '.speakers_search_form',

  initialize: ->
    @initSwitchers()
    $form = $('.speakers_search_form')
    $('.speakers_search_form input:not(.group_switcher)').change =>
      @getCount()

  getCount: ->
    $form = $('.speakers_search_form')
    paramsString = $form.serialize()
    $.get "/speakers/count?#{paramsString}",
    (data) ->
      str = utils.pluralize(data.count, 'предложение', 'предложения', 'предложений')
      $('.speakers_search_form_submit').text("Показать #{data.count} #{str}")

  initSwitchers: ->
    $form = $('.speakers_search_form')
    $switchers = $form.find(':input.group_switcher')

    $switchers.each (_, el) =>
      @refreshGroup($(el))

    $switchers.click (event) =>
      @refreshGroup($(event.target))
      @getCount()

  refreshGroup: ($switcher) ->
    group = $switcher.data('rel-group')
    checked = $switcher.is(':checked')

    $container = $(".display_switchable[data-group='#{group}']")
    inputs = $container.find(":input")

    if checked
      $container.hide()
      inputs.each -> $(this).prop('disabled', true)
    else
      $container.show()
      inputs.each -> $(this).prop('disabled', false)
