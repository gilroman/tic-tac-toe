require_relative 'player'
require_relative 'ai'

class Computer < Player
    def initialize(name)
        super(name)
        @ai = AI.new
    end

    def getPosition(board)
        @ai.miniMax(board, self.name)
        @ai.getBestMove
    end

    def move(board)
        position = self.getPosition(board)
        board.setPlay(position, @name)
    end
end