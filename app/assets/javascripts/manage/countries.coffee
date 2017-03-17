@init_countries = ->
  $('.js-add_country').on 'ajax:success', (ev, res) ->
    $('ul.countries').append res
    return

  $('.js-add_country_city').on 'ajax:success', (ev, res) ->
    $('ul.cities').append res
    return

$(document).on 'click', '.close_parent', ->
  $(this).parent().remove()

$(document).on 'click', '.slide_toggable_handler', ->
  $(this).next().slideToggle()

