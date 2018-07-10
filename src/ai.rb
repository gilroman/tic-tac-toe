require_relative 'board'
require_relative 'computer'
require_relative 'player'

class AI
    def initialize
        # collect a score for a move on each empty location
        @moves = {}
    end

    def miniMax(board, activePlayer, depth=0)
        computer = Computer.new('O')
        player = Player.new('X')
        return 100 if board.isGameWon?(board, computer)
        return -100 if board.isGameWon?(board, player)
        return 0 if board.isFull?

        # clear the moves hash if this is the first call to the function
        if depth == 0
            @moves = {}
        end

        if activePlayer.getName == computer.getName
            best = -100
        else 
            best = 100
        end

        # loop through all the empty spots on the board  
        board.getEmptyLocations.map { | location |
            # set empty location on the board to the currentPlayer
            newBoard = Board.new(Array.new(board.getBoard))
            newBoard.setPlay(location, activePlayer)

            # record a play with the opposite player
            if (activePlayer.getName == computer.getName)     #maximizing
                result = miniMax(newBoard, player, depth+1)
                best = [best, result].max - depth
            else
                result = miniMax(newBoard, computer, depth+1) #minimizing
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
        if @moves[@moves.keys.max].kind_of? String
            array = @moves[@moves.keys.max].split(",")
            random = Random.new  
            randomIndex = (random.rand * array.length).floor
            array[randomIndex]         
        else
            @moves[@moves.keys.max] 
        end
    end
end