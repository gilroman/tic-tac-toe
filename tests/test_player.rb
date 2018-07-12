require 'minitest/autorun'
require_relative '../src/player'

describe Player do
    it 'has a name' do
        human = Player.new('X')
        name = human.name
        assert_equal 'X', name
    end
end