require 'anemone'
require 'sitemap_generator'

host = 'http://ayalo.aho.gt'

urls = []
Anemone.crawl(host) do |anemone|
  anemone.on_every_page do |page|
    uri = URI.parse(page.url.to_s)
    puts uri.path
    urls << uri.path
  end
end

puts urls.count

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = host

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
