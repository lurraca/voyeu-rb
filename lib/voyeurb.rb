require 'faraday'
require 'json'

require 'voyeurb/version'

module Voyeurb
  class StreamNotFound < Exception; end
  class StreamerNotFound < Exception; end

  class Base
    ENDPOINT = 'http://www.watchpeoplecode.com/api/v1'
  end

  autoload :Stream, 'voyeurb/stream'
  autoload :Streamer, 'voyeurb/streamer'
end
