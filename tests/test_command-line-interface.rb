require 'minitest/autorun'
require_relative '../src/command-line-interface'

describe CommandLineInterface do 
    describe 'getInput method' do
        it 'asks the player for a number from 1 to 9' do
            input = StringIO.new('2')
            cli = CommandLineInterface.new(input, nil)
    
            assert_includes (1..9).to_a, cli.getInput.to_i 
        end
    end

    describe 'printToScreen method' do
        it 'prints a string to screen' do
            output = StringIO.new
            cli = CommandLineInterface.new(nil, output)
            string = "Testing Print To Screen Functionality\n"
            
            cli.printToScreen(string)
            
            assert_equal string, output.string
        end
    end
end