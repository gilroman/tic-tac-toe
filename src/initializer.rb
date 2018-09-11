require_relative 'human'
require_relative 'computer'

class Initializer
    def initialize(game)
        @game = game
    end

    def setPlayers(option)
        case option
        when "computer-second"
            @game.player1 = Human.new('X')
            @game.player2 = Computer.new('O')
            @game.activePlayer = @game.player1
        when "computer-first"
            @game.player1 = Computer.new('O')
            @game.player2 = Human.new('X')
            @game.activePlayer = @game.player1
        end
    end

    def getPlayerTurn
        @game.cli.printToScreen(Output::ASKS_PLAYER_TURN)
        playerTurnChoice =  @game.cli.getInput
        playerTurnChoice = playerTurnChoice.upcase
        
        until playerTurnChoice == 'Y' || playerTurnChoice == 'N' do
            @game.cli.printToScreen(Output::WRONG_LETTER_WARNING)
            playerTurnChoice =  @game.cli.getInput
            playerTurnChoice = playerTurnChoice.upcase
        end

        case playerTurnChoice
        when "Y"
            return "computer-second"
        when "N"
            return "computer-first"
        end
    end
end