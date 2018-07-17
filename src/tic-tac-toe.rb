require_relative 'board'
require_relative 'command-line-interface'
require_relative 'computer'
require_relative 'game-rules'
require_relative 'player'
require_relative 'output'

class TicTacToe
    attr_accessor :activePlayer, :board
    attr_reader :player, :computer, :gameRules
    def initialize
        @board = Board.new([0, 1, 2, 3, 4, 5, 6, 7, 8])
        @cli = CommandLineInterface.new
        @player = Player.new('X')
        @computer = Computer.new('O')
        @gameRules = GameRules.new
        @output = Output.new
        @activePlayer = Player.new('X')
    end

    def computerMove
        computerMove = @computer.move(self, @board.board)
        @board.setPlay(computerMove, @computer.name)
        @cli.printToScreen(@output.saysTheComputersMove)
        @cli.printToScreen(@output.boardToString(@board.board))
        @cli.printToScreen(@output.newLine)
        if @gameRules.isGameWon?(@board.board, @computer.name)
            @cli.printToScreen(@output.saysSorry)
        elsif @gameRules.isGameTied?(@board.board)
            @cli.printToScreen(@output.saysGameTied)
        end
        self.activePlayer = @player
    end

    def playerMove
        positionValid = false
        while !positionValid
            @cli.printToScreen(@output.saysEnterMove)
            position = @cli.getInput - 1
            if  @gameRules.isMoveValid?(@board.board, position)   
                @board.setPlay(position, @player.name)
                @cli.printToScreen(@output.newLine)
                @cli.printToScreen(@output.saysYourMove)
                @cli.printToScreen(
                    @output.boardToString(@board.board)
                )
                @cli.printToScreen(@output.newLine)
                if @gameRules.isGameWon?(@board.board, @player.name)
                    @cli.printToScreen(@output.saysCongratulations)
                elsif @gameRules.isGameTied?(@board.board)
                    @cli.printToScreen(@output.saysGameTied)
                end
                self.activePlayer = @computer
                positionValid = true
            else
                @cli.printToScreen(@output.saysLocationTaken)
            end
        end
    end

    def start
        human = @player.name
        @cli.printToScreen(@output.saysGameIntro)
        @cli.printToScreen(@output.boardToString([0, 1, 2, 3, 4, 5, 6, 7, 8]))
        @cli.printToScreen(@output.newLine)

        while !@gameRules.isGameOver?(@board.board) do
            activePlayerName = @activePlayer.name
            if activePlayerName == human
                self.playerMove
            end 
            if !@gameRules.isGameOver?(@board.board) 
                self.computerMove
            end    
        end
        
    end
end