require 'anemone'
require 'sitemap_generator'

host = ARGV[1] || 'http://ayalo.aho.gt'

urls = []
Anemone.crawl(host) do |anemone|
  anemone.on_every_page do |page|
    uri = URI.parse(page.url.to_s)
    # puts uri.path
    urls << uri.path + '?' + uri.query.to_s
  end
end

# Clean up urls a bit
urls.sort!
urls.delete_at 0 # Delete root as SitemapGenerator adds it in
urls.uniq!

puts urls.count

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = host
SitemapGenerator::Sitemap.sitemaps_host = 'http://tools.ayalo.co/'
SitemapGenerator::Sitemap.filename = 'sitemap_gt'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new

SitemapGenerator::Sitemap.create do
  urls.sort.each do |url|
    add url, changefreq: 'daily'
  end
end
