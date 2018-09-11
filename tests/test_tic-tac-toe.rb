require 'minitest/autorun'
require_relative '../src/tic-tac-toe'
require_relative '../src/initializer'

describe TicTacToe do 
    it 'should have an active player' do
        game = TicTacToe.new
    
        assert game.respond_to?(:activePlayer)
    end

    it 'should have a variable for the board' do
        game = TicTacToe.new

        assert game.respond_to?(:board)
    end

    it 'should have a variable for the Command Line Interface' do
        game = TicTacToe.new

        assert game.respond_to?(:cli)
    end    

    it 'should have a variable for the rules for the game' do
        game = TicTacToe.new

        assert game.respond_to?(:gameRules)
    end

    it 'should have a player1' do
        game = TicTacToe.new
    
        assert game.respond_to?(:player1)
    end

    it 'should have a player2' do
        game = TicTacToe.new
    
        assert game.respond_to?(:player2)
    end

    it 'should have a game over boolean variable' do
        game = TicTacToe.new

        assert game.respond_to?(:gameOver)
    end

    it 'initializes the game over boolean variable to false' do
        game = TicTacToe.new

        assert !game.gameOver
    end

    it 'should have a winner variable' do
        game = TicTacToe.new

        assert game.respond_to?(:winner)
    end

    describe 'initialize method' do
        it 'initializes the board size to a nine item array by default' do
            game = TicTacToe.new
            
            assert_equal 9, game.board.board.size
        end

        it 'initializes the board to the size given' do
            game = TicTacToe.new(4)

            assert_equal 4, game.board.board.size
        end
    end

    describe 'run method' do
        class CliMock
            def getInput(character)
                character
            end
            def printToScreen(output)
                output
            end
        end

        class PlayerMock
            attr_accessor :name
            def initialize(name)
                @name = name
                @cli = CliMock.new
            end
            
            def move(gameRules, board)
                StringIO.new("6")
            end
        end

        it 'sets the game over variable to true if the game is tied' do
            game = TicTacToe.new
            initializer = Initializer.new(game)
            initializer.setPlayers("computer-second")
            game.cli = CliMock.new
            game.player1 = PlayerMock.new("Human")
            game.activePlayer = game.player1
            game.board.board = [
                'X', 'O', 'X',
                'X', 'O', 'X',
                'O', 'X', 'O' 
            ]

            game.run
            assert_equal true, game.gameOver             
        end

        it 'leaves the game over variable as false if the game is not tied' do
            game = TicTacToe.new
            initializer = Initializer.new(game)
            initializer.setPlayers("computer-second")
            game.cli = CliMock.new
            game.player1 = PlayerMock.new("Human")
            game.activePlayer = game.player1
            game.board.board = [
                'X', 'O', 'X',
                'X', 'O', 'X',
                'O', 'X', 'O' 
            ]

            game.run
            
            assert_equal true, game.gameOver
        end

        it 'sets the game over variable to true if the active player has won the game' do
            game = TicTacToe.new
            initializer = Initializer.new(game)
            initializer.setPlayers("computer-second")
            game.cli = CliMock.new
            game.player1 = PlayerMock.new("X")
            game.activePlayer = game.player1
            game.board.board = [
                'X', 'O', 'X',
                'O', 'X', 'O',
                'X', 7, 8 
            ]

            game.run
            
            assert_equal true, game.gameOver
        end

        it 'leaves the game over variable as false if the active player has not won the game' do
            game = TicTacToe.new
            initializer = Initializer.new(game)
            initializer.setPlayers("computer-second")
            game.cli = CliMock.new
            game.player1 = PlayerMock.new("X")
            game.activePlayer = game.player1
            game.board.board = [
                'X', 'O', 'X',
                'O', 'X', 'O',
                 6,  'X', 8 
            ]

            game.run
            
            assert_equal false, game.gameOver
        end

        it 'switches the player if the game is not over' do
            game = TicTacToe.new
            initializer = Initializer.new(game)
            initializer.setPlayers("computer-second")
            game.cli = CliMock.new
            game.player1 = PlayerMock.new("X")
            game.player2 = PlayerMock.new("O")
            game.activePlayer = game.player1
            game.board.board = [
                'X', 'O', 'X',
                'O', 'X', 'O',
                 6,  'X', 8 
            ]

            game.run
            
            assert_equal game.player2, game.activePlayer 
        end

        it 'sets the winner variable to a string representation of the class if the active player has won the game' do
            game = TicTacToe.new
            initializer = Initializer.new(game)
            initializer.setPlayers("computer-second")
            game.cli = CliMock.new
            game.player1 = PlayerMock.new("X")
            game.activePlayer = game.player1
            game.board.board = [
                'X', 'O', 'X',
                'O', 'X', 'O',
                'X', 7, 8 
            ]

            game.run
            
            assert_equal "PlayerMock", game.winner
        end

    end

    describe 'setActivePlayer method' do
        it 'should allow setting an active player' do
            game = TicTacToe.new
            initializer = Initializer.new(game)
            initializer.setPlayers("computer-second")
            
            game.setActivePlayer(game.player2)
            
            assert_equal game.player2, game.activePlayer
        end
    end     

    describe 'switchPlayers method' do
        it 'switches the active player' do
            game = TicTacToe.new
            initializer = Initializer.new(game)
            initializer.setPlayers("computer-second")
    
            game.switchPlayers
    
            assert_equal game.player2, game.activePlayer
        end
    end

    describe 'getGameOverPhrase method' do
        it 'returns the string \'Sorry! The computer won the game.\' if the computer wins the game' do
            game = TicTacToe.new
            initializer = Initializer.new(game)
            initializer.setPlayers("computer-second")

            string = <<~END
            Sorry! The computer won the game.
            END

            assert_equal string, game.getGameOverPhrase(game.player2.class.name)
        end

        it 'returns the string \'Game ended in a Tie.\' if tied is prvided as an input' do
            game = TicTacToe.new
            initializer = Initializer.new(game)
            initializer.setPlayers("computer-second")
            game.board.board = ['X', 'O', 'X', 'O', 'O', 'X', 'X', 'X', 'O']


            string = <<~END
            Game ended in a Tie.
            END

            assert_equal string, game.getGameOverPhrase
        end

        it 'returns the string \'Congratulations!!! You won the game.\' out congratulations if the human player wins the game' do
            game = TicTacToe.new
            initializer = Initializer.new(game)
            initializer.setPlayers("computer-second")

            string = <<~END
            Congratulations!!! You won the game.
            END

            assert_equal string, game.getGameOverPhrase(game.player1.class.name)
        end
    end

    describe 'playerMove method' do
        it 'returns a string for the players\'s move after a player move' do
            game = TicTacToe.new
            initializer = Initializer.new(game)
            initializer.setPlayers("computer-second")
            game.board.board = [0, 1, 2, 3, 'X', 5, 6, 7, 8] 
            heading = "Your Move: \n"
            board = "   |   |   \n------------\n   | X |   \n------------\n   |   |   \n"
            string = "\n" + heading + board + "\n" 
    
            assert_equal string, game.playerMove
        end

        it 'returns a string for the computer\'s move after a computer move' do
            game = TicTacToe.new
            initializer = Initializer.new(game)
            initializer.setPlayers("computer-first")
            game.board.board = [0, 1, 2, 3, 'O', 5, 6, 7, 8] 
            heading = "The Computer's Move: \n"
            board = "   |   |   \n------------\n   | O |   \n------------\n   |   |   \n"
            string = heading + board + "\n"

            assert_equal string, game.playerMove
        end
    end
end