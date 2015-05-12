require 'anemone'
require 'sitemap_generator'

host = 'http://ayalo.aho.gt'

urls = []
Anemone.crawl(host) do |anemone|
  anemone.on_every_page do |page|
    uri = URI.parse(page.url.to_s)
    # puts uri.path
    urls << uri.path
  end
end

puts urls.count

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = host

SitemapGenerator::Sitemap.create do
  urls.sort.each do |url|
    add url, changefreq: 'daily'
  end
end
