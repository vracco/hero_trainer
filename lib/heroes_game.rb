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

class Calendar
  def initialize
    @year = 1
    @month = 1
    @day = 1
  end

  def year
    @year
  end

  def month
    @month
  end

  def day
    @day
  end

  def pass pass_day
    if pass_day > 0
      @day += pass_day
      while @day > 30
        @month += 1
        @day -= 30
        if @month >= 10
          @month -= 10
          @year += 1
        end
      end
    end
  end
end

class Hero
  def initialize name='Unknown'
    @name = name
    @life = 100
    @skills = [Skill.new(:strength), Skill.new(:wisdom), Skill.new(:dexterity), Skill.new(:constitution), Skill.new(:charisma)]
  end

  def name 
    @name
  end

  def life
    @life
  end

  def life= life
    if life < 0 
      @life = 0
    elsif life >= 100
      @life = 100
    else
      @life = life
    end
  end
  
  def skills
    @skills
  end

  def skill name_skill
    skills.detect { |x| x.name == name_skill}
  end

  def add_exp skill_name, point
    a = self.skill skill_name
    a.add_exp point
  end

  def age time_pass
    a = time_pass.year + 17
  end
end