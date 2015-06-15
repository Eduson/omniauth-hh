require 'spec_helper'

describe OmniAuth::HH do
  subject do
    OmniAuth::Strategies::HH.new('appid', 'secret', {})
  end

  it 'has a version number' do
    expect(OmniAuth::HH::VERSION).not_to be nil
  end

  describe "client options" do
    it "has correct name" do
      expect(subject.options.name).to eq 'hh'
    end
  end
end
