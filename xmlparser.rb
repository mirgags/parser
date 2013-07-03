require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'restclient'

@doc = Nokogiri::XML(File.open("rss_subscrip.xml"))

@doc.css("outline").each do |node|
#  if node['keys'] == "title"
  puts node.attr('title')
#  puts node.attr('xmlUrl')
  @post = Nokogiri::HTML(open(node.attr('htmlUrl')))
#  puts @post.class
  @post.xpath('//div[contains(@class, "entry-content")]').each do |el|
    el.children.each do |posttext|
#      puts posttext.name
      if posttext.name == "text"
        @fulltext = "#{puts @fulltext} #{puts posttext.content}"
      end
#      puts @fulltext
#      puts posttext.attr('innerText')
    end
#    puts el.keys
#    puts el.values
#    puts el.children[0].text
#    puts el.name
#    puts el.attr('innerText')
  end
#  @post.at('body:contains("entry-content")').text.strip do |node|
#    puts node.keys
#    puts node.attr('#text')
#  end
  

#  puts node.name
#  puts node.keys
#  puts node.values
#  end
end
puts @doc.css("outline").count

