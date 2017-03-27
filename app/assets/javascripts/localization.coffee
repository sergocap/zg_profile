@init_localization = ->
  country_id = $('#user_vk_country_id')
  region_id = $('#user_vk_region_id')
  city_id = $('#user_vk_city_id')
  country_title = $('#user_vk_country_title')
  region_title = $('#user_vk_region_title')
  city_title = $('#user_vk_city_title')

  $.ajax '/vk/get_countries',
    success: (res) ->
      set_options(country_title, res)
      #
      #инициализация существующей записи
      #if country_id.val()
        #country_title.val $(country_title.find($('option[data-id='+country_id.val()+']'))).val()
        #country_title.trigger('chosen:updated')

        #if region_id.val()
          #ajax_update_region(false)
          #region_title.val $(region_title.find($('option[data-id='+region_id.val()+']'))).val()
          #region_title.trigger('chosen:updated')

          #if city_id.val()
            #ajax_update_city(false)
            #city_title.val $(city_title.find($('option[data-id='+city_id.val()+']'))).val()
            #city_title.trigger('chosen:updated')

  country_title.on 'change', ->
    country_id.val get_data_id($(this))
    refresh_element 'region'
    refresh_element 'city'

    return if $(this).val() == ""
    ajax_update_region(true)

  region_title.on 'change', ->
    region_id.val get_data_id($(this))
    refresh_element 'city'

    return if $(this).val() == ""
    ajax_update_city(true)

  city_title.on 'change', ->
    city_id.val get_data_id($(this))

  ajax_update_region = (async) ->
    $.ajax '/vk/get_regions',
      async: async
      data:
        country_id: country_id.val()
      success: (res) ->
        set_options(region_title, res)

  ajax_update_city = (async) ->
    $.ajax '/vk/get_cities',
      async: async
      data:
        country_id: country_id.val()
        region_id:  region_id.val()
      success: (res) ->
        set_options(city_title, res)

get_data_id = (e) ->
  e.find($('option[value="' + e.val() + '"]')).data('id')

set_options = (select_box, datas) ->
  $.each(datas, (key, data) ->
    select_box.append($("<option></option>").attr({"data-id": data[0], value: data[1]}).text(data[1])))

  select_box.trigger("chosen:updated")

refresh_element = (name) ->
  elem_id =    $('#user_vk_'+name+'_id')
  elem_title = $('#user_vk_'+name+'_title')
  elem_title.val('')
  elem_title.empty()
  elem_title.trigger("chosen:updated")
  elem_id.val('')




