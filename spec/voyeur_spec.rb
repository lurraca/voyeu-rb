require 'spec_helper'

describe Voyeur do
  it 'has a version number' do
    expect(Voyeur::VERSION).not_to be nil
  end

  it 'has a Base class' do
  	expect(Voyeur::Base).not_to be nil
  end
end
