module VkApi
  def self.get_countries
    per_page = 100
    offset = 0
    res = []

    loop do
      url = api_string('database.getCountries', need_all: 0, offset: offset, count: per_page)
      items = get_datas(url)
      break if items.count == 0
      res += items
      offset += per_page
    end

    res
  end

  def self.get_regions(country_id = 1)
    per_page = 100
    offset = 0
    res = []

    loop do
      url = api_string('database.getRegions', country_id: country_id, offset: offset, count: per_page)
      items = get_datas(url)
      break if items.count == 0
      res += items
      offset += per_page
    end

    res
  end

  def self.get_cities(country_id, region_id)
    per_page = 100
    offset = 0
    res = []

    loop do
      url = api_string('database.getCities', region_id: region_id, country_id: country_id, offset: offset, count: per_page)
      items = get_datas(url)
      break if items.count == 0
      res += items
      offset += per_page
    end
    res
  end

  private
  def self.api_string(method, params = {})
    "https://api.vk.com/method/#{method}?v=5.63&lang=ru&#{params.to_param}"
  end

  def self.get_datas(url)
    data = JSON.parse RestClient.get(url)
    data['response']['items'].map {|item| [item['id'], item['title']] }
  end
end
