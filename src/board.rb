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

     def getBoardAsString
        newBoard = @board.map do | value |
            if value.is_a?(Numeric)
                " "
            else
                value
            end
        end
        boardString = " #{newBoard[0]} | #{newBoard[1]} | #{newBoard[2]} \n" +
            "------------\n" +
            " #{newBoard[3]} | #{newBoard[4]} | #{newBoard[5]} \n" +
            "------------\n" +
            " #{newBoard[6]} | #{newBoard[7]} | #{newBoard[8]} \n"
    end

    def getEmptyLocations
        emptyLocations = []

        @board.each do | location |
           if location.is_a?(Numeric) 
                emptyLocations << location  
           end
        end

        emptyLocations
    end

    def getPlays(board, player)
        acc = []

        @board.each_with_index do | value, index | 
            if value == player.name
                acc << index 
            end 
        end
        
        acc
    end

    def isBoardValid?
        @board == (0..8).to_a
    end

    def isFull?
        !@board.any? {|a| a.is_a? Integer}
    end

    def isGameWon?(board, player)
        won = false
        plays = board.getPlays(board, player)
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
    
    def setPlay(location, player)
        @board[location] = player.name
        @board
    end
end