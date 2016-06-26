class DansDeals::Deals
  attr_accessor :title, :body, :url
  def self.latest
    self.scrape_deals
  end

  def self.scrape_deals
    deals = []

    doc = Nokogiri::HTML(open("http://www.dansdeals.com"))

    doc.css(".post").each do |post|
      deal = self.new
      deal.title = post.css(".posttitle").text
      deal.body = post.css(".entry").inner_text
      deal.url = post.css(".posttitle a").attribute("href").value

      deals << deal
    end
    deals
  end
end
