require 'minitest/autorun'
require_relative '../board'
require_relative '../player'

describe Board do
    it 'should create a valid board' do
        board = Board.new
        valid = board.isBoardValid?
        assert valid
    end

    it 'should provide access to the board' do
        board = Board.new
        boardArray = board.getBoard
        assert_equal (0..8).to_a, boardArray
    end


    it 'should allow for the board to be set to an array' do
       board = Board.new
       array = [0,1,2]
       board.setBoard(array)
       assert_equal array, board.getBoard 
    end

    it 'should record a move on the board' do
        board = Board.new
        player = Player.new('X')
        boardPosition = 2
        expectedBoardState = [0,1,'X',3,4,5,6,7,8]
        boardState = board.setPlay(boardPosition , player)
        assert_equal expectedBoardState, boardState
    end

    it 'should make a string representing the board' do
        board = Board.new
        player = Player.new('X')
        boardPosition = 2
        boardState = board.setPlay(boardPosition , player)       
        expectedBoardString = "   |   | X \n------------\n   |   |   \n------------\n   |   |   \n"
        boardString = board.getBoardAsString
        assert_equal expectedBoardString, boardString
    end

    it 'should check if a move is valid' do
        board = Board.new
        location = 8
        valid = board.isMoveValid?(2)
        assert valid
    end

    it 'should check if a move is invalid' do
        board = Board.new
        location = 7
        player = Player.new('X')
        board.setPlay(location, player)
        valid = board.isMoveValid?(location)
        assert !valid
    end

    it 'should check to see that there are empty spots on the board' do
        board = Board.new
        location = 7
        player = Player.new('X')
        board.setPlay(location, player)
        isFull = board.isFull?
        assert !isFull
    end

    it 'provides an array of empty locations on the board' do
        board = Board.new
        firstLocation = 0
        secondLocation = 5
        player = Player.new('X')
        board.setPlay(firstLocation, player)
        board.setPlay(secondLocation, player)
        expectedArray = [1, 2, 3, 4, 6, 7, 8]
        assert_equal expectedArray, board.getEmptyLocations
    end

    it 'should return an array with the index number of all the positions the player' do
        board = Board.new
        firstLocation = 0
        secondLocation = 4
        thirdLocation = 8
        player = Player.new('X')
        board.setPlay(firstLocation, player)
        board.setPlay(secondLocation, player)
        board.setPlay(thirdLocation, player)
        positions = board.getPlays(board, player)
        expectedPositions = [0, 4, 8]
        assert_equal expectedPositions, positions
    end

    it 'should check if the game is won' do
        board = Board.new
        firstLocation = 0
        secondLocation = 4
        thirdLocation = 8
        player = Player.new('X')
        board.setPlay(firstLocation, player)
        board.setPlay(secondLocation, player)
        board.setPlay(thirdLocation, player)
        won = board.isGameWon?(board, player)
        assert won
    end

end