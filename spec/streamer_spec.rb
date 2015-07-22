require 'spec_helper'

describe Voyeurb::Streamer do
  describe '.all' do

    it 'returns a list of all streamers' do
      VCR.use_cassette('all_streamers') do
        response = described_class.all
        expect(response).to be_kind_of(Array)
        expect(response.first.class).to eq(described_class)
      end
    end
  end

  describe '.by_name' do
    context 'invalid name' do

      it 'returns a StreamerNotFound Exception' do
        VCR.use_cassette('invalid_streamer') do
          expect{ described_class.by_name("NOTXXFOUND") }.to raise_error(Voyeurb::StreamerNotFound)
        end
      end
    end

    context 'valid name' do

      it 'returns the requested streamer' do
        VCR.use_cassette('one_streamer') do
          streamer = described_class.by_name('godlikesme')
          expect(streamer.class).to eq(described_class)
          expect(streamer.name).to eq('godlikesme')
          expect(streamer.twitch).to eq('mimimitor_')
          expect(streamer.youtube).to eq('UCJAVLOqT6Mgn_YD5lAxxkUA')
        end
      end
    end
  end

  describe '#live' do

    it 'returns live streams of the specific streamer' do
      VCR.use_cassette('live_of_streamer') do
        streamer = described_class.by_name('godlikesme')
        live_streams = streamer.live
        expect(live_streams).to be_kind_of(Array)
      end
    end
  end

  describe '#upcoming' do

    it 'returns upcoming streams of the specific streamer' do
      VCR.use_cassette('upcoming_of_streamer') do
        streamer = described_class.by_name('godlikesme')
        upcoming_streams = streamer.upcoming
        expect(upcoming_streams).to be_kind_of(Array)
      end
    end
  end

  describe '#completed' do

    it 'returns completed streams of the specific streamer' do
      VCR.use_cassette('completed_of_streamer') do
        streamer = described_class.by_name('godlikesme')
        completed_streams = streamer.completed
        expect(completed_streams).to be_kind_of(Array)
      end
    end

  end
end