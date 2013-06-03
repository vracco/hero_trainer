module HeroTrainer
  class Game
    def initialize hero, calendar={}
      unless hero.kind_of? HeroTrainer::Hero
        raise ArgumentError, "require a valid hero"
      end
      @hero = hero
      @calendar = calendar[:calendar]
    end

    def hero
      @hero
    end

    def calendar
      unless @calendar
        @calendar = HeroTrainer::Calendar.new
      else
        @calendar
      end
    end
  end
end