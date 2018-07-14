require_relative 'board'

class AI
    attr_accessor :moves
    def initialize
        # collect a score for a move on each empty location
        @moves = {}
    end

    def miniMax(game, boardArray, activePlayerName, depth=0)
        computerName = "O"
        playerName = "X"
        return 100 - depth if game.isGameWon?(boardArray, computerName)
        return -100 + depth if game.isGameWon?(boardArray, playerName)
        return 0 if game.isBoardFull?(boardArray)

        # clear the moves hash if this is the first call to the function
        if depth == 0
            @moves = {}
        end

        if activePlayerName == computerName
            best = -100
        else 
            best = 100
        end

        # loop through all the empty spots on the board  
        game.getEmptyBoardLocations(boardArray).map { | location |
            # set empty location on the board to the currentPlayer
            newBoard = Board.new(Array.new(boardArray))
            newBoard.setPlay(location, activePlayerName)

            # record a play with the opposite player
            if (activePlayerName == computerName)     #maximizing
                result = miniMax(game, newBoard.board, playerName, depth+1)
                best = [best, result].max - depth
            else
                result = miniMax(game, newBoard.board, computerName, depth+1) #minimizing
                best = [best, result].min + depth
            end

            # if its the first call, place the move hash to the moves instance variable
            if depth == 0
         	    # create a comma separated list of moves if the locations have the same result
                locations = @moves.key?(result) ? "#{@moves[result]},#{location}" : location
                @moves[result] = locations
            end
        }

        #If not main call (recursive) return the heuristic value for next calculation
            if depth != 0
                return best
            else
                self.getBestMove
            end
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