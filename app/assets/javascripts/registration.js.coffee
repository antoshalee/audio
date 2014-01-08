Piece '.registration-layout',
  initialize: ->
    $fileHolder = $('.file-upload-holder')
    position = $('.item-file-upload-cap').position()
    $fileHolder.css
      top: position.top + 170
      left: 161