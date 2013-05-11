require 'spec_helper'

describe HeroTrainer::Hero do
  let(:subject) { HeroTrainer::Hero.new 'Sennar' }

  context 'constructor' do
    it 'requires a name' do
      expect { subject }.to_not raise_error
    end
  end

  context 'name' do
    it 'is retrieved with #name' do
      subject.name.should == 'Sennar'
    end

    it 'cannot be set by the user' do
      subject.should_not respond_to :name=
    end

    it 'is passed in constructor' do
      subject = HeroTrainer::Hero.new 'Giuseppe'
      subject.name.should == 'Giuseppe'
    end

    it 'is Unknown if it is not passed in constructor' do
      subject = HeroTrainer::Hero.new
      subject.name.should == 'Unknown'
    end
  end

  context 'life' do
    it 'is retrieved with #life' do
      subject.should respond_to :life
    end

    it 'is 100 by default' do
      subject.life.should == 100
    end

    it 'can be set with #life=' do
      expect { subject.life = 98 }.to change(subject, :life).to 98
    end

    it 'cannot be greater than 100' do
      subject.life = 90
      expect { subject.life = 120 }.to change(subject, :life).to 100
    end

    it 'cannot be lesser than 0' do
      subject.life = 90
      expect { subject.life = -20 }.to change(subject, :life).to 0
    end
  end

  context '#skills' do
    it 'returns the list of available skills' do
      subject.should respond_to :skills
      subject.skills.should be_a Array
    end

    it 'returns Skill objects' do
      subject.skills.map(&:class).uniq.should == [HeroTrainer::Skill]
    end

    it 'are strength, wisdom, dexterity, constitution, charisma' do
      subject.skills.map(&:name).should =~ [:strength, :wisdom, :dexterity, :constitution, :charisma]
    end
  end

  context '#skill' do
    it 'returns a given skill' do
      subject.skill(:strength).name.should == :strength
    end

    it 'returns nil if no skill is found' do
      subject.skill(:pippo).should be_nil
    end
  end

  context '#add_exp' do
    it 'calls #add_exp on the given skill' do
      skill = subject.skill :strength
      expect { subject.add_exp :strength, 50 }.to change(skill, :exp).by 50
    end

    it 'returns true if the skill has changed level' do
      subject.add_exp(:strength, 102).should be_true
    end

    it 'returns false if the skill has not changed level' do
      subject.add_exp(:strength, 102)
      subject.add_exp(:strength, 90).should be_false
    end
  end

  context '#age' do
    it 'returns the years passed in the calendar + 18' do
      calendar = HeroTrainer::Calendar.new
      calendar.pass 3000
      subject.age(calendar).should == 28
    end
  end
end