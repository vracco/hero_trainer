require 'spec_helper'

describe HeroTrainer::Game do
  let(:hero) { HeroTrainer::Hero.new }
  let(:room) { HeroTrainer::Room.new 'title', 'description' }
  let(:subject) { HeroTrainer::Game.new hero, room }

  describe 'constructor' do
    it 'requires a valid hero' do
      expect { HeroTrainer::Game.new 'foo', room }.to raise_error ArgumentError, /valid.*hero/
    end

    it 'requires a valid room' do
      expect { HeroTrainer::Room.new hero, 'foo' }.to raise_error ArgumentError, /valid.*room/
    end
  end

  describe 'hero' do
    it 'can be set via constructor' do
      HeroTrainer::Game.new(hero, room).hero.should == hero
    end

    it 'cannot be set' do
      subject.should_not respond_to :hero=
    end
  end

  describe 'room' do
    it 'can be set via constructor' do
      HeroTrainer::Game.new(hero, room).room.should == room
    end

    it 'cannot be set' do
      subject.should_not respond_to :room=
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
      HeroTrainer::Game.new(hero, room, :calendar => calendar).calendar.should == calendar
    end

    it 'cannot be set' do
      subject.should_not respond_to :calendar=
    end
  end
end