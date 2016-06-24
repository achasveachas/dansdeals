class DansDeals::Deals

  def self.latest
    self.scrape_deals.first(5)
  end

  def self.scrape_deals
    deals = []

    doc = Nokogiri::HTML(open("http://www.dansdeals.com"))

    doc.css(".post").each do |post|
      deal = {
        :post_title => post.css(".posttitle").text,
        :post_body => post.css(".entry").inner_text,
        :post_url => post.css(".posttitle a").attribute("href").value
      }
      deals << deal
    end
    deals
  end
end
