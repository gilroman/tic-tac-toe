require 'minitest/autorun'
require_relative '../src/initializer'
require_relative '../src/tic-tac-toe'

describe Initializer do
    
    describe 'getPlayerTurn method' do
        class CliMock
            def getInput(character)
                character
            end
            def printToScreen(output)
                output
            end
        end
        
        it 'returns the string "computer-second" when "Y" is provided as an input on the console' do
            game = TicTacToe.new
            game.cli = CliMock.new
            initializer = Initializer.new(game)
            initializer.setPlayers("computer-second")
            expected = "computer-second"

            game.cli.stub :getInput, "Y" do
                result = initializer.getPlayerTurn
                assert_equal expected, result
            end
        end

        it 'returns the string "computer-second" when "y" is provided as an input on the console' do
            game = TicTacToe.new
            game.cli = CliMock.new
            initializer = Initializer.new(game)
            initializer.setPlayers("computer-second")
            expected = "computer-second"

            game.cli.stub :getInput, "y" do
                result = initializer.getPlayerTurn
                assert_equal expected, result
            end
        end

        it 'returns the string "computer-first" when "N" is provided as an input on the console' do
            game = TicTacToe.new
            game.cli = CliMock.new
            initializer = Initializer.new(game)
            initializer.setPlayers("computer-second")
            expected = "computer-first"

            game.cli.stub :getInput, "N" do
                result = initializer.getPlayerTurn
                assert_equal expected, result
            end
        end

        it 'returns the string "computer-first" when "n" is provided as an input on the console' do
            game = TicTacToe.new
            game.cli = CliMock.new
            initializer = Initializer.new(game)
            initializer.setPlayers("computer-second")
            expected = "computer-first"

            game.cli.stub :getInput, "n" do
                result = initializer.getPlayerTurn
                assert_equal expected, result
            end
        end
    end

    describe 'setPlayers method' do
        it 'should set the player names based on the value \"computer-second\"' do
            game = TicTacToe.new
            initializer = Initializer.new(game)
            initializer.setPlayers("computer-second")
    
            assert_equal 'X', game.player1.name
            assert_equal 'O', game.player2.name
            assert_equal 'X', game.activePlayer.name
        end

        it 'should set the player names based on the value \"computer-first\"' do
            game = TicTacToe.new
            initializer = Initializer.new(game)
            initializer.setPlayers("computer-first")
    
            assert_equal 'O', game.player1.name
            assert_equal 'X', game.player2.name
            assert_equal 'O', game.activePlayer.name
        end
    end
end