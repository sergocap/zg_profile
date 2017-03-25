module VkApi
  def self.get_countries
    per_page = 100
    offset = 0
    res = []

    loop do
      url = api_string('database.getCountries', need_all: 0, v: '5.63', lang: 'ru', offset: offset, count: per_page)
      data = JSON.parse RestClient.get(url)
      items = data['response']['items'].map {|item| [item['title'], item['id']]}
      print items.count
      break if items.count == 0
      res += items
      offset += per_page
    end

    res
  end

  def self.get_cities(country_id = 1, q = "")
    per_page = 10
    offset = 0
    url = api_string('database.getCities', q: q, country_id: country_id, v: '5.63', lang: 'ru', offset: offset, count: per_page)
    data = JSON.parse RestClient.get(url)
    res = data['response']['items'].map {|item| { label: item['title'], value: item['id']}}
    res
  end

  def self.api_string(method, params = {})
    "https://api.vk.com/method/#{method}?#{params.to_param}"
  end
end
