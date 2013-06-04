module HeroTrainer
  class Game
    def initialize hero, options={}
      unless hero.kind_of? Hero
        raise ArgumentError, "require a valid hero"
      end
      @hero = hero
      @calendar = options[:calendar] || Calendar.new
    end

    def hero
      @hero
    end

    def calendar
      @calendar
    end
  end
end