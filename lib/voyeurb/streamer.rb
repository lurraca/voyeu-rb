module Voyeurb
  class Streamer < Base
    attr_reader :name, :twitch, :youtube

    def initialize(attributes)
      @name = attributes["name"]
      @twitch = attributes["twitch"]
      @youtube = attributes["youtube"]
    end

    def self.by_name(name)
      response = Faraday.get("#{ENDPOINT}/streamers/#{name}")
      raise StreamerNotFound unless response.success?
      attributes = JSON.parse(response.body)["data"]
      new(attributes)
    end

    def self.all
      response = Faraday.get("#{ENDPOINT}/streamers")
      streamers = JSON.parse(response.body)["data"]
      streamers.map { |attributes| new(attributes) }
    end

    def live
      response = Faraday.get("#{ENDPOINT}/streamers/#{name}/live")
      streams = JSON.parse(response.body)["data"]
      streams.map { |attributes| Stream.new(attributes) }
    end

    def upcoming
      response = Faraday.get("#{ENDPOINT}/streamers/#{name}/upcoming")
      streams = JSON.parse(response.body)["data"]
      streams.map { |attributes| Stream.new(attributes) }
    end

    def completed
      response = Faraday.get("#{ENDPOINT}/streamers/#{name}/completed")
      streams = JSON.parse(response.body)["data"]
      streams.map { |attributes| Stream.new(attributes) }
    end
  end
end