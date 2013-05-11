require 'spec_helper'

describe HeroTrainer::Game do
  let(:hero) { HeroTrainer::Hero.new }
  let(:subject) { HeroTrainer::Game.new hero }

  describe 'constructor' do
    it 'requires a valid hero' do
      expect { HeroTrainer::Game.new 'foo' }.to raise_error ArgumentError, /valid.*hero/
    end
  end

  describe 'hero' do
    it 'can be set via constructor' do
      hero = HeroTrainer::Hero.new
      HeroTrainer::Game.new(hero).hero.should == hero
    end

    it 'cannot be set' do
      subject.should_not respond_to :hero=
    end
  end

  describe 'calendar' do
    it 'can be retrieved via a reader' do
      subject.should respond_to :calendar
    end

    it 'is built by default' do
      subject.calendar.should be_a HeroTrainer::Calendar
    end

    it 'can be specified in constructor using optional arguments' do
      calendar = HeroTrainer::Calendar.new
      HeroTrainer::Game.new(hero, :calendar => calendar).calendar.should == calendar
    end

    it 'cannot be set' do
      subject.should_not respond_to :calendar=
    end
  end
end