require_relative 'player'
require_relative 'ai'

class Computer < Player
    def initialize(name)
        super(name)
        @ai = AI.new
    end

    def move(gameRules, board)
        @ai.miniMax(gameRules, board, self.name)
        position = @ai.getBestMove
        board.setPlay(position, @name)
    end
end