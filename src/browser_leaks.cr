require "json"
require "http/client"

class BrowserLeaks
  API_URL = "https://browserleaks.com"
  IP_API_URL = "https://rdap.db.ripe.net/ip"

  def initialize
    @headers = HTTP::Headers{
      "Content-Type" => "application/json",
      "Accept" => "application/json",
      "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36"
    }
  end

  def get_ip_hostname(ip : String) : JSON::Any
    JSON.parse(
      HTTP::Client.get("#{API_URL}/api/hostname/#{ip}", headers: @headers).body)
  end

  def get_ip_info(ip : String) : String
    HTTP::Client.get("#{IP_API_URL}/#{ip}", headers: @headers).body
  end
end
