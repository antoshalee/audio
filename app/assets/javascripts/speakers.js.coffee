# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

Piece '.audio-item',
  initialize: ->
    $('.toggle_favorite').click ->
      id = $(this).data('id')
      $.post "/speakers/#{id}/toggle_favorite", (data) =>
        if data.status == 'create'
          $(this).addClass('selected')
        else
          $(this).removeClass('selected')
      return false

Piece '.speakers_container',
  initialize: ->
    return
    $.get '/speakers', (data) ->
      console.log(data)
      $('.speakers_container').html(data)
      $('audio').audioPlayer();
