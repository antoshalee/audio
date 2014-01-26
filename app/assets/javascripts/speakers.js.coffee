# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

Piece '.speakers_container',
  initialize: ->
    return
    $.get '/speakers', (data) ->
      console.log(data)
      $('.speakers_container').html(data)
      $('audio').audioPlayer();


