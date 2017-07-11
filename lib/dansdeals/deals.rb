class DansDeals::Deals
  attr_accessor :title, :body, :url
  def self.latest
    self.scrape_deals
  end

  def self.scrape_deals

    doc = Nokogiri::HTML(open("http://www.dansdeals.com"))

    doc.css(".td_module_10").collect do |post|
      deal = self.new
      deal.title = post.css("h3.entry-title").text
      deal.body = post.css(".td-excerpt").first.inner_text.strip
      deal.url = post.css("h3 a").attribute("href").value

      deal
    end
  end
end
