# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

Piece '.piece_speakers_container',
  initialize: ->
    $.get '/speakers', (data) ->
      console.log(data)
      $('.piece_speakers_container').html(data)
      $('audio').audioPlayer();


