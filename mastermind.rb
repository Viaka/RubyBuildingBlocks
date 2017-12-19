class Code
   def initialize(num)
       @num_numbers = num
       @code = @num_numbers.times.map{ 1 + Random.rand(4) } 
       print "correct code: #{@code}"
       puts ""
       puts "Mastermind! Enter #{num} numbers to guess the code within 12 turns to win!"
       puts "A White pin indicates a correct number in the wrong position"
       puts "A Black pin indicates a correct number in the right position"
       puts "Position of pin does not correlate to the position of numbers"
       puts "Possible numbers are between 1 and 4"
       puts "Numbers must be entered with a space between"
       puts ""
   end 
   
   def check_win(guess)
       feedback = []
       temp = []
       temp.replace(guess)
       #print "correct code: #{@code}"
       #puts " "
       guess.length.times { |x|
           if temp.include? @code[x]
              feedback.push "White"
              temp[temp.index(@code[x])] = 'Z'  
              #puts "White pin added: #{feedback}"
           end
           
           if guess[x] == @code[x]
               feedback[feedback.index("White")] = "Black"
               #puts "Black pin replaced a white: #{feedback}"
           end
       }
       if feedback.length == @num_numbers && feedback.all? {|x| x == "Black"}
           puts "You win!"
           return true
       else
           puts "Feedback array: #{feedback}"
           return false
       end
   end
   
   def play
    won = false
    turns = 12
    while !won
        case turns
        when 7..12
            puts "you have #{turns} turns remaining."
        when 2..6 
            puts "Only #{turns} more turns!"
        when 1
            puts "Last chance!"
        when 0
            puts "You lose..."
            break
        end
        
        puts "Input your guess: "
        input = gets.chomp.split.map(&:to_i)
        if input.all? { |x| x <= 4 && x > 0} && input.length == @num_numbers
            won = self.check_win(input)
            turns -= 1
        else
            puts "Invalid entry.  All #{@num_numbers} numbers must be between 1 and 4"
        end
    end
   end
end

code = Code.new(4)
code.play

