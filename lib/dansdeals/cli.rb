class DansDeals::CLI
  def call
    @counter = 1    #@counter is needed so that the #list_deals method, which lists 5 deals at a time, should list the right 5.
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
      puts "Enter the number of the deal you want more info on. You can also type \"list\" to see the deals again, \"next\" to see the next 5 deals, or \"previous\" to see the last 5 deals. Type \"exit\" to leave:"
      input = gets.strip.downcase
      case 
      when input.to_i.between?(1, 5)
        puts @list[input.to_i - 1][:post_title]
        puts @list[input.to_i - 1][:post_body]
        puts "For more info visit #{@list[input.to_i - 1][:post_url]}"
      when input.to_i > 5
        puts "Sorry, there is no such deal."
      when input == "list"
        list_deals
      when input == "next"
        @counter += 1
        list_deals
      when input == "previous"
        @counter > 1 ? @counter -= 1 : puts("You are at the beginning of the list.")
        list_deals
      when input == "exit"
      else
        puts "Sorry, I didn't get that."
      end
    end
  end

  def goodbye
    puts "Thanks for stopping by, see you soon!"
  end
end
