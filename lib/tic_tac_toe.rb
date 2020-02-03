class TicTacToe
  WIN_COMBINATIONS = [ [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]]
  
  def initialize
    @board = Array.new(9, " ")
  end 
  
   def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    (input.to_i ) - 1 
  end 
  
  def move(index, user_value = "X")
    @board[index] = user_value
  end 
  
  def position_taken?(index)
    if @board[index] == " "
      false
    else  
      true
    end 
  end 
  
  def valid_move?(position)
    if !(position_taken?(position)) && position.between?(0,8)
      true
    else 
      false
    end 
  end 
  
  def turn 
    puts "please type in a number from 1-9"
   
    user_input = gets.chomp
    position = input_to_index(user_input)
    if valid_move?(position) 
      user_value = current_player
      move(position, user_value) 
       display_board
    else 
      turn 
    end 
  end 
   
  def turn_count
    @board.count{ |x| x != " "}
  end 
    
  def current_player
    x = turn_count
     x % 2 == 0 ? "X" : "O"
   end 
   
   def won?
      WIN_COMBINATIONS.each do |win_combos|
        index_1 = win_combos[0]
        index_2 = win_combos[1]
        index_3 = win_combos[2]
        
        position1 = @board[index_1]
        position2 = @board[index_2]
        position3 = @board[index_3]
        
        if (position1 == "X" && position2 == "X" && position3 == "X") 
          return win_combos
          elsif (position1 == "O" && position2 == "O" && position3 == "O")
          return win_combos
           
        end
      
      end
      return false
    end 
    
    def full?
      @board.all? do |letter|
        letter == "X" || letter == "O"
      end 
     
    end 
    
    def draw?
     
     if full? && !won?
       return true
     else 
       return false 
     end 
     
    end 
       
    def over?
      if won? || draw?
        return true
      else 
        return false
      end 
    end 
    
    def winner
      
      index = won?
      if index == false
        return nil
      elsif @board[index[0]] == "X"
        return "X"
      elsif @board[index[0]] == "O"
        return "O"
      end 
    
    end 
    
    def play 
      until over?
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
       puts "Cat's Game!"
     end 
    end
  
    
end 