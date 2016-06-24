class DansDeals::Deals
  attr_accessor :headline, :url, :dead
  def self.latest
    self.scrape_deals
  end

  def self.scrape_deals
    deals = []

    doc = Nokogiri::HTML(open("www.dansdeals.com"))

    deals
  end
end
