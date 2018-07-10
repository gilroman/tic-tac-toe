require 'minitest/autorun'
require_relative '../src/command-line-interface'

describe CommandLineInterface do
    it 'welcomes the player to the game' do
        output = StringIO.new
        cli = CommandLineInterface.new(nil, output)
        cli.introMessage
        assert_equal "Welcome to Gil's TicTacToe Game!\n", output.string
    end

    it 'asks the player for a number from 1 to 9' do
        input = StringIO.new('2')
        output = StringIO.new
        cli = CommandLineInterface.new(input, output)
        cli.asksForPlayPosition
    
        assert_equal "Please enter the number of the square you would like to play from 1 to 9:\n", output.string
        assert_includes (1..9).to_a, input.string.to_i 
    end

    it 'warns the player that a location is invalid' do
        output = StringIO.new
        cli = CommandLineInterface.new(nil, output)
        cli.saysLocationTaken
        assert_equal "That location is invalid pleace play another position.\n", output.string
    end

    it 'congratulates the player for winning the game' do
        output = StringIO.new
        cli = CommandLineInterface.new(nil, output)
        cli.saysCongratulations
        assert_equal "Congratulations!!! You won the game.\n", output.string
    end

    it 'tells the player the computer won the game' do
        output = StringIO.new
        cli = CommandLineInterface.new(nil, output)
        cli.saysSorry
        assert_equal "Sorry! The computer won the game.\n", output.string
    end
end