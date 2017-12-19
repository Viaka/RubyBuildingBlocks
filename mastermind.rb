class Code
   def initialize(num)
       @num_numbers = num
       @code = @num_numbers.times.map{ 1 + Random.rand(4) } 
       print "correct code: #{@code}"
       puts ""
       puts "Welcome to Mastermind!"
       puts "Which game would you like to play?"
       self.pick
   end 
   
   def pick
       puts "[1] Guess"
       puts "[2] Create"
       input = gets.chomp(&:to_i)
       case input
       when "1"
            puts "Guessing it is! Enter #{@num_numbers} numbers to guess the code within 12 turns to win!"
            puts "A White pin indicates a correct number in the wrong position"
            puts "A Black pin indicates a correct number in the right position"
            puts "Position of pin does not correlate to the position of numbers"
            puts "Possible numbers are between 1 and 4"
            puts "Numbers must be entered with a space between"
            puts ""
            self.play
       when "2"
           puts "Creating it is!"
           puts "Create a #{@num_numbers} digit code and the computer will attempt to guess it in under 12 turns!"
           puts "Remember, all numbers must be between 1 and 4 with a space between"
           self.comp_play
       else
           puts "Invalid response. 1 to guess a code, 2 to create one!"
           self.pick
       end
   end
   
   def check_win(guess)
       @feedback = []
       temp = []
       temp.replace(guess)
       #print "correct code: #{@code}"
       puts " "
       guess.length.times { |x|
           if temp.include? @code[x]
              @feedback.push "White"
              temp[temp.index(@code[x])] = 'Z'  
              #puts "White pin added: #{feedback}"
           end
           
           if guess[x] == @code[x]
               @feedback[@feedback.index("White")] = "Black"
               #puts "Black pin replaced a white: #{feedback}"
           end
       }
       if @feedback.length == @num_numbers && @feedback.all? {|x| x == "Black"}
           puts "You win!"
           return true
       else
           puts "Feedback array: #{@feedback}"
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
   
   def comp_play
    won = false
    turns = 12
    puts "Input your code: "
    input = gets.chomp.split.map(&:to_i)
    if input.all? { |x| x <= 4 && x > 0} && input.length == @num_numbers
      @code = input
        while !won
            case turns
            when 7..12
                puts "He has #{turns} turns remaining."
            when 2..6 
                puts "Only #{turns} more turns!"
            when 1
                puts "Last chance!"
            when 0
                puts "You win!"
                break
            end
            code = self.comp_pick(turns)
            won = self.check_win(code)
            turns -= 1
        end
    else
        puts "Invalid entry.  All #{@num_numbers} numbers must be between 1 and 4"
        self.comp_play
    end
    
    
   end
   
   def comp_pick(turn)
      code = []
      correct_nums = []
      
      case turn
      when 12
        code = @num_numbers.times.map{ 4 }
        print code
        self.check_win(code)
        c_fours = @feedback.count("Black")
        w_fours = @feedback.count("White")
        t_fours = c_fours + w_fours
        return code
      when 11  
        code = @num_numbers.times.map{ 3 }
        print code
        self.check_win(code)
        c_threes = @feedback.count("Black")
        w_threes = @feedback.count("White")
        t_threes = c_threes + w_threes
        return code
      when 10
        code = @num_numbers.times.map{ 2 }
        print code
        self.check_win(code)
        c_twos = @feedback.count("Black")
        w_twos = @feedback.count("White")
        t_twos = c_twos + w_twos
        return code
      when 9
        code = @num_numbers.times.map{ 1 }
        print code
        self.check_win(code)
        c_ones = @feedback.count("Black")
        w_ones = @feedback.count("White")
        t_ones = c_ones + w_ones
        return code 
      when 8
        
      when 7
      when 6
      when 5  
      when 4
      when 3
      when 2
      when 1 
      when 0
    else return []
    end
   end
   
   
end

code = Code.new(4)


