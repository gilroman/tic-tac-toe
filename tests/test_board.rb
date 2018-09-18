require 'minitest/autorun'
require_relative '../src/board'
require_relative '../src/player'

describe Board do
    it 'should verify if the game has a valid board of 8 squares' do
        board = Board.new

        valid = board.isBoardValid?
        
        assert valid
    end

    it 'should provide access to the board' do
        board = Board.new
        boardArray = board.board

        assert_equal (0..8).to_a, boardArray
    end

    it 'should allow for the board to be set to an array' do
       board = Board.new
       array = [0,1,2]
       board.board = array

       assert_equal array, board.board
    end

    it 'should check to see if there are empty spots on the board' do
        board = Board.new
        board.board = [0, 1, 2, 3, 4, 5, 6, 'X', 8]
        
        isFull = board.isFull?
        
        assert_equal false, isFull
    end

    it 'should return an array with the index number of all the positions of the given player' do
        board = Board.new
        playerName = 'X'
        board.board = ['X', 1, 2, 3, 'X', 5, 6, 7, 'X']
        expectedPositions = [0, 4, 8]
        
        positions = board.getPlays(playerName)
        
        assert_equal expectedPositions, positions
    end

    it 'should record a move on the board' do
        board = Board.new
        playerName = 'X'
        boardPosition = 2
        expectedBoardState = [0,1,'X',3,4,5,6,7,8]

        boardState = board.setPlay(boardPosition , playerName)
        
        assert_equal expectedBoardState, boardState
    end

    it 'should provide the value on the board for a specific location' do
       board = Board.new
       board.setPlay(1, 'X')
       
       assert_equal 'X', board.getPlay(1)
    end

    it 'should provide an array of empty locations on the board' do
        board = Board.new(['X', 1, 2, 3, 4, 'X', 6, 7, 8])
        expectedArray = [1, 2, 3, 4, 6, 7, 8]
        
        assert_equal expectedArray, board.getEmptyBoardLocations(board.board)
    end

    it 'verifies the a move is invalid' do
        board = Board.new
        board.board = [0, 1, 2, 3, 4, 5, 6, 'X', 8]
        location = 7
        
        valid = board.isMoveValid?(location)
        
        assert !valid
    end

    it 'verifies that a move is valid' do
        board = Board.new
        board.board = [0, 1, 2, 3, 4, 5, 6, 'X', 8]
        location = 8
        
        valid = board.isMoveValid?(location)
        
        assert valid
    end

    it 'asserts whether a specific player has won the game' do
        board = Board.new
        playerName = 'X'
        board.board = ['X', 'X', 'X', 3, 4, 5, 6, 7, 8]

        won = board.isGameWon?(playerName)
        
        assert won
    end
end