require 'minitest/autorun'
require_relative '../src/human'
require_relative '../src/command-line-interface'
require_relative '../src/tic-tac-toe'

describe Human do
    it 'has a name' do
        human = Human.new('X')
        name = human.name

        assert_equal 'X', name
    end

    describe 'getPosition method' do
        it 'asks for the player for a move location and returns the location as an integer' do
            human = Human.new('X')
            input = StringIO.new(3.to_s)
            output = StringIO.new
            human.cli = CommandLineInterface.new(input, output)
            
            position = human.getPosition
            
            assert_equal 3, position
        end
    end

    describe 'getPiece method' do
        it 'has a move method that records a move in the right location on the board' do
            game = TicTacToe.new
            human = Human.new('X')
            input = StringIO.new("3")
            output = StringIO.new
            zeroBasedIndexCompensation = -1
            position = input.string.to_i + zeroBasedIndexCompensation
            human.cli = CommandLineInterface.new(input, output)
            
            human.move(game.gameRules, game.board)
    
            assert_equal 'X', game.board.getPiece(position)
        end
    end
end