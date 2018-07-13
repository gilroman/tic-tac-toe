require 'minitest/autorun'
require_relative '../src/computer'
require_relative '../src/tic-tac-toe'

describe Computer do
    it 'has a name' do
        computer = Computer.new('O')
        name = computer.name
        assert_equal 'O', name
    end

    it 'makes the best move' do
        game = TicTacToe.new
        computer = Computer.new('O')
        board = ['X', 'X', 'O', 'O', 'O', 'X', 6, 7, 'X']
        choice = computer.move(game, board)
        assert_equal 6, choice
    end
end