require 'minitest/autorun'
require_relative '../src/player'
require_relative '../src/tic-tac-toe'

describe Player do
    it 'has a name' do
        player = Player.new('X')
        name = player.name
        
        assert_equal 'X', name
    end
    
    describe 'move method' do
        it 'has a move method that raises an error if it\'s not implemented' do
            player = Player.new('X')
            game = TicTacToe.new
            assert_raises NotImplementedError do
                player.move(game.gameRules, game.board)
            end
        end
    end
end