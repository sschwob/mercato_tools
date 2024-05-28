require 'json'
require 'net/http'
require 'uri'
require 'csv'

class ApiSwgohService
  BASE_URL = 'https://swgoh.gg/api/'

  def self.get_player_infos(ally_code)
    url = BASE_URL + "player/#{ally_code}/"
    fetch(url)
  end

  private

  def self.fetch(url)
    uri = URI.parse(url)
    req = Net::HTTP::Get.new(uri.request_uri)
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    res = https.request(req)

    return nil if res.code != "200"

    JSON.parse(res.body)
  end
end
