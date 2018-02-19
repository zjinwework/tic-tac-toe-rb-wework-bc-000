WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "------------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "------------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(value)
  return value.to_i-1
end 

def move(board,index,player)
  board[index] = player
end

def position_taken?(board,index)
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board,index)
  if index <= 8 && index >= 0
    (not position_taken?(board,index))
  else
    false
  end
end 

def turn(board)

  puts "Please enter 1-9:"
  index = input_to_index(gets)
  
  if valid_move?(board,index)
    move(board,index,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  board.count do |value|
    value == "X" || value == "O"
  end
end 

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else 
    return "O"
  end
end 

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    all_x = combo.all? do |index|
      board[index] == 'X'
    end
    all_o = combo.all? do |index|
      board[index] == "O"
    end
    # if all_x && all_o
    #   return false
    # elsif all_x || all_o
    if all_o || all_x
      return combo
    end
  end
  return false
end

def full?(board)
  board.all? do |value|
    value == "X" || value == "O"
  end
end

def draw?(board)
  full?(board) && (not won?(board))
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  combo = won?(board)
  if combo
    return board[combo[0]]
  end
end

def play(board)

  is_over = false
  # display_board(board)
  
  # while (not is_over)
    turn(board)
    over?(board)
    # turn(board)
    over?(board)
    # turn(board)
    over?(board)
  # end
  # board = ["X"," "," ","X"," "," ","X"," "," "]
  
  if won?(board)
    winner = winner(board)
    puts "Congratulations #{winner}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end