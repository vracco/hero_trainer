module HeroTrainer
  class Skill
    def initialize strength
      @name = strength.to_sym
      @exp = 0
    end

    def name
      @name
    end

    def exp
      @exp
    end

    def add_exp point_exp
      previous_level = level
      if point_exp > 0 
        @exp += point_exp
        @exp = 4500 if @exp > 4500
      end
      previous_level != level
    end

    def level
      case @exp
      when 0...100
        1
      when 100...300
        2
      when 300...600
        3
      when 600...1000
        4
      when 1000...1500
        5
      when 1500...2100
        6
      when 2100...2800
        7
      when 2800...3600
        8
      when 3600...4500
        9
      else
        10
      end
    end
  end
end