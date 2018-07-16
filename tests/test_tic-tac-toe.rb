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

    it 'should have a valid board of 8 squares' do
        game = TicTacToe.new
        board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
        valid = game.isBoardValid?(board)
        assert valid
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

    it 'should check if a move is valid' do
        game = TicTacToe.new
        board  = [0, 1, 2, 3, 4, 5, 6, 'X', 8]
        location = 8
        valid = game.isMoveValid?(board, location)
        assert valid
    end
    
    it 'should check if a move is invalid' do
        game = TicTacToe.new()
        board  = [0, 1, 2, 3, 4, 5, 6, 'X', 8]
        location = 7
        valid = game.isMoveValid?(board, location)
        assert !valid
    end

    it 'should check to see that there are empty spots on the board' do
        game = TicTacToe.new()
        board = [0, 1, 2, 3, 4, 5, 6, 'X', 8]
        isFull = game.isBoardFull?(board)
        assert !isFull
    end

    it 'should provide an array of empty locations on the board' do
        game = TicTacToe.new()
        board = ['X', 1, 2, 3, 4, 'X', 6, 7, 8]
        expectedArray = [1, 2, 3, 4, 6, 7, 8]
        assert_equal expectedArray, game.getEmptyBoardLocations(board)
    end
    
    it 'should report if the game is over because the board is full' do
        game = TicTacToe.new
        board = ['X', 'O', 'X', 'X', 'O', 'O', 'O', 'X', 'X']
        over = game.isGameOver?(board)
        assert over
    end

    it 'should report if the game is over because there is a winning combination on the board' do
        game = TicTacToe.new
        board = ['X', 'O', 'O', 'X', 'X', 'O', 'X', 7, 8]
        over = game.isGameOver?(board)
        assert over
    end   

    it 'should report if the game ended in a tie' do
        game = TicTacToe.new
        board = ['O', 'O', 'X', 'X', 'X', 'O', 'O', 'O', 'X']
        tied = game.isGameTied?(board)
        assert tied
    end 

    it 'should return an array with the index number of all the positions the player' do
        game = TicTacToe.new
        playerName = 'X'
        board = ['X', 1, 2, 3, 'X', 5, 6, 7, 'X']
        positions = game.getPlays(board, playerName)
        expectedPositions = [0, 4, 8]
        assert_equal expectedPositions, positions
    end
end