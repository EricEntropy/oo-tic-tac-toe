class TicTacToe

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5], 
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7], 
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6] ]

    def initialize(board = nil)
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
        turn = input.to_i - 1
        turn
    end 

    def move(index, token = "X")
        @board[index] = token
    end 

    def position_taken?(index)
        #check the board for X or O 
        if ["X", "O"].include?(@board[index])
            return true 
        else 
            return false 
        end 
    end 

    def valid_move?(index)
        position = position_taken?(index)
        #if correct index and position is not taken
        if index.between?(0, 8) && !position
            return true 
        else 
            false 
        end 
    end 

    def turn_count
        exs = @board.count("X")
        ohs = @board.count("O")
        count = exs + ohs
    end 

    def current_player
        if turn_count % 2 == 0
            return "X"
        else 
            return "O"
        end 
    end 

    def turn 
        input = gets.chomp 
        turn = input_to_index(input)
        if valid_move?(turn)
            token = current_player
            move(turn, token)
            display_board
        else
            input = gets.chomp
        end 
    end 

    def won?
        WIN_COMBINATIONS.detect do |indices|
            # the "*"" turns indices array into arguments for .values_at
            win_index = @board.values_at(*indices)
            win_index.all?('X') || win_index.all?('O')
          end
    end 

    def full?
        #use turn_count to check if board is full since there is only 9 turns in game 
        if turn_count >= 9
            return true
        end             
    end 

    def draw?
        if won? 
            return false 
        elsif 
            full? 
            return true 
        end 
    end 

    def over? 
        if won? || draw? 
            return true 
        end 
    end 

    def winner
        #invert the player token with %
        if over?    
            return "O" if turn_count % 2 == 0
            return "X" if turn_count % 2 == 1
        elsif draw? 
            return nil 
        end 
    end 

    def play
        display_board
        while !over? 
            turn 
        end
        if over? && draw?
            puts "Cat's Game!" 
        else 
            puts "Congratulations #{winner}!"
        end
    end 
end 
