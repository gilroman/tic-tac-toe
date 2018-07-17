class GameRules
    def initialize
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
        @playerName = 'X'
        @computerName = 'O'
    end

    def getPlays(boardArray, playerName)
        acc = []

        boardArray.each_with_index do | value, index | 
            if value == playerName
                acc << index 
            end 
        end
        
        acc
    end
    
    def isBoardFull?(boardArray)
        !boardArray.any? {|a| a.is_a? Integer}
    end

    def isBoardValid?(boardArray)
        boardArray == (0..8).to_a
    end

    def isGameOver?(boardArray)
        self.isBoardFull?(boardArray) || self.isGameWon?(boardArray, @playerName) ||  self.isGameWon?(boardArray, @computerName)
    end

    def isGameTied?(boardArray)
        self.isBoardFull?(boardArray) && !self.isGameWon?(boardArray, @playerName) && !self.isGameWon?(boardArray, @computerName)
    end

    def isGameWon?(boardArray, playerName)
        won = false
        plays = self.getPlays(boardArray, playerName)
        @winningCombinations.each do | combination |
            if combination.all? {
                |value| plays.include?(value) 
            }
                won = true
            end 
        end

        won
    end

    def isMoveValid?(boardArray, location)
        location.between?(0,8) && boardArray[location].is_a?(Numeric)
    end

end