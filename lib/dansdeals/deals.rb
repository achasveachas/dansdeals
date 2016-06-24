class DansDeals::Deals
  attr_accessor :headline, :url
  def self.latest
    self.scrape_deals
  end

  def self.scrape_deals
    deals = []

    doc = Nokogiri::HTML(open("http://www.dansdeals.com"))

    doc.css(".post").each do |post|
      deal = {
        :post_title => post.css(".posttitle").text,
        :post_body => post.css(".entry").inner_text
      }
      deals << deal
    end
    binding.pry
    deals
  end
end
