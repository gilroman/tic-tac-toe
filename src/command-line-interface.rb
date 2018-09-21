class CommandLineInterface
    def initialize(input=$stdin, output=$stdout)
        @input = input
        @output = output
    end

    def getInput   
        @input.gets.chomp
    end

    def printToScreen(string)
        @output.print(string)
    end
end