require 'spec_helper'

describe Voyeurb do
  it 'has a version number' do
    expect(Voyeurb::VERSION).not_to be nil
  end

  it 'has a Base class' do
  	expect(Voyeurb::Base).not_to be nil
  end
end
