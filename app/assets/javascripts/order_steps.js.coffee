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

Piece '.order_wizard_text',
  initialize: ($el) ->
    $textarea = $el.find('textarea')
    $textarea.keyup ->
      words = $textarea.val().split(/\s+/).length
      seconds = if words > 0 then Math.floor(words/2) + 1 else 0
      seconds_word = utils.pluralize(seconds, 'секунда', 'секунды', 'секунд')
      $('.seconds_label').text("#{seconds} #{seconds_word}")

Piece ".item-accent-text",
  initialize: ->
    refreshMarkedText = ->
      html_with_text = $(".item-accent-text").clone()
      html_with_text.find(".click").each ->
        $span = $(this)
        if $span.hasClass('selected')
          $span.removeClass('click')
        else
          $span.replaceWith($span.text())
      $('#order_marked_text').val(html_with_text.html())

    originalText = $(".item-accent-text").html().trim()
    vowels = ["а", "е", "и", "о", "у", "ы", "э", "ю", "я"]
    newText = ""

    for char, i in originalText.split ''
      if $.inArray(char, vowels) > -1
        newText += "<span class='click'>#{char}</span>"
      else
        newText += char
    $(".item-accent-text").html newText
    $(".item-accent-text").find(".click").click ->
      $(this).toggleClass "selected"
      refreshMarkedText()


