require 'spec_helper'

describe Voyeurb::Stream do
  describe '.find' do
    context 'invalid ID' do

      it 'raise a StreamNotFound Exception' do
        VCR.use_cassette('invalid_stream') do
          expect{described_class.find(10134239423)}.to raise_error(Voyeurb::StreamNotFound)
        end
      end
    end
    context 'valid ID' do

      it 'returns the requested stream' do
        VCR.use_cassette('one_stream') do
          stream = described_class.find(106101)
          expect(stream.class).to eq(described_class)
          expect(stream.id).to eq(106101)
          expect(stream.title).to eq('Making small reddit bots in python using PRAW')
          expect(stream.url).to eq('http://www.youtube.com/watch?v=W6_te6Q_CDs')
          expect(stream.user).to eq('godlikesme')
        end
      end
    end
  end

  describe '.live' do

    it 'returns a list of streams' do
      VCR.use_cassette('live_streams') do
        response = described_class.live
        expect(response).to be_kind_of(Array)
        expect(response.first.class).to eq(described_class)
      end
    end
  end

  describe '.upcoming' do

    it 'returns a list of upcoming streams' do
      VCR.use_cassette('upcoming_streams') do
        response = described_class.upcoming
        expect(response).to be_kind_of(Array)
        expect(response.first.class).to eq(described_class)
      end
    end
  end

  describe '.upcoming' do

    xit 'returns a list of completed streams' do
      VCR.use_cassette('upcoming_streams') do
        response = described_class.completed
        expect(response).to be_kind_of(Array)
        expect(response.first.class).to eq(described_class)
      end
    end
  end

end
