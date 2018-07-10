require 'minitest/autorun'
require_relative '../src/tic-tac-toe'

describe TicTacToe do    
    it 'should have a human player' do
        game = TicTacToe.new
        player = game.getPlayer
        name = player.getName
        assert_equal 'X', name
    end

    it 'should have a computer player' do
        game = TicTacToe.new
        computer = game.getComputer
        name = computer.getName
        assert_equal 'O', name
    end

    it 'should have a board' do
        game = TicTacToe.new
        board = game.getBoard
        assert board != nil
    end

    it 'should have a command line interface' do
        game = TicTacToe.new
        cli = game.getCLI
        assert cli != nil
    end

    it 'should have an active player' do
        game = TicTacToe.new
        activePlayer = game.getActivePlayer
        name = activePlayer.getName
        assert_equal 'X', name
    end

    it 'should allow setting an active player' do
        game = TicTacToe.new
        computer = game.getComputer
        game.setActivePlayer(computer)
        activePlayer = game.getActivePlayer
        name = activePlayer.getName
        assert_equal 'O', name
    end

    it 'should report if the game is over because the board is full' do
        game = TicTacToe.new
        board = game.getBoard
        board.setPlay(0, game.getPlayer)
        board.setPlay(1, game.getComputer)
        board.setPlay(2, game.getPlayer)
        board.setPlay(4, game.getComputer)
        board.setPlay(3, game.getPlayer)
        board.setPlay(5, game.getComputer)
        board.setPlay(7, game.getPlayer)
        board.setPlay(6, game.getComputer)
        board.setPlay(8, game.getPlayer)
        over = game.isOver?
        assert over
    end

    it 'should report if the game is over because there is a winning combination on the board' do
        game = TicTacToe.new
        board = game.getBoard
        board.setPlay(0, game.getPlayer)
        board.setPlay(1, game.getComputer)
        board.setPlay(3, game.getPlayer)
        board.setPlay(2, game.getComputer)
        board.setPlay(4, game.getPlayer)
        board.setPlay(5, game.getComputer)
        board.setPlay(6, game.getPlayer)
        over = game.isOver?
        assert over
    end   
end