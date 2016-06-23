class DansDeals::Deals
  attr_accessor :headline, :url, :dead
  def self.latest


    deal_1 = self.new
    deal_1.headline = "Raffle To Win $25,000 Has Been Launched!"
    deal_1.url = "http://www.dansdeals.com/archives/90042"
    deal_1.dead = false

    deal_2 = self.new
    deal_2.headline = "50% Off Plus $14.99 Off Any Shutterfly Hardcover Photo Book!"
    deal_2.url = "http://www.dansdeals.com/archives/90064"
    deal_2.dead = true

    [deal_1, deal_2]
  end
end
