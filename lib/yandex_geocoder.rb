module YandexGeocoder
  def self.get_coordinates(address:)
    res = JSON.parse RestClient.get(api_string(address))
    res['response']['GeoObjectCollection']['featureMember'].first['GeoObject']['Point']['pos'].split().map(&:to_f)
  end

  private
  def self.api_string(params = "")
    URI::encode "https://geocode-maps.yandex.ru/1.x/?format=json&geocode=#{params}"
  end
end
