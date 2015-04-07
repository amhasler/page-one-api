require 'rails_helper'
require 'models/shared_examples/medium'

describe AudioMedium do
  context do
    let(:medium) { Medium.new_medium_of_type("image") }
    it_behaves_like "a Medium"
  end
end