require 'minitest/autorun'
require_relative '../src/board'

describe Board do
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

    describe 'getEmptyBoardLocations method' do
        it 'should provide an array of empty locations on the board' do
            board = Board.new(['X', 1, 2, 3, 4, 'X', 6, 7, 8])
            expectedArray = [1, 2, 3, 4, 6, 7, 8]
            
            assert_equal expectedArray, board.getEmptyBoardLocations
        end    
    end

    describe 'getPiece method' do
        it 'should provide the value on the board for a specific location' do
            board = Board.new
            board.setPlay(1, 'X')
            
            assert_equal 'X', board.getPiece(1)
         end
    end

    describe 'getStringRepresentation' do
        it 'returns a string version of the board' do
            board = Board.new
            stringRepresentation = 
                "   |   |   \n" +
                "------------\n" +
                "   |   |   \n" +
                "------------\n" +
                "   |   |   \n"
            
            assert_equal stringRepresentation, board.getStringRepresentation
        end
    end

    describe 'isMoveValid method' do
        it 'verifies the a move is invalid' do
            board = Board.new([0, 1, 2, 3, 4, 5, 6, 'X', 8])
            location = 7
            
            assert !board.isMoveValid?(location)
        end
    
        it 'verifies that a move is valid' do
            board = Board.new([0, 1, 2, 3, 4, 5, 6, 'X', 8])
            location = 8
            
            assert board.isMoveValid?(location)
        end
    
        it 'verifies that the move is invalid if the location is outside the boundaries of the board' do
            board = Board.new
            location = 9
    
            assert !board.isMoveValid?(location)
        end
    
        it 'verifies that the move is invalid if the location is given as a string' do
            board = Board.new
            location = 'X'
    
            assert !board.isMoveValid?(location)
        end
    end

    describe 'isFull method' do
        it 'should return false if there are empty spots on the board' do
            board = Board.new
            board.board = [0, 1, 2, 3, 4, 5, 6, 'X', 8]
            
            isFull = board.isFull?
            
            assert_equal false, isFull
        end
    
        it 'should return true if all the spots are taken on the board' do
            board = Board.new
            board.board = ['O', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'X']
            
            isFull = board.isFull?
            
            assert_equal true, isFull
        end
    end
    
    describe 'setPlay method' do
        it 'should record a move on the board' do
            board = Board.new
            playerName = 'X'
            boardPosition = 2
            expectedBoardState = [0,1,'X',3,4,5,6,7,8]
    
            boardState = board.setPlay(boardPosition , playerName)
            
            assert_equal expectedBoardState, boardState
        end
    end
end