module YandexGeocoder
  def self.get_coordinates(address:)
    res = JSON.parse RestClient.get(api_string(address))
    lat, lon = res['response']['GeoObjectCollection']['featureMember'].first['GeoObject']['Point']['pos'].split().map(&:to_f)
    [lon, lat]
  end

  def self.get_coordinates_by_ip(ip)
    ip = '78.140.60.75' if ip == '127.0.0.1'
    res = JSON.parse RestClient.get('http://ip-api.com/json/' + ip)
    [res['lat'], res['lon']]
  end

  private
  def self.api_string(params = "")
    URI::encode "https://geocode-maps.yandex.ru/1.x/?format=json&geocode=#{params}"
  end
end
