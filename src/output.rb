class Output
    def boardToString(board)
        newBoard = board.map do | value |
            if value.is_a?(Numeric)
                " "
            else
                value
            end
        end
        " #{newBoard[0]} | #{newBoard[1]} | #{newBoard[2]} \n" +
            "------------\n" +
            " #{newBoard[3]} | #{newBoard[4]} | #{newBoard[5]} \n" +
            "------------\n" +
            " #{newBoard[6]} | #{newBoard[7]} | #{newBoard[8]} \n"
    end

    def newLine 
        "\n"
    end
    def saysCongratulations
        "Congratulations!!! You won the game.\n"
    end

    def saysEnterMove
        "Please enter the number of the square you would like to play from 1 to 9:\n"
    end

    def saysGameIntro
        "Welcome to Gil's Tic-Tac-Toe Game!\n"
    end

    def saysGameTied
        "Game ended in a Tie.\n"
    end

    def saysLocationTaken
        "That location is invalid please play another position.\n"
    end

    def saysSorry
        "Sorry! The computer won the game.\n"
    end

    def saysTheComputersMove
        "The Computer's Move: \n"
    end

    def saysYourMove
        "Your Move: \n"
    end
end