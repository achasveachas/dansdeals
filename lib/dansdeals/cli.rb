class DansDeals::CLI
  def call
    list_deals
    menu
    goodbye
  end

  def list_deals
    puts "Todays Deals:"
    puts <<-DOC.gsub /^\s*/, ''
      1. Raffle To Win $25,000 Has Been Launched!
      2. 50% Off Plus $14.99 Off Any Shutterfly Hardcover Photo Book!
      3. Save $10 Off $150 Or $20 Off $300 Of AMEX Gift Cards At Office Depot Or Office Max Stores - DEAD
      4. American: Philadelphia To/From Fort Lauderdale Or Miami For $58 Each Way
      5. Buy $300 In Visa Gift Cards From Staples This Week And Get A Free $15 Visa Gift Card Via Easy Rebate - DEAD
    DOC
  end
  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the deal you want more info on or type list to see the deals again or type exit:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "more info on deal 1..."
      when "2"
        puts "more info on deal 2..."
      when "3"
        puts "more info on deal 3..."
      when "4"
        puts "more info on deal 4..."
      when "5"
        puts "more info on deal 5..."
      when "list"
        list_deals
      when "exit"
      else
        puts "Sorry, I didn't get that."
      end
    end
  end
  def goodbye
    puts "Thanks for stopping by, see you soon!"
  end
end
