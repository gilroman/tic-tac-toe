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

    it 'should have a board' do
        game = TicTacToe.new
        board = game.board
        assert board != nil
    end

    it 'should have a command line interface' do
        game = TicTacToe.new
        cli = game.cli
        assert cli != nil
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

    it 'should report if the game is over because the board is full' do
        game = TicTacToe.new
        board = game.board
        board.setPlay(0, game.player)
        board.setPlay(1, game.computer)
        board.setPlay(2, game.player)
        board.setPlay(4, game.computer)
        board.setPlay(3, game.player)
        board.setPlay(5, game.computer)
        board.setPlay(7, game.player)
        board.setPlay(6, game.computer)
        board.setPlay(8, game.player)
        over = game.isOver?
        assert over
    end

    it 'should report if the game is over because there is a winning combination on the board' do
        game = TicTacToe.new
        board = game.board
        board.setPlay(0, game.player)
        board.setPlay(1, game.computer)
        board.setPlay(3, game.player)
        board.setPlay(2, game.computer)
        board.setPlay(4, game.player)
        board.setPlay(5, game.computer)
        board.setPlay(6, game.player)
        over = game.isOver?
        assert over
    end   
end