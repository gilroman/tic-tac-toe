require_relative 'player'
require_relative 'command-line-interface'
require_relative 'output'

class Human < Player
    attr_accessor :cli
    
    def initialize(name)
        super(name)
        @cli = CommandLineInterface.new
    end

    def getPosition
        @cli.printToScreen(Output::SAYS_ENTER_MOVE)
        position = @cli.getInput.to_i
        position
    end

    def move(gameRules, board)
        zeroBasedIndexCompensation = -1
        position = self.getPosition + zeroBasedIndexCompensation
        
        while !board.isMoveValid?(position)
            position = self.getPosition + zeroBasedIndexCompensation
        end

        board.setPlay(position, @name)
    end
end