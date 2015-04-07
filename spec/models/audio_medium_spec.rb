require 'rails_helper'
require 'models/shared_examples/medium'

describe AudioMedium do
  context do
    let(:medium) { Medium.new_medium_of_type("audio") }
    it_behaves_like "a Medium"
  end


  it("has an audio attachment") { expect(FactoryGirl.build(:audio_medium, audio_attachment: nil)).to_not be_valid }
end