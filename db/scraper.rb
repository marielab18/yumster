require "open-uri"
require "nokogiri"

def fetch(url)
  html_file = URI.open(url).read
  Nokogiri::HTML(html_file)
end

def scrape(food, number = 5)
  url = "https://www.bbcgoodfood.com/search/recipes/page/2?q=#{food}&sort=-relevance"
  html_doc = fetch url

  recipes = []
  html_doc.search(".standard-card-new__article-title").first(number).each do |element|
    recipes << {
      name: element.text.strip,
      url: element.attribute("href").value
    }
  end

  recipes.map do |recipe|
    html_doc = fetch "https://www.bbcgoodfood.com" + recipe[:url]
    image_selector =  selector = "#__next > div.default-layout > main > div > section > div > div.post-header__image-container > div > div > picture > img"
    {
      image_url: html_doc.search(selector).first.attributes['src'].value,
      name: recipe[:name],
      instructions: html_doc.search('.recipe__method-steps .grouped-list__list li div').map(&:text).join("\n"),
      description: html_doc.search('.post-header__body .editor-content').text,
      minutes: html_doc.search('time').first.text.gsub(/\D/, '').to_i,
      nutritional_info: html_doc.search('table.key-value-blocks tr td').map(&:text).each_slice(2).map { |e| e.join(': ') }.join("\n"),
    }
  end
end
