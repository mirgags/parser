require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'restclient'

@user = "smurphy@kellycapital.com"
@password = "kcLLC82"

File.open('links.rb', 'r') do |f1|
  linky = f1.gets
  linkarray = linky.split('^')
  linkarray[0..0].each do |i|
    resource = RestClient::Resource.new(i, @user, @password)
    page = Nokogiri::HTML(resource.get)
    links = page.css("a img")
    puts links.length
    links.each do |linky|
      puts linky.name
    end
  end
end
