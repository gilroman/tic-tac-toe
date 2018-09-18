class Board
    attr_accessor :board
    def initialize(boardArray = (0..8).to_a)
        @board = boardArray
        @winningCombinations = [
            [0,1,2],
            [3,4,5],
            [6,7,8],
            [0,3,6],
            [1,4,7],
            [2,5,8],
            [0,4,8],
            [2,4,6]            
        ]
    end
    
    def isBoardValid?
        @board == (0..8).to_a
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

    def getPlay(location)
        @board[location]
    end   
    
    
    def getPlays(playerName)
        acc = []

        @board.each_with_index do | value, index | 
            if value == playerName
                acc << index 
            end 
        end
        
        acc
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

    def isGameWon?(playerName)
        won = false
        plays = self.getPlays(playerName)
        @winningCombinations.each do | combination |
            if combination.all? {
                |value| plays.include?(value) 
            }
                won = true
            end 
        end

        won
    end

    def isMoveValid?(location)
        location.between?(0,8) && @board[location].is_a?(Numeric)
    end

    def setPlay(location, playerName)
        @board[location] = playerName
        @board
    end
end