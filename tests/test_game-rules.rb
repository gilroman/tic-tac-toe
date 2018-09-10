require 'minitest/autorun'
require_relative '../src/game-rules'
require_relative '../src/board'
require_relative '../src/human'
require_relative '../src/computer'

describe GameRules do
    it 'should have a constant pointing to an array of winning combinations' do
        winningCombinations = [
            [0,1,2],
            [3,4,5],
            [6,7,8],
            [0,3,6],
            [1,4,7],
            [2,5,8],
            [0,4,8],
            [2,4,6]            
        ]

        assert_equal winningCombinations, GameRules::WINNING_COMBINATIONS
    end
    

    describe "getWinner method" do
        it 'should return an instance of the player class that won the game' do
            gameRules = GameRules.new
            player1 = Human.new('X')
            player2 = Computer.new('O')
            board = Board.new(['X', 'O', 2, 'X', 'O', 5, 'X', 7, 8])

            winner = gameRules.getWinner(board, player1, player2)

            assert_equal player1, winner
        end
    end

    describe "isGameOver? method" do
        it 'should report if the game is over because the board is full' do
            gameRules = GameRules.new
            board = Board.new(['X', 'O', 'X', 'X', 'O', 'O', 'O', 'X', 'X'])
            player1 = Human.new('X')
            player2 = Computer.new('O')
    
            over = gameRules.isGameOver?(board, player1, player2)
            
            assert over
        end

        it 'should report if the game is over because there is a winning combination on the board' do
            gameRules = GameRules.new
            board = Board.new(['X', 'O', 'O', 'X', 'X', 'O', 'X', 7, 8])
            player1 = Human.new('X')
            player2 = Computer.new('O')
    
            over = gameRules.isGameOver?(board, player1, player2)
            
            assert over
        end       
    end

    describe 'isGameTied? method' do
        it 'should report if the game ended in a tie' do
            gameRules = GameRules.new
            board = Board.new(['O', 'O', 'X', 'X', 'X', 'O', 'O', 'O', 'X'])
            player1 = Human.new('X')
            player2 = Computer.new('O')
    
            tied = gameRules.isGameTied?(board, player1, player2)
    
            assert tied
        end 
    end
    
    describe 'isGameWon? method' do
        it 'should report that a player has won the game' do
            gameRules = GameRules.new
            board = Board.new(['X', 'O', 'X', 'O', 'X', 'O', 6, 7, 'X'])
            player1 = Human.new('X')

            won = gameRules.isGameWon?(board, player1.name)
            assert won
        end

        it 'should report that a player hasn\'t won the game' do
            gameRules = GameRules.new
            board = Board.new(['X', 'O', 'X', 'O', 'X', 'O', 6, 7, 'X'])
            player2 = Computer.new('O')

            won = gameRules.isGameWon?(board, player2.name)
            assert !won
        end
    end
end