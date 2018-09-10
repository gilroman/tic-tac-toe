class GameRules  
    WINNING_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]            
    ]

    def getWinner(board, player1, player2)
        return player1 if self.isGameWon?(board, player1.name)
        return player2 if self.isGameWon?(board, player2.name) 
    end

    def isGameOver?(board, player1, player2)
        board.isFull? || self.isGameWon?(board, player1.name) ||  self.isGameWon?(board, player2.name)
    end

    def isGameTied?(board, player1, player2)
        board.isFull? && !self.isGameWon?(board, player1.name) && !self.isGameWon?(board, player2.name)
    end

    def isGameWon?(board, activePlayerName)
        won = false
        
        WINNING_COMBINATIONS.each do | combination |
            if combination.all? {
                |value| activePlayerName == board.getPiece(value) 
            }
                won = true
            end 
        end

        won
    end
end