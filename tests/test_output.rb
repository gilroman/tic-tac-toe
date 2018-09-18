require 'minitest/autorun'
require_relative '../src/output'

describe Output do
    it 'welcomes the player to the game' do
        output = Output.new
        
        assert_equal "Welcome to Gil's Tic-Tac-Toe Game!\n", output.saysWelcome
    end

    it 'prints out the game intro' do
        output = Output.new
        emptyBoard = "   |   |   \n------------\n   |   |   \n------------\n   |   |   \n"
        intro = [output.saysWelcome, emptyBoard, output.newLine].join

        assert_equal intro, output.gameIntro(emptyBoard)
    end

    it 'asks the player if they prefer to go first or second' do
        output = Output.new
        
        assert_equal "Would you like to play first?. (Y/n): ", output.asksPlayerTurn
    end

    it 'warns the player that only the letters Y or n are allowed' do
        output = Output.new

        assert_equal "Please answer with the letters Y or n only!", output.wrongLetterWarning
    end

    it 'warns the player that a location is invalid' do
        output = Output.new
        
        assert_equal "That location is invalid please play another position.\n", output.saysLocationTaken
    end

    it 'congratulates the player for winning the game' do
        output = Output.new
        
        assert_equal "Congratulations!!! You won the game.\n", output.saysCongratulations
    end

    it 'tells the player the computer won the game' do
        output = Output.new
        
        assert_equal "Sorry! The computer won the game.\n", output.saysSorry
    end

    it 'asks the player to enter a move' do
        output = Output.new
        
        assert_equal "Please enter the number of the square you would like to play from 1 to 9:\n", output.saysEnterMove
    end

    it 'announces the computer\'s move' do
        output = Output.new
        
        assert_equal "The Computer's Move: \n", output.saysTheComputersMove
    end

    it 'announces the player\'s move' do
        output = Output.new
        
        assert_equal "Your Move: \n", output.saysYourMove
    end

    it 'says the game ended in a tie' do
        output = Output.new
        
        assert_equal "Game ended in a Tie.\n", output.saysGameTied
    end

    it 'prints a new line character' do
        output = Output.new
        
        assert_equal "\n", output.newLine
    end
end