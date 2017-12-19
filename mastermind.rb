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
       @feedback = @num_numbers.times.map{"Empty"}
       tempG = []
       tempG.replace(guess)
       print "correct code: #{@code}"
       puts " "
       guess.length.times { |x|
            
           if guess[x] == @code[x]
               @feedback[x] = "Black"
               tempG[x] = 'B'
               #puts "Black pin replaced a white: #{@feedback}"
           elsif tempG.include? @code[x]
              @feedback[tempG.index(@code[x])] = "White"
              tempG[tempG.index(@code[x])] = 'W'  
              #puts "White pin added: #{tempG}"
            else 
              #@feedback.push "Empty"
              #puts "Empty added"
           end
           
           
       }
       if @feedback.length == @num_numbers && @feedback.all? {|x| x == "Black"}
           puts "Code found!: #{@code}"
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
    if won 
      puts "You win!" 
    end
   end
   
   def comp_play
    won = false
    turns = 12
    comp_code = @num_numbers.times.map{ 1 + Random.rand(4) }
    #comp_code = [1, 1, 2, 2]
    
    puts "Input your code: "
    input = gets.chomp.split.map(&:to_i)
    if input.all? { |x| x <= 4 && x > 0} && input.length == @num_numbers
      @code = input
      
      #Computer guess loop
        while !won
            pos_found = [0, 0, 0, 0]
            numbers_found = []
            
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
            sleep(0.25)
            puts "Guessing #{comp_code}"
            won = self.check_win(comp_code)
            turns -= 1
            
            #Evaluate feedback
            @feedback.each_with_index { |val, index| 
            
            if val == "Black"
              pos_found[index] = comp_code[index]
            elsif val == "White"
              numbers_found.push(comp_code[index])
            else end
            }
            
            #assign confirmed numbers/positions
            comp_code.replace(pos_found)
            dice = (numbers_found.length > 0) ? Random.rand(numbers_found.length) : 0
            pos_found.each_with_index { |val, index|
              if val == 0
                comp_code[index] = numbers_found.delete_at(dice) || (1 + Random.rand(4))
              end
            }
            
        end
        if won 
          puts "Computer Wins!" 
        end
    else
        puts "Invalid entry.  All #{@num_numbers} numbers must be between 1 and 4"
        self.comp_play
    end
    
    
   end
   
   
   
   
end

code = Code.new(4)


