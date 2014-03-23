speakerSubformHandler = ->
  $subform = $('.speaker_subform')
  speaker_inputs = $subform.find(':input')
  if $('#toggle_speaker_form_chbx').is(':checked')
    $subform.show()
    speaker_inputs.each -> $(this).prop('disabled', false)
  else
    $subform.hide()
    speaker_inputs.each -> $(this).prop('disabled', true)
  return true

Piece '.registration-layout',
  initialize: ->
    $fileHolder = $('.file-upload-holder')
    position = $('.item-file-upload-cap').position()
    $fileHolder.css
      top: position.top + 170
      left: 161

    $('.speaker_subform').hide()
    $('.speaker_subform').find(':input').each -> $(this).prop('disabled', true)
    $('#toggle_speaker_form_chbx').attr('checked', false)
    $('#toggle_speaker_form_chbx').change(speakerSubformHandler)

Piece '.checkbox-lock',
  initialize: ->
    $(".checkbox-lock").each ->
      check = ->
        if $checkbox.is(":checked")
          $items.addClass("disabled").attr disabled: "disabled"
        else
          $items.removeClass("disabled").removeAttr "disabled"
        return
      $holder = $(this)
      $checkbox = $holder.find("input[type=\"checkbox\"]")
      $items = $holder.find(".item-input-text input")
      check()
      $checkbox.change ->
        check()
        return
      return
