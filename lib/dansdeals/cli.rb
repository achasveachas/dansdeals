class DansDeals::CLI
  def call
    @counter = 1
    list_deals
    menu
    goodbye
  end

  def list_deals
    puts "Todays Deals:"
    deal = DansDeals::Deals.latest
    @list = deal[((@counter * 5) - 5)..(@counter * 5) -1].collect {|deal| deal}
    @list.each.with_index(1) do |deal, i|
      puts "#{i}. #{deal[:post_title]}"
    end
  end
  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the deal you want more info on. You can also type \"list\" to see the deals again or type \"exit\" to leave:"
      input = gets.strip.downcase
      if input.to_i.between?(1, @list.length)
        puts @list[input.to_i - 1][:post_title]
        puts @list[input.to_i - 1][:post_body]
        puts "For more info visit #{@list[input.to_i - 1][:post_url]}"
      elsif input.to_i > @list.length
        puts "Sorry, there is no such deal."
      elsif input == "list"
        list_deals
      elsif input == "more"
        @counter += 1
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
