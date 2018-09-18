require_relative 'player'
require_relative 'command-line-interface'
require_relative 'output'

class Human < Player
    attr_accessor :cli
    def initialize(name)
        super(name)
        @cli = CommandLineInterface.new
        @output = Output.new
    end

    def getPosition
        @cli.printToScreen(@output.saysEnterMove)
        position = @cli.getInput.to_i
        position
    end

    def move(board)
        position = self.getPosition
        
        while !board.isMoveValid?(position-1)
            position = self.getPosition
        end

        board.setPlay(position-1, @name)
    end
end