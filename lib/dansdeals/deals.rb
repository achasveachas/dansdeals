class DansDeals::Deals
  attr_accessor :title, :body, :url
  def self.latest
    self.scrape_deals
  end

  def self.scrape_deals

    doc = Nokogiri::HTML(open("https://www.dansdeals.com/all/"))

    doc.css(".td_module_15").collect do |post|
      deal = self.new
      deal.title = post.css("h1.entry-title").text
      deal.body = post.css(".td-post-content").first.inner_text.strip
      deal.url = post.css("h1.entry-title a").attribute("href").value

      deal
    end
  end
end
