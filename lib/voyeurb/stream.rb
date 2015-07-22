module Voyeurb
  class Stream < Base

    attr_reader :id, :scheduled_start_time, :actual_start_time, :site, :title,
    :url, :user, :viewers

    def initialize(attributes)
      @id = attributes["id"]
      @scheduled_start_time = attributes["scheduled_start_time"]
      @actual_start_time = attributes["actual_start_time"]
      @site = attributes["site"]
      @title = attributes["title"]
      @url = attributes["url"]
      @user = attributes["user"]
      @viewers = attributes["viewers"]
    end

    def self.find(id)
      response = Faraday.get("#{ENDPOINT}/streams/#{id}")
      raise StreamNotFound unless response.success?
      attributes = JSON.parse(response.body)["data"]
      new(attributes)
    end

    def self.live
      response = Faraday.get("#{ENDPOINT}/streams/live")
      streams = JSON.parse(response.body)["data"]
      streams.map { |attributes| new(attributes) }
    end

    def self.upcoming
      response = Faraday.get("#{ENDPOINT}/streams/upcoming")
      streams = JSON.parse(response.body)["data"]
      streams.map { |attributes| new(attributes) }
    end

    def self.completed
      # The endpoint for completed returns an error when trying to hit it the API
      # Will implement when is back working again.

      # response = Faraday.get("#{ENDPOINT}/streams/completed")
      # streams = JSON.parse(response.body)["data"]
      # streams.map { |attributes| new(attributes) }
    end

  end
end