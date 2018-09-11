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
        @gameOver = false
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

    def getGameOverPhrase(winner = "")
        case winner
        when "Human"
            Output::SAYS_CONGRATULATIONS
        when "Computer"
            Output::SAYS_SORRY
        else
            Output::SAYS_GAME_TIED
        end
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

    def run
        @activePlayer.move(gameRules, @board)
        @cli.printToScreen(self.playerMove)
        
        if @gameRules.isGameTied?(@board, @player1, @player2)
            @gameOver = true
        elsif @gameRules.isGameWon?(@board, @activePlayer.name) 
            @gameOver = true
            @winner = @activePlayer.class.name
        end

        self.switchPlayers if !@gameOver
    end

    def setActivePlayer(player)
        @activePlayer = player
    end

    def start
        @cli.printToScreen(@output.gameIntro(@board.getStringRepresentation))
        @initializer.setPlayers(@initializer.getPlayerTurn)

        while !@gameOver
            self.run
        end
        
        @cli.printToScreen(self.getGameOverPhrase(@winner))
    end

    def switchPlayers
        @activePlayer = @activePlayer == @player1 ? @player2 : @player1
    end
end