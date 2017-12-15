class Board
   def initialize
      @state = [] 
      9.times do @state.push " " end
      puts "7|8|9"
      puts "-----"
      puts "4|5|6"
      puts "-----"
      puts "1|2|3"
      
   end
   
   def mark(current_player, pos)
       if current_player && @state[pos-1] == " "
           @state[pos-1] = "X"
           self.draw_board
           puts "X placed in position #{pos}"
           return true
       elsif !current_player && @state[pos-1] == " "
           @state[pos-1] = "O"
           self.draw_board
           puts "O placed in position #{pos}"
           return true
       else 
           puts "Position Taken!"
           return false
       end
   end
   
   def check_win
      if (@state[0] != " " && @state[0] == @state[1] && @state[1] == @state[2]) || #123
         (@state[0] != " " && @state[0] == @state[4] && @state[4] == @state[8]) || #159
         (@state[0] != " " && @state[0] == @state[3] && @state[3] == @state[6]) || #147
         (@state[1] != " " && @state[1] == @state[4] && @state[4] == @state[7]) || #258
         (@state[2] != " " && @state[2] == @state[4] && @state[4] == @state[6]) || #357
         (@state[2] != " " && @state[2] == @state[5] && @state[5] == @state[8]) || #369
         (@state[3] != " " && @state[3] == @state[4] && @state[4] == @state[5]) || #456
         (@state[6] != " " && @state[6] == @state[7] && @state[7] == @state[8])    #789
         return true
      else
         return false
      end
   end
   
   def draw_board
       10.times do puts " " end
       puts "#{@state[6]}|#{@state[7]}|#{@state[8]}"
       puts "-----"
       puts "#{@state[3]}|#{@state[4]}|#{@state[5]}"
       puts "-----"
       puts "#{@state[0]}|#{@state[1]}|#{@state[2]}"
   end
end

board = Board.new
player = true
i = 0
while !board.check_win && i < 9
    puts "Player #{player ? 1 : 2}'s turn.  Please enter position to mark an #{player ? "X" : "O"}"
    input = gets.chomp
    if input =~ /\d/
        if board.mark(player, input.to_i%10)
            player = !player
            i += 1
        end
    else puts "Invalid input, please enter a number between 1 and 9"
    end
end
puts board.check_win ? "Player #{player ? 2 : 1} wins!" : "Cat's Game =("
puts "Game Over!"