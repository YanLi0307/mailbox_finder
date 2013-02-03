class CrawlerCache < ActiveRecord::Base
  attr_accessible :page_content, :url
end
