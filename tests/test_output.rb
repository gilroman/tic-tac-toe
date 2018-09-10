require 'minitest/autorun'
require_relative '../src/output'

describe Output do
    it 'has a constant with string value that welcomes the player to the game' do
        assert_equal "Welcome to Gil's Tic-Tac-Toe Game!\n", Output::SAYS_WELCOME
    end

    it 'has a constant with string value that asks the player if they prefer to go first or second' do
        assert_equal "Would you like to play first?. (Y/n): ", 
        Output::ASKS_PLAYER_TURN
    end

    it 'has a constant with string value that warns the player that only the letters Y or n are allowed' do        
        assert_equal "Please answer with the letters Y or n only!", Output::WRONG_LETTER_WARNING
    end

    it 'has a constant with string value that warns the player that a location is invalid' do
        assert_equal "That location is invalid please play another position.\n",Output::SAYS_LOCATION_TAKEN
    end

    it 'has a constant with string value that congratulates the player for winning the game' do
        assert_equal "Congratulations!!! You won the game.\n", Output::SAYS_CONGRATULATIONS
    end

    it 'has a constant with string value that tells the player the computer won the game' do
        assert_equal "Sorry! The computer won the game.\n", Output::SAYS_SORRY
    end

    it 'has a constant with string value that asks the player to enter a move' do
        assert_equal "Please enter the number of the square you would like to play from 1 to 9:\n", Output::SAYS_ENTER_MOVE
    end

    it 'has a constant with string value that announces the computer\'s move' do
        assert_equal "The Computer's Move: \n", Output::SAYS_THE_COMPUTERS_MOVE
    end

    it 'has a constant with string value that announces the player\'s move' do
        assert_equal "Your Move: \n", Output::SAYS_YOUR_MOVE
    end

    it 'has a constant with string value that says the game ended in a tie' do
        assert_equal "Game ended in a Tie.\n", Output::SAYS_GAME_TIED
    end

    it 'has a constant with string value that prints a new line character' do
        assert_equal "\n", Output::NEW_LINE
    end

    describe 'gameIntro method' do
        it 'prints out the game intro' do
            output = Output.new
            emptyBoard = "   |   |   \n------------\n   |   |   \n------------\n   |   |   \n"
            intro = [Output::SAYS_WELCOME, emptyBoard, Output::NEW_LINE].join
    
            assert_equal intro, output.gameIntro(emptyBoard)
        end
    end
end