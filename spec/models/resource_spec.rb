require 'rails_helper'

describe Resource do
  let(:resource) { FactoryGirl.build(:resource) }

  describe "title" do
    it "should be present" do
      resource.title = " "
      expect(subject).to_not be_valid
    end

    it "should not be too long" do
      resource.title = "a" * 51
      expect(subject).to_not be_valid
    end

  end

  describe "link" do
    it "should not be too long" do
      resource.link = "a" * 251
      expect(subject).to_not be_valid
    end
  end

  describe "description" do
    it "should not be too long" do
      resource.description = "a" * 251
      expect(subject).to_not be_valid
    end
  end

end
