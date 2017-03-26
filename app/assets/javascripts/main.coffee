$ ->
  init_countries() if $('.js-add_country, .js-add_country_city').length
  init_localization() if $('.js-set_localization').length
  true
