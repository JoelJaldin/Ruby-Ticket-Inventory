require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.describe Scheduler do
  describe 'example 1' do
    before do
      VCR.insert_cassette 'example1', record: :new_episodes, match_requests_on: [:method, :uri]
    end

    after do
      VCR.eject_cassette
    end

    it 'finds the IDs that need updating' do
      allow(Faraday).to receive(:get).and_raise(SocketError) # API being down
      expect { Scheduler.new.schedule_updates }.not_to raise_error
    end

    it 'creates the update schedule' do
      allow(Faraday).to receive(:get).and_raise(SocketError) # API being down
      expect { Scheduler.new.schedule_updates }.not_to raise_error
    end
  end

  describe 'example 2' do
    before do
      VCR.insert_cassette 'example2', record: :new_episodes, match_requests_on: [:method, :uri]
    end

    after do
      VCR.eject_cassette
    end

    it 'finds the IDs that need updating' do
      allow(Faraday).to receive(:get).and_raise(SocketError) # API being down
      expect { Scheduler.new.schedule_updates }.not_to raise_error
    end

    it 'creates the update schedule' do
      allow(Faraday).to receive(:get).and_raise(SocketError) # API being down
      expect { Scheduler.new.schedule_updates }.not_to raise_error
    end
  end

  describe 'example 3' do
    before do
      VCR.insert_cassette 'example3', record: :new_episodes, match_requests_on: [:method, :uri]
    end

    after do
      VCR.eject_cassette
    end

    it 'finds the IDs that need updating' do
      allow(Faraday).to receive(:get).and_raise(SocketError) # API being down
      expect { Scheduler.new.schedule_updates }.not_to raise_error
    end

    it 'creates the update schedule' do
      allow(Faraday).to receive(:get).and_raise(SocketError) # API being down
      expect { Scheduler.new.schedule_updates }.not_to raise_error
    end
  end
end
