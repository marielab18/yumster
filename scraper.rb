require "open-uri"
require "nokogiri"

def fetch(url)
  html_file = URI.open(url).read
  Nokogiri::HTML(html_file)
end

food = "chicken"
url = "https://www.bbcgoodfood.com/search/recipes/page/2?q=#{food}&sort=-relevance"
html_doc = fetch url

recipes = []
html_doc.search(".standard-card-new__article-title").each do |element|
  recipes << {
    name: element.text.strip,
    url: element.attribute("href").value
  }
end

recipes.each do |recipe|
  html_doc = fetch "https://www.bbcgoodfood.com/search" + recipe[:url]
  require 'pry-byebug'
  binding.pry
end
