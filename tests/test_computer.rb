require 'minitest/autorun'
require_relative '../src/computer'
require_relative '../src/tic-tac-toe'

describe Computer do
    it 'has a name' do
        computer = Computer.new('O')
        name = computer.name

        assert_equal 'O', name
    end

    it 'gets a position for the best move' do
        game = TicTacToe.new
        computer = Computer.new('O')
        game.board.board = ['X', 'X', 'O', 'O', 'O', 'X', 6, 7, 'X']
        
        location = computer.getPosition(game.board)
        
        assert_equal 6, location
    end

    it 'has a move method that records a move in the right location on the board' do
        game = TicTacToe.new
        computer = Computer.new('O')
        game.board.board = ['X', 'X', 'O', 'O', 'O', 'X', 6, 7, 'X']
        
        computer.move(game.board)

        assert_equal 'O', game.board.getPlay(6)
    end
end