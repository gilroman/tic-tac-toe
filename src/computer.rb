require_relative 'player'
require_relative 'ai'

class Computer < Player
    def initialize(name)
        super(name)
        @ai = AI.new
    end

    def move(board)
        @ai.miniMax(board, self)
        @ai.getBestMove
    end
end