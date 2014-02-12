require "httparty"
require "rainbow"

class TinyUrlService
  
  attr_reader :url

  def initialize url
    @url = url
  end

  def call
    response = HTTParty.get "http://tinyurl.com/api-create.php?url=#{@url}" 
    puts "The URL is: " + response
  end
end

TinyUrlService.new("https://tutplus.com").call
