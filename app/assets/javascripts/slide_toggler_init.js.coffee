$ ->
  $('.js-next_slide_toggle_handler').on 'click', ->
    $(this).nextAll('.js-slide_toggable').slideToggle()
