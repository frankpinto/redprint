require 'anemone'
require 'sitemap_generator'

urls = []
Anemone.crawl("http://ayalo.aho.gt/") do |anemone|
  anemone.on_every_page do |page|
    uri = URI.parse(page.url.to_s)
    puts uri.path
    urls << uri.path
  end
end

puts urls.count
