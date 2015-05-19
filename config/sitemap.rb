require 'dotenv'
require 'anemone'

# Credentials in .env files
Dotenv.load
SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new
# Set the host name for URL creation
SitemapGenerator::Sitemap.sitemaps_host = 'http://tools.ayalo.co.s3-website-us-east-1.amazonaws.com/'
SitemapGenerator::Sitemap.public_path = 'public/'
SitemapGenerator::Sitemap.verbose = true

def generate_sitemap host
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

  print 'URL count: ', urls.count, "\n"

  return urls
end

hosts = {'http://ayalo.aho.gt' => 'sitemap_gt', 'http://ayalo.aho.mx' => 'sitemap_mx'}
hosts.each_pair do |host, filename|
  SitemapGenerator::Sitemap.default_host = host
  SitemapGenerator::Sitemap.filename = filename

  urls = generate_sitemap host
  SitemapGenerator::Sitemap.create do
    urls.sort.each do |url|
      add url, changefreq: 'daily'
    end
  end
end

