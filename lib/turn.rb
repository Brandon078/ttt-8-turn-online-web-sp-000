require "pry"
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input = input.to_i - 1
end

def valid_move?(board, position)
#binding.pry
  if position.to_i.between?(0,8)
    if !position_taken?(board, position.to_i)
      true
    else
      false
    end
  end
end
#position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)

def position_taken?(board, location)
 if (board[location] == " " || board[location] == "" || board[location] == nil)
   false
 else
   true
 end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(board, input)
    move(board, input)
  else turn(board)
  end
  display_board
end

def move(board, location, current_player)
  board[location.to_i-1] = current_player
  expect(board).to eq(["O", " ", " ", " ", " ", " ", " ", " ", "X"])
end
