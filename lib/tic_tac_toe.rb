WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board(arr)
  puts " #{arr[0]} | #{arr[1]} | #{arr[2]} "
  puts "-----------"
  puts " #{arr[3]} | #{arr[4]} | #{arr[5]} "
  puts "-----------"
  puts " #{arr[6]} | #{arr[7]} | #{arr[8]} "
end

def input_to_pos(num)
  num.to_i - 1
end

def move(board, pos, char)
  board[pos] = char
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, pos)
  (pos.between?(0,8) && !position_taken?(board, pos)) ? true : false
end

def turn_count(board)
  board.count { |pos| pos == 'X' || pos == 'O' }
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def turn(board)
  puts 'Please enter 1-9:'
  input = gets.strip
  pos = input_to_index(input)
  if valid_move?(board, pos)
    move(board, pos, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end
