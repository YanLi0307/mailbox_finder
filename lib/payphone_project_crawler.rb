class PayphoneProjectCrawler
  STATES = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY", "AS", "DC", "FM", "GU", "MH", "MP", "PW", "PR", "VI"]
  ROOT_URL = "http://payphone-project.com/mailboxes/states/WA/"
  HOST_NAME = "http://" + URI.parse(ROOT_URL).hostname
  class << self
    include CrawlerHelper
    def fetch
      page = crawl ROOT_URL

      links = page.css(".mailbox_state td").first
      links = links.css("a")
      links = links.select{ |l| l.text.length > 1 }

      links.each do |l|
        parse_city crawl(HOST_NAME + l[:href])
        sleep 10
      end
    end

    def parse_city city_page
      links = city_page.css(".address_highlight a")

      links.each do |l|
        parse_mailbox crawl(HOST_NAME + l[:href])
        sleep 10
      end
    end

    def parse_mailbox mailbox_pages
      address = strip_spaces(mailbox_pages.css(".mailbox_table_right")[1].css("td")[1].text)
      pickup_times = strip_spaces(mailbox_pages.css(".scheduled_pickups td")[1].text)
      ap "Address"  
      ap address
      ap "Pickup Times"
      ap pickup_times
      ap "========================="
      # scheduled_pickups
      #mailbox_table_right
    end
  end
end
