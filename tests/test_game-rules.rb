require 'minitest/autorun'
require_relative '../src/game-rules'

describe GameRules do
    it 'should verify if the game has a valid board of 8 squares' do
        gameRules = GameRules.new
        board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
        valid = gameRules.isBoardValid?(board)
        assert valid
    end

    it 'should check to see that there are empty spots on the board' do
        gameRules = GameRules.new
        board = [0, 1, 2, 3, 4, 5, 6, 'X', 8]
        isFull = gameRules.isBoardFull?(board)
        assert !isFull
    end

    it 'should return an array with the index number of all the positions the player' do
        gameRules = GameRules.new
        playerName = 'X'
        board = ['X', 1, 2, 3, 'X', 5, 6, 7, 'X']
        positions = gameRules.getPlays(board, playerName)
        expectedPositions = [0, 4, 8]
        assert_equal expectedPositions, positions
    end

    it 'should check if a move is valid' do
        gameRules = GameRules.new
        board  = [0, 1, 2, 3, 4, 5, 6, 'X', 8]
        location = 8
        valid = gameRules.isMoveValid?(board, location)
        assert valid
    end
    
    it 'should check if a move is invalid' do
        gameRules = GameRules.new
        board  = [0, 1, 2, 3, 4, 5, 6, 'X', 8]
        location = 7
        valid = gameRules.isMoveValid?(board, location)
        assert !valid
    end
    
    it 'should report if the game is over because the board is full' do
        gameRules = GameRules.new
        board = ['X', 'O', 'X', 'X', 'O', 'O', 'O', 'X', 'X']
        over = gameRules.isGameOver?(board)
        assert over
    end

    it 'should report if the game is over because there is a winning combination on the board' do
        gameRules = GameRules.new
        board = ['X', 'O', 'O', 'X', 'X', 'O', 'X', 7, 8]
        over = gameRules.isGameOver?(board)
        assert over
    end   

    it 'should report if the game ended in a tie' do
        gameRules = GameRules.new
        board = ['O', 'O', 'X', 'X', 'X', 'O', 'O', 'O', 'X']
        tied = gameRules.isGameTied?(board)
        assert tied
    end 
end