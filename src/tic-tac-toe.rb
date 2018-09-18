require_relative 'board'
require_relative 'command-line-interface'
require_relative 'computer'
require_relative 'human'
require_relative 'player'
require_relative 'output'

class TicTacToe
    attr_accessor :activePlayer, :board
    attr_reader :player1, :player2
    def initialize
        @board = Board.new([0, 1, 2, 3, 4, 5, 6, 7, 8])
        @cli = CommandLineInterface.new
        @output = Output.new
    end

    def isGameOver?
        @board.isFull? || @board.isGameWon?(@player1.name) ||  @board.isGameWon?(@player2.name)
    end

    def isTied?
        @board.isFull? && !@board.isGameWon?(@player1.name) && !@board.isGameWon?(@player2.name)
    end

    def getWinner
        return @player1 if @board.isGameWon?(@player1.name)
        return @player2 if @board.isGameWon?(@player2.name) 
    end

    def printEnding
        self.isTied? ?
            @output.saysGameTied :
            self.getWinner.class.name == "Computer" ?
                @output.saysSorry :
                @output.saysCongratulations
    end

    def playerMove
            string = ""
            case @activePlayer.class.name
            when "Computer"
                string += @output.saysTheComputersMove
            when "Human"
                string += @output.newLine
                string += @output.saysYourMove
            end
            string += @board.getStringRepresentation
            string += @output.newLine
            string
    end

    def setActivePlayer(player)
        @activePlayer = player
    end

    def setPlayers(option)
        case option
        when 1
            @player1 = Human.new('X')
            @player2 = Computer.new('O')
            @activePlayer = @player1
        when 2
            @player1 = Computer.new('O')
            @player2 = Human.new('X')
            @activePlayer = @player1
        end
    end

    def start
        @cli.printToScreen(@output.gameIntro(@board.getStringRepresentation))        
        @cli.printToScreen(@output.asksPlayerTurn)
        playerTurnChoice =  @cli.getInput

        until playerTurnChoice == 'Y' || playerTurnChoice == 'n' do
            @cli.printToScreen(@output.wrongLetterWarning)
            playerTurnChoice =  @cli.getInput
        end

        playerTurnChoice == 'Y' ? self.setPlayers(1) : self.setPlayers(2)

        while !self.isGameOver? do
            @activePlayer.move(@board)
            @cli.printToScreen(self.playerMove)
            self.switchPlayers
        end
        
        @cli.printToScreen(self.printEnding)
    end

    def switchPlayers
        @activePlayer == @player1 ? @activePlayer = @player2 : @activePlayer = @player1
    end
end