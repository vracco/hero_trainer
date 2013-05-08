require 'spec_helper'

describe HeroTrainer::Calendar do
  context '#year' do
    it 'by default is 1' do
      subject.year.should == 1
    end

    it 'cannot be set' do
      subject.should_not respond_to :year=
    end
  end

  context '#month' do
    it 'by default is 1' do
      subject.month.should == 1
    end

    it 'cannot be set' do
      subject.should_not respond_to :month=
    end
  end

  context '#day' do
    it 'by default is 1' do
      subject.day.should == 1
    end

    it 'cannot be set' do
      subject.should_not respond_to :day=
    end
  end

  context '#pass' do
    it 'lets pass the specified days' do
      expect { subject.pass 10 }.to change(subject, :day).to 11
    end

    it 'does not do anything if days are a negative value' do
      expect { subject.pass -1 }.to_not change(subject, :day)
    end

    describe 'every 30 days' do
      it 'increases the month' do
        expect { subject.pass 40 }.to change(subject, :month).to 2
      end

      it 'resets the day starting from 1' do
        subject.pass 10
        expect { subject.pass 21 }.to change(subject, :day).to 2
      end
    end

    describe 'every 10 months' do
      it 'increases the year' do
        expect { subject.pass 300 }.to change(subject, :year).to 2
      end

      it 'resets the month starting from 1' do
        subject.pass 200
        expect { subject.pass 200 }.to change(subject, :month).to 4
      end
    end
  end
end