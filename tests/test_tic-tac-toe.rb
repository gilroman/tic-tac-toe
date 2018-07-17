require 'minitest/autorun'
require_relative '../src/tic-tac-toe'

describe TicTacToe do    
    it 'should have a human player' do
        game = TicTacToe.new
        player = game.player
        name = player.name
        assert_equal 'X', name
    end

    it 'should have a computer player' do
        game = TicTacToe.new
        computer = game.computer
        name = computer.name
        assert_equal 'O', name
    end

    it 'should have an active player' do
        game = TicTacToe.new
        activePlayer = game.activePlayer
        name = activePlayer.name
        assert_equal 'X', name
    end

    it 'should allow setting an active player' do
        game = TicTacToe.new
        computer = game.computer
        game.activePlayer = computer
        activePlayer = game.activePlayer
        name = activePlayer.name
        assert_equal 'O', name
    end    
end