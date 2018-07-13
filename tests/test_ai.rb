require 'minitest/autorun'
require_relative '../src/ai'
require_relative '../src/tic-tac-toe'

describe AI do    
    it 'should have a minimax function' do
        assert AI.method_defined? :miniMax
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

    it 'minmax should return the best move, 6 if the computer is playing next' do
        ai = AI.new
        game = TicTacToe.new
        activePlayerName = 'O'
        board = ['X', 'X', 'O', 'O', 'O', 'X', 6, 7, 'X']
        ai.miniMax(game, board, activePlayerName)
        location = ai.getBestMove
        assert_equal 6, location
    end

end