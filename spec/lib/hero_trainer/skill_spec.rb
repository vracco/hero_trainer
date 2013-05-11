require 'spec_helper'

describe HeroTrainer::Skill do
  let(:subject) { HeroTrainer::Skill.new :strength }

  context 'constructor' do
    it 'requires a name' do
      expect { subject }.to_not raise_error
      expect { HeroTrainer::Skill.new }.to raise_error ArgumentError
    end

    it 'accepts name as string' do
      expect { HeroTrainer::Skill.new 'foo' }.to_not raise_error
    end

    it 'accepts name as symbol' do
      expect { HeroTrainer::Skill.new :foo }.to_not raise_error
    end
  end

  context 'name' do
    it 'is retrieved via #name' do
      subject.name.should == :strength
    end

    it 'cannot be set by the user' do
      subject.should_not respond_to :name=
    end

    it 'is passed in constructor' do
      subject = HeroTrainer::Skill.new :wisdom
      subject.name.should == :wisdom
    end

    it 'is always treated as a symbol' do
      subject = HeroTrainer::Skill.new 'wisdom'
      subject.name.should == :wisdom
    end
  end

  context 'experience' do
    it 'is retrieved via #exp' do
      subject.should respond_to :exp
    end

    it 'cannot be set by the user' do
      subject.should_not respond_to :exp=
    end

    it 'is 0 by default' do
      subject.exp.should == 0
    end

    it 'is increased with add_exp' do
      subject.add_exp 50
      subject.add_exp 3950
      subject.exp.should == 4000
    end

    it 'is not increased if add_exp is called with a negative value' do
      subject.add_exp 50
      subject.add_exp -10
      subject.exp.should == 50
    end

    it 'cannot be greater than 4500' do
      subject.add_exp 4000
      subject.add_exp 501
      subject.exp.should == 4500
    end
  end

  context 'level' do
    def build_with_exp points
      HeroTrainer::Skill.new(:strength).tap { |s| s.add_exp points }
    end

    it 'is retrieved via #level' do
      subject.should respond_to :level
    end

    it 'cannot be set by the user' do
      subject.should_not respond_to :level=
    end

    it 'is 1 by default' do
      subject.level.should == 1
    end

    it 'is 10 if exp is 4500' do
      subject.add_exp 4500
      subject.level.should == 10
    end

    it 'is 9 if exp is between 3600 and 4499' do
      (0...900).each do |exp|
        subject = build_with_exp 3600 + exp
        subject.level.should == 9
      end
    end

    it 'is 8 if exp is between 2800 and 3599' do
      (0...800).each do |exp|
        subject = build_with_exp 2800 + exp
        subject.level.should == 8
      end
    end

    it 'is 7 if exp is between 2100 and 2799' do
      (0...700).each do |exp|
        subject = build_with_exp 2100 + exp
        subject.level.should == 7
      end
    end

    it 'is 6 if exp is between 1500 and 2099' do
      (0...600).each do |exp|
        subject = build_with_exp 1500 + exp
        subject.level.should == 6
      end
    end

    it 'is 5 if exp is between 1000 and 1499' do
      (0...500).each do |exp|
        subject = build_with_exp 1000 + exp
        subject.level.should == 5
      end
    end

    it 'is 4 if exp is between 600 and 999' do
      (0...400).each do |exp|
        subject = build_with_exp 600 + exp
        subject.level.should == 4
      end
    end

    it 'is 3 if exp is between 300 and 599' do
      (0...300).each do |exp|
        subject = build_with_exp 300 + exp
        subject.level.should == 3
      end
    end

    it 'is 2 if exp is between 100 and 299' do
      (0...200).each do |exp|
        subject = build_with_exp 100 + exp
        subject.level.should == 2
      end
    end

    it 'is 1 if exp is between 0 and 99' do
      (0...100).each do |exp|
        subject = build_with_exp exp
        subject.level.should == 1
      end
    end
  end

  context '#add_exp' do
    it 'returns true if level has changed' do
      subject.add_exp 99
      subject.add_exp(10).should be_true
    end

    it 'returns false if level has not changed' do
      subject.add_exp 100
      subject.add_exp(1).should be_false
    end
  end
end