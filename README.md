# Redprint

Ever just wanted to point something at a website and get a sitemap? Well. This does that for you.

## Configuration / Setup

Steps:

1. Copy `.env.example` to `.env`.
2. Fill in your AWS credentials and S3 bucket where you want to store the sitemaps
3. Run `bundle`


## Usage
Edit config/sitemap.rb and replace the value host with the site you want to crawl, then:

    rake sitemap:create

This will create a sitemap in public/ and send it to S3. If you have an existing sitemap, run the following:

    rake sitemap:refresh:no_ping
