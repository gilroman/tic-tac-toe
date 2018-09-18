class Output
    def newLine 
        "\n"
    end
    
    def asksPlayerTurn 
        "Would you like to play first?. (Y/n): "
    end

    def gameIntro(boardAsString)
        string = [self.saysWelcome, boardAsString, self.newLine].join
        string
    end

    def wrongLetterWarning
        "Please answer with the letters Y or n only!"
    end

    def saysCongratulations
        "Congratulations!!! You won the game.\n"
    end

    def saysEnterMove
        "Please enter the number of the square you would like to play from 1 to 9:\n"
    end

    def saysWelcome
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