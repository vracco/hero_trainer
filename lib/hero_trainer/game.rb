module HeroTrainer
  class Game
    def initialize hero, *calendar
      unless hero.kind_of? HeroTrainer::Hero
        raise ArgumentError, "require a valid hero"
      end
      @hero = hero
      @calendar = calendar
    end

    def hero
      @hero
    end

    def calendar
      @calendar
    end
  end
end