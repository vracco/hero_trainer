require 'spec_helper'

describe HeroTrainer::Room do
  let(:subject) { HeroTrainer::Room.new 'title', 'description' }

  it 'requires title and text at constructor' do
    expect { subject }.to_not raise_error
  end

  context 'title' do
    it 'can be retrieved with a reader' do
      subject.title.should == 'title'
    end

    it 'cannot be set' do
      subject.should_not respond_to :title=
    end
  end

  context 'text' do
    it 'can be retrieved with a reader' do
      subject.text.should == 'description'
    end

    it 'cannot be set' do
      subject.should_not respond_to :text=
    end
  end

  context 'bindings to other rooms' do
    it 'can be set with []' do
      expect { subject[:north] = HeroTrainer::Room.new 'a', 'b' }.to_not raise_error
    end

    it 'can be retrieved with []' do
      subject[:north] = room = HeroTrainer::Room.new 'a', 'b'
      subject[:north].should == room
    end

    it 'can be retrieved using both symbols and strings' do
      subject['north'] = HeroTrainer::Room.new 'a', 'b'
      subject[:north].should == subject['north']
    end

    it 'cannot be set to the current room' do
      expect { subject[:north] = subject }.to raise_error ArgumentError, /cannot be set to itself/i
    end

    it 'cannot be set with a nil binding name' do
      expect { subject[nil] = HeroTrainer::Room.new 'a', 'b' }.to raise_error ArgumentError, /cannot be set with a nil binding name/i
    end

    it 'can be set to nil to remove the binding' do
      subject[:north] = HeroTrainer::Room.new 'a', 'b'
      expect { subject[:north] = nil }.to_not raise_error
      subject[:north].should be_nil
    end

    it 'can be set only to rooms' do
      expect { subject[:north] = 'a' }.to raise_error ArgumentError, /can be set only to rooms/i
    end
  end
end