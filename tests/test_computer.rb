require 'minitest/autorun'
require_relative '../ai'
require_relative '../board'
require_relative '../computer'

describe Computer do
    it 'has a name' do
        computer = Computer.new('O')
        name = computer.getName
        assert_equal 'O', name
    end

    it 'makes the best move' do
        computer = Computer.new('O')
        ai = AI.new
        activePlayer = Computer.new('O')
        board = Board.new(['X', 'X', 'O', 'O', 'O', 'X', 6, 7, 'X'])
        choice = computer.move(board)
        assert_equal 6, choice
    end
end