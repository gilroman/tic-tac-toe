require 'minitest/autorun'
require_relative '../src/ai'
require_relative '../src/tic-tac-toe'

describe AI do   
    describe 'miniMax method' do
        it 'should return 100 if the computer has won' do
            ai = AI.new
            game = TicTacToe.new
            activePlayerName = 'O'
            game.board.board = ['X', 'X', 'O', 3, 'O', 'X', 'O', 7, 8]
            
            score = ai.miniMax(game.gameRules, game.board, activePlayerName)
            
            assert_equal 100, score
        end
    
        it 'should return -100 if the player has won' do
            ai = AI.new
            game = TicTacToe.new
            activePlayerName = 'O'
            game.board.board = ['X', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 8]
            
            score = ai.miniMax(game.gameRules, game.board, activePlayerName)
            
            assert_equal (-100), score
        end
    
        it 'should return 0 if no one has won' do
            ai = AI.new
            game = TicTacToe.new
            activePlayerName = 'O'
            game.board.board = ['X', 'X', 'O','O', 'O', 'X', 'X', 'O', 'X']
            
            score = ai.miniMax(game.gameRules, game.board, activePlayerName)
            
            assert_equal 0, score
        end
    end
    
    describe 'getBestMove method' do
        it 'should return the winning move' do
            ai = AI.new
            game = TicTacToe.new
            activePlayerName = 'O'
            game.board.board = ['X', 'X', 'O', 'O', 'O', 'X', 6, 7, 'X']
            winningMove = 6
    
            ai.miniMax(game.gameRules, game.board, activePlayerName)
            result =  ai.getBestMove
    
            assert_equal winningMove, result
        end
    end

    describe 'getBestScore method' do
        it 'should have a hash key for a best move score of 99 if the next move is for the computer, "O"' do
            ai = AI.new
            game = TicTacToe.new
            activePlayerName = 'O'
            game.board.board = ['X', 'X', 'O', 'O', 'O', 'X', 6, 7, 'X']
            
            ai.miniMax(game.gameRules, game.board, activePlayerName)
            bestScore = ai.getBestScore
            
            assert_equal 99, bestScore
        end
    end
end