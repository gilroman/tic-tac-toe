class Board
    attr_accessor :board

    def initialize(boardArray = (0..8).to_a)
        @board = boardArray
    end

    def isMoveValid?(location)
        if location.is_a?(Numeric)
            piece = self.getPiece(location)
            location.between?(0,8) && piece.is_a?(Numeric)
        else
            false
        end
    end

    def getEmptyBoardLocations
        @board.select { | location | location.is_a?(Numeric) } 
    end

    def getPiece(location)
        @board[location]
    end   

    def getStringRepresentation
        newBoard = @board.map do | value |
            if value.is_a?(Numeric)
                " "
            else
                value
            end
        end
        " #{newBoard[0]} | #{newBoard[1]} | #{newBoard[2]} \n" +
            "------------\n" +
            " #{newBoard[3]} | #{newBoard[4]} | #{newBoard[5]} \n" +
            "------------\n" +
            " #{newBoard[6]} | #{newBoard[7]} | #{newBoard[8]} \n"
    end

    def isFull?
        !@board.any? {|a| a.is_a? Integer}
    end

    def setPlay(location, playerName)
        @board[location] = playerName
        @board
    end
end