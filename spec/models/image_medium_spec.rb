require 'rails_helper'
require 'models/shared_examples/medium'

describe AudioMedium do
  context do
    let(:medium) { Medium.new_medium_of_type("image") }
    it_behaves_like "a Medium"
  end


  it("has an image attachment") { expect(FactoryGirl.build(:image_medium, audio_attachment: nil)).to be_valid }
end