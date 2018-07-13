require_relative 'board'
require_relative 'command-line-interface'
require_relative 'computer'
require_relative 'player'
require_relative 'output'

class TicTacToe
    attr_accessor :activePlayer, :board
    attr_reader :player, :computer
    def initialize
        @board = Board.new([0, 1, 2, 3, 4, 5, 6, 7, 8])
        @player = Player.new('X')
        @computer = Computer.new('O')
        @output = Output.new
        @activePlayer = @player
        @winningCombinations = [
            [0,1,2],
            [3,4,5],
            [6,7,8],
            [0,3,6],
            [1,4,7],
            [2,5,8],
            [0,4,8],
            [2,4,6]            
        ]
    end

    def getEmptyBoardLocations(boardArray)
        emptyBoardLocations = []

        boardArray.each do | location |
           if location.is_a?(Numeric) 
                emptyBoardLocations << location  
           end
        end

        emptyBoardLocations
    end

    def getPlays(boardArray, playerName)
        acc = []

        boardArray.each_with_index do | value, index | 
            if value == playerName
                acc << index 
            end 
        end
        
        acc
    end

    def isBoardFull?(boardArray)
        !boardArray.any? {|a| a.is_a? Integer}
    end

    def isBoardValid?(boardArray)
        boardArray == (0..8).to_a
    end

    def isGameOver?(boardArray)
        self.isBoardFull?(boardArray) || self.isGameWon?(boardArray, @player.name) ||  self.isGameWon?(boardArray, @computer.name)
    end

    def isGameWon?(boardArray, playerName)
        won = false
        plays = self.getPlays(boardArray, playerName)
        @winningCombinations.each do | combination |
            if combination.all? {
                |value| plays.include?(value) 
            }
                won = true
            end 
        end

        won
    end

    def isMoveValid?(boardArray, location)
        location.between?(0,8) && boardArray[location].is_a?(Numeric)
    end

    def start
        cli = CommandLineInterface.new
        human = @player.name
        cli.printToScreen(@output.saysGameIntro)
        cli.printToScreen(@output.boardToString([0, 1, 2, 3, 4, 5, 6, 7, 8]))

        while !self.isGameOver?(@board.board) do
            activePlayerName = @activePlayer.name
            positionValid = false

            if activePlayerName == human
                while !positionValid
                    cli.printToScreen(@output.saysEnterMove)
                    position = cli.getInput
                    position -= 1
                    if  self.isMoveValid?(@board.board, position)   
                        @board.setPlay(position, @player.name)
                        cli.printToScreen(@output.saysYourMove)
                        cli.printToScreen(
                            @output.boardToString(@board.board)
                        )
                        if self.isGameWon?(@board.board, @player.name)
                            cli.printToScreen(@output.saysCongratulations)
                        end
                        self.activePlayer = @computer
                        positionValid = true
                    else
                        cli.printToScreen(@output.saysLocationTaken)
                    end
                end
            end 
            if !self.isGameOver?(@board.board) 
                computerMove = @computer.move(self, @board.board)
                @board.setPlay(computerMove, @computer.name)
                cli.printToScreen(@output.saysTheComputersMove)
                cli.printToScreen(@output.boardToString(@board.board))
                    if self.isGameWon?(@board.board, @computer.name)
                        cli.printToScreen(@output.saysSorry)
                    end
                self.activePlayer = @player
            end    
        end
    end
end