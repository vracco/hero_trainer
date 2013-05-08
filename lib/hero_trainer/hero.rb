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
    time_pass.year + 17
  end
end