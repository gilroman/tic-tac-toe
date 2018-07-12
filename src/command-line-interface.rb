class CommandLineInterface
    def initialize(input=$stdin, output=$stdout)
        @input = input
        @output = output
    end

    def asksForPlayPosition
        @output.puts "Please enter the number of the square you would like to play from 1 to 9:\n"
        @input.gets.chomp.to_i
    end

    def saysCongratulations
        @output.puts "Congratulations!!! You won the game.\n"
    end

    def introMessage
        @output.puts "Welcome to Gil's Tic-Tac-Toe Game!\n"
    end

    def saysLocationTaken
        @output.puts "That location is invalid please play another position.\n"
    end

    def saysSorry
        @output.puts "Sorry! The computer won the game.\n"
    end
end