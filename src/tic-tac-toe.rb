require_relative 'board'
require_relative 'command-line-interface'
require_relative 'computer'
require_relative 'player'

class TicTacToe
    attr_accessor :activePlayer
    attr_reader :board, :cli, :player, :computer
    def initialize
        @board = Board.new
        @cli = CommandLineInterface.new
        @player = Player.new('X')
        @computer = Computer.new('O')
        @activePlayer = @player
    end

    def isOver?
        @board.isFull? || @board.isGameWon?(@board, @player) ||  @board.isGameWon?(@board, @computer)
    end

    def start
        human = @player.name
        @cli.introMessage
        puts @board.getBoardAsString

        while !self.isOver? do
            activePlayerName = @activePlayer.name
            positionValid = false

            if activePlayerName == human
                while !positionValid
                    position = @cli.asksForPlayPosition
                    position -= 1
                    if  @board.isMoveValid?(position)   
                        @board.setPlay(position, @player)
                        puts "Your Move: \n"
                        puts @board.getBoardAsString
                        if @board.isGameWon?(@board, @player)
                            @cli.saysCongratulations
                        end
                        self.activePlayer = @computer
                        positionValid = true
                    else
                        puts @cli.saysLocationTaken
                    end
                end
            end 
            if !self.isOver? 
                computerMove = @computer.move(@board)
                @board.setPlay(computerMove, @computer)
                puts "The Computer's Move: \n"
                puts @board.getBoardAsString
                    if @board.isGameWon?(@board, @computer)
                        @cli.saysSorry
                    end
                self.activePlayer = @player
            end    
        end
    end
end