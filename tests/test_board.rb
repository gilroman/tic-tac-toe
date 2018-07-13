require 'minitest/autorun'
require_relative '../src/board'
require_relative '../src/player'

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

    it 'should record a move on the board' do
        board = Board.new
        player = Player.new('X')
        boardPosition = 2
        expectedBoardState = [0,1,'X',3,4,5,6,7,8]
        boardState = board.setPlay(boardPosition , player.name)
        assert_equal expectedBoardState, boardState
    end
end