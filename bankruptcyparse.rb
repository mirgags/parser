require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'restclient'

puts html
resource = RestClient::Resource.new('http://www.google.com/search?q=business-bankruptcies.com+golden+park', 'User-Agent' => 'Firefox/3.0.15')
page = Nokogiri::HTML(resource.get)
links = page.css("h3.r a")
#puts links.length
#puts links.class
attributehash = links[0].attributes
uri = attributehash['href'].to_s
startchar = uri.index('q=') + 2
endchar = uri.index('&')
puts startchar
puts endchar
uri = uri[startchar...endchar]
#puts uri[startchar...endchar]
puts uri
resource = RestClient::Resource.new(uri, 'User-Agent' => 'Firefox/3.0.15')
page = Nokogiri::HTML(resource.get)
    links = page.css("dl.basic_info").children
    links.each do |thing|
      puts thing.text
    end
#puts links.length

print "Here's the last one"
print links[8].text
print links[10].text
