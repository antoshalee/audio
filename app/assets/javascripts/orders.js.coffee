Piece '.task-modal',
  initialize: ->
    $('body').append('<div class="overlay"></div>')
    $('body').append('<div class="modal" id="task-modal"></div>')

    $overlay = $('.overlay')
    $modal = $('#task-modal')

    $overlay.click ->
      $modal.fadeOut 450
      $overlay.fadeOut 450
    $('.task-modal').on 'ajax:success', (evt, data) ->

      $modal.html(data)
      $modal.find('audio').audioPlayer()
      modalHeight = $modal.height()
      windowHeight = $(window).height()
      if modalHeight >= windowHeight
        $modal.css top: $(window).scrollTop() + 10
      else
        $modal.css top: $(window).scrollTop() + (windowHeight - modalHeight) / 2
      $modal.fadeIn 450
      $overlay.fadeIn 450

      $modal.find(".close").click ->
        $modal.fadeOut 450
        $overlay.fadeOut 450