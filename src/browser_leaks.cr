require "http/client"

module BrowserLeaks
  API_URL = "https://browserleaks.com/api"
  IP_API_URL  = "https://rdap.db.ripe.net/ip"

  private def self.get(url : String) : String
    response = HTTP::Client.get(url)
    if response.status.success?
      response.body
    else
      "Error: #{response.status_code}"
    end
  rescue ex
    "Request failed: #{ex.message}"
  end

  def self.get_ip_hostname(ip : String) : String
    get("#{API_URL}/hostname/#{ip}")
  end

  def self.get_ip_info(ip : String) : String
    get("#{IP_API_URL}/#{ip}")
  end
end
