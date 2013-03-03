require 'open-uri' 

module CrawlerHelper

  def create_or_load_from_cache url
    cache = CrawlerCache.find_or_initialize_by_url(url) 
    if cache.new_record?
      cache.page_content = open(url).read
      cache.save!
    end

    cache
  end

  def crawl url
    start = Time.now
    Nokogiri::HTML(create_or_load_from_cache(url).page_content)
    ap "took #{Time.now - start}"
    
    rescue => ex 
    ap ex
  end

  def strip_spaces text
    text.gsub /\s+$/, ""
  end
end
