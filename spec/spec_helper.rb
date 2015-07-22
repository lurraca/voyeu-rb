$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'voyeur'

require 'webmock/rspec'
require 'vcr'

require 'pry'

VCR.configure do |c|
  c.cassette_library_dir = "spec/fixtures"
  c.hook_into :webmock
end
