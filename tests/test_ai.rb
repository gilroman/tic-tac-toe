require 'minitest/autorun'
require_relative '../src/ai'
require_relative '../src/tic-tac-toe'

describe AI do    
    it 'should have a minimax function' do
        assert AI.method_defined? :miniMax
    end

    it 'getBestMove should return a value of type integer' do
        ai = AI.new
        game = TicTacToe.new
        activePlayerName = 'O'
        board = [0, 1, 'X', 'X', 'O', 5, 'O', 'O', 8]
        ai.miniMax(game, board, activePlayerName)
        move =  ai.getBestMove
        assert_instance_of(Integer, move)
    end

    it 'minimax should return 100 if the computer has won' do
        ai = AI.new
        game = TicTacToe.new
        activePlayerName = 'O'
        board = ['X', 'X', 'O', 3, 'O', 'X', 'O', 7, 8]
        score = ai.miniMax(game, board, activePlayerName)
        assert_equal 100, score
    end

    it 'minimax should return -100 if the player has won' do
        ai = AI.new
        game = TicTacToe.new
        activePlayerName = 'O'
        board = ['X', 'X', 'X', 'O', 'O', 'X', 'O', 'X', 8]
        score = ai.miniMax(game, board, activePlayerName)
        assert_equal (-100), score
    end

    it 'minimax should return 0 if no one has won' do
        ai = AI.new
        game = TicTacToe.new
        activePlayerName = 'O'
        board = ['X', 'X', 'O','O', 'O', 'X', 'X', 'O', 'X']
        score = ai.miniMax(game, board, activePlayerName)
        assert_equal 0, score
    end

    it 'minmax should have a hash key for a best move score of 99 if the next move is for the computer, \'O\'' do
        ai = AI.new
        game = TicTacToe.new
        activePlayerName = 'O'
        board = ['X', 'X', 'O', 'O', 'O', 'X', 6, 7, 'X']
        ai.miniMax(game, board, activePlayerName)
        bestScore = ai.getBestScore
        assert_equal 99, bestScore
    end
end