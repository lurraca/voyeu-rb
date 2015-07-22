require 'faraday'
require 'json'

require 'voyeur/version'

module Voyeur
  class StreamNotFound < Exception; end

  class Base
    ENDPOINT = 'http://www.watchpeoplecode.com/api/v1'
  end

  autoload :Stream, 'voyeur/stream'
end
