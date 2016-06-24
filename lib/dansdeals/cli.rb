class DansDeals::CLI
  def call
    list_deals
    menu
    goodbye
  end

  def list_deals
    puts "Todays Deals:"
    @deal = DansDeals::Deals.latest
    @deal.each.with_index(1) do |deal, i|
      print_deal =  "#{i}. #{deal.headline}"
      print_deal << " - DEAD" if deal.dead
      puts print_deal
    end
  end
  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the deal you want more info on. You can also type \"list\" to see the deals again or type \"exit\" to leave:"
      input = gets.strip.downcase
      if input.to_i.between?(1, @deal.length)
        puts @deal[input.to_i - 1]
      elsif input.to_i > @deal.length
        puts "Sorry, there is no such deal."
      elsif input == "list"
        list_deals
      elsif input == "exit"
      else
        puts "Sorry, I didn't get that."
      end
    end
  end
  def goodbye
    puts "Thanks for stopping by, see you soon!"
  end
end
