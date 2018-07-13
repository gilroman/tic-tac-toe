class CommandLineInterface
    def initialize(input=$stdin, output=$stdout)
        @input = input
        @output = output
    end

    def getInput   
        @input.gets.chomp.to_i
    end

    def printToScreen(string)
        @output.puts string
    end
end