require_relative 'board'
require_relative 'command-line-interface'
require_relative 'computer'
require_relative 'game-rules'
require_relative 'initializer'
require_relative 'output'

class TicTacToe
    attr_accessor :activePlayer, :board, :cli, :gameRules, :player1, :player2
    attr_reader :gameOver, :winner
    
    def initialize(boardSize = 9)
        zeroBasedIndexCompansation = -1
        @board = Board.new((0..boardSize + zeroBasedIndexCompansation).to_a)
        @gameRules = GameRules.new
        @initializer = Initializer.new(self)
        @cli = CommandLineInterface.new
        @output = Output.new
        @gameOver = false
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
                string += Output::SAYS_THE_COMPUTERS_MOVE
            when "Human"
                string += Output::NEW_LINE
                string += Output::SAYS_YOUR_MOVE
            end
            string += @board.getStringRepresentation
            string += Output::NEW_LINE
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