class Output
    ASKS_PLAYER_TURN = "Would you like to play first?. (Y/n): "
    NEW_LINE = "\n"
    SAYS_CONGRATULATIONS = "Congratulations!!! You won the game.\n"
    SAYS_ENTER_MOVE = "Please enter the number of the square you would like to play from 1 to 9:\n"
    SAYS_GAME_TIED = "Game ended in a Tie.\n"
    SAYS_LOCATION_TAKEN = "That location is invalid please play another position.\n"
    SAYS_SORRY = "Sorry! The computer won the game.\n"
    SAYS_THE_COMPUTERS_MOVE = "The Computer's Move: \n"
    SAYS_WELCOME = "Welcome to Gil's Tic-Tac-Toe Game!\n"
    SAYS_YOUR_MOVE = "Your Move: \n"
    WRONG_LETTER_WARNING = "Please answer with the letters Y or n only!"
    
    def gameIntro(boardAsString)
        string = [SAYS_WELCOME, boardAsString, NEW_LINE].join
        string
    end
end