class Board
    attr_accessor :board
    def initialize(boardArray = (0..8).to_a)
        @board = boardArray
    end
       
    def getEmptyBoardLocations(boardArray)
        emptyBoardLocations = []

        boardArray.each do | location |
           if location.is_a?(Numeric) 
                emptyBoardLocations << location  
           end
        end

        emptyBoardLocations
    end

    def setPlay(location, playerName)
        @board[location] = playerName
        @board
    end
end