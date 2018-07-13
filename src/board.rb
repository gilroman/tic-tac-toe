class Board
    attr_accessor :board
    def initialize(boardArray = (0..8).to_a)
        @board = boardArray
    end
         
    def setPlay(location, playerName)
        @board[location] = playerName
        @board
    end
end