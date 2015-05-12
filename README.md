# Redprint

Ever just wanted to point something at a website and get a sitemap? Well. This does that for you.

## Usage
Edit config/sitemap.rb and replace the value host with the site you want to crawl, then:

    rake sitemap:create

This will create a sitemap in public/. If you have an existing sitemap, run the following:

    rake sitemap:refresh:no_ping
