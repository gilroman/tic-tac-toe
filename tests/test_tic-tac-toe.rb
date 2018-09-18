require 'minitest/autorun'
require_relative '../src/tic-tac-toe'

describe TicTacToe do    
    it 'should have an active player' do
        game = TicTacToe.new
        game.setPlayers(2)
        
        
        assert_equal 'O', game.activePlayer.name
    end

    it 'should allow setting an active player' do
        game = TicTacToe.new
        game.setPlayers(1)
        
        game.setActivePlayer(game.player2)
        
        assert_equal game.player2, game.activePlayer
    end  
    
    it 'should set the player names based on the value 1' do
        game = TicTacToe.new
        game.setPlayers(1)

        assert_equal 'X', game.player1.name
        assert_equal 'O', game.player2.name
        assert_equal 'X', game.activePlayer.name
    end

    it 'should set the player names based on the value 2' do
        game = TicTacToe.new
        game.setPlayers(2)

        assert_equal 'O', game.player1.name
        assert_equal 'X', game.player2.name
        assert_equal 'O', game.activePlayer.name
    end

    it 'should return the player who has won the game' do
        game = TicTacToe.new
        game.setPlayers(1)        
        game.board.board = ['X', 'O', 'X', 'X', 'O', 'O', 'X', 7, 8]

        winner = game.getWinner

        assert_equal game.player1.class.name, winner.class.name
    end

    it 'switches the active player' do
        game = TicTacToe.new
        game.setPlayers(1)

        game.switchPlayers

        assert_equal game.player2, game.activePlayer
    end

    it 'returns the string \'Sorry! The computer won the game.\' if the computer wins the game' do
        game = TicTacToe.new
        game.setPlayers(1)
        game.board.board = ['X', 'O', 'X', 'O', 'O', 'X', 'X', 'O', 8] 

        string = <<~END
        Sorry! The computer won the game.
        END

        assert_equal string, game.printEnding
    end

    it 'returns the string \'Game ended in a Tie.\' if the game is tied' do
        game = TicTacToe.new
        game.setPlayers(1)
        game.board.board = ['X', 'O', 'X', 'O', 'O', 'X', 'X', 'X', 'O']


        string = <<~END
        Game ended in a Tie.
        END

        assert_equal string, game.printEnding
    end

    it 'returns the string \'Congratulations!!! You won the game.\' out congratulations if the human player wins the game' do
        game = TicTacToe.new
        game.setPlayers(1)
        game.board.board = ['X', 'O', 'X', 'O', 'O', 'X', 6, 7, 'X']

        string = <<~END
        Congratulations!!! You won the game.
        END

        assert_equal string, game.printEnding
    end

    it 'returns a string for the players\'s move after a player move' do
        game = TicTacToe.new
        game.setPlayers(1)
        game.board.board = [0, 1, 2, 3, 'X', 5, 6, 7, 8] 
        heading = "Your Move: \n"
        board = "   |   |   \n------------\n   | X |   \n------------\n   |   |   \n"
        string = "\n" + heading + board + "\n" 

        assert_equal string, game.playerMove
    end

    it 'returns a string for the computer\'s move after a computer move' do
        game = TicTacToe.new
        game.setPlayers(2)
        game.board.board = [0, 1, 2, 3, 'O', 5, 6, 7, 8] 
        heading = "The Computer's Move: \n"
        board = "   |   |   \n------------\n   | O |   \n------------\n   |   |   \n"
        string = heading + board + "\n"

        assert_equal string, game.playerMove
    end

    it 'should report if the game is tied' do
        game = TicTacToe.new
        game.setPlayers(1)
        game.board.board = ['O', 'O', 'X', 'X', 'X', 'O', 'O', 'O', 'X']
        
        tied = game.isTied?
        
        assert tied
    end 

    it 'should report if the game is over because the board is full' do
        game = TicTacToe.new
        game.setPlayers(1)
        game.board.board = ['X', 'O', 'X', 'X', 'O', 'O', 'O', 'X', 'X']
        
        over = game.isGameOver?
        
        assert over
    end

    it 'should report if the game is over because there is a winning combination on the board' do
        game = TicTacToe.new
        game.setPlayers(1)
        game.board.board = ['X', 'O', 'O', 'X', 'X', 'O', 'X', 7, 8]
        
        over = game.isGameOver?
        
        assert over
    end   
end