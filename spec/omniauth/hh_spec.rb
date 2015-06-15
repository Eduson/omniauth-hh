require 'spec_helper'

describe Omniauth::HH do
  it 'has a version number' do
    expect(Omniauth::HH::VERSION).not_to be nil
  end

  describe "client options" do
    it "has correct name" do
      expect(subject.options.name).to eq 'hh'
    end
  end
end
