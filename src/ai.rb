require_relative 'board'

class AI
    attr_accessor :moves
    def initialize
        @moves = {}
    end

    def miniMax(gameRules, board, activePlayerName, depth=0)
        computerName = "O"
        playerName = "X"
        scoreForWinningGame = 100
        scoreForLosingGame = -100
        scoreForTiedGame = 0
        
        return scoreForWinningGame - depth if gameRules.isGameWon?(board, computerName)
        return scoreForLosingGame + depth if gameRules.isGameWon?(board, playerName)
        return scoreForTiedGame if board.isFull?

        @moves = {} if depth == 0
        
        bestScore = activePlayerName == computerName ? scoreForLosingGame : scoreForWinningGame
 
        board.getEmptyBoardLocations.map { | location |
            newBoard = Board.new(Array.new(board.board))
            newBoard.setPlay(location, activePlayerName)

            if (activePlayerName == computerName)
                result = miniMax(gameRules, newBoard, playerName, depth+1)
                bestScore = [bestScore, result].max - depth
            else
                result = miniMax(gameRules, newBoard, computerName, depth+1)
                bestScore = [bestScore, result].min + depth
            end

            if depth == 0
                locations = @moves.key?(result) ? "#{@moves[result]},#{location}" : location
                @moves[result] = locations
            end
        }

            return bestScore if depth != 0
    end

    def getBestMove
        # if there are multiple locations for a score, split the string and return a random location
        if @moves[self.getBestScore].kind_of? String
            array = @moves[self.getBestScore].split(",").map { | location | location.to_i }
            random = Random.new  
            randomIndex = (random.rand * array.length).floor
            array[randomIndex]         
        else
            @moves[self.getBestScore] 
        end   
    end

    def getBestScore
        @moves.keys.max
    end

end