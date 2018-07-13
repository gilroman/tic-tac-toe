require_relative 'player'
require_relative 'ai'

class Computer < Player
    def initialize(name)
        super(name)
        @ai = AI.new
    end

    def move(game, board)
        @ai.miniMax(game, board, self.name)
        @ai.getBestMove
    end
end