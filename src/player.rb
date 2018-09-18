class Player
    attr_accessor :name
    def initialize(name)
        @name = name
    end

    def move
        raise NotImplementedError, 'You must implement the move method'
    end
end