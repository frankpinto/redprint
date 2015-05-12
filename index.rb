require 'anemone'
require 'sitemap_generator'

how_many = 0
Anemone.crawl("http://ayalo.aho.gt/") do |anemone|
  anemone.on_every_page do |page|
      how_many += 1
  end
end
puts how_many
