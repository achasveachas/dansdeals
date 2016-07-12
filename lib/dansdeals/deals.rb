class DansDeals::Deals
  attr_accessor :title, :body, :url
  def self.latest
    self.scrape_deals
  end

  def self.scrape_deals

    doc = Nokogiri::HTML(open("http://www.dansdeals.com"))

    doc.css(".post").collect do |post|
      deal = self.new
      deal.title = post.css(".posttitle").text
      deal.body = post.css(".entry").inner_text.strip
      deal.url = post.css(".posttitle a").attribute("href").value

      deal
    end
  end
end
