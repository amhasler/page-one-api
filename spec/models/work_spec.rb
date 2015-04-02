require 'rails_helper'

describe Work do
  let(:work) { FactoryGirl.build(:work) }

  # it("belongs to a collection") { should belong_to(:collection) }

  describe "title" do
    it "should be present" do
      work.title = " "
      expect(subject).to_not be_valid
    end

    it "should not be longer than 50 characters" do
      work.title = "a" * 51
      expect(subject).to_not be_valid
    end
  end

  describe "date" do
    it "should be present" do
      work.date = " "
      expect(subject).to_not be_valid
    end

    it "should not be too long" do
      work.date = -10000
      expect(subject).to_not be_valid
    end
  end

  describe "place" do
    it "should be present" do
      work.place = " "
      expect(subject).to_not be_valid
    end
    it "should not be too long" do
      work.place = "a" * 51
      expect(subject).to_not be_valid
    end
  end

  # describe "#destroy" do
    # let(:n) { 2 }
    # let!(:media) { Array.new(n){ FactoryGirl.create(:audio_medium, work: work)} }
    # let!(:resources) { Array.new(n){ FactoryGirl.create(:resource, work: work)} }


  #  before :each do
  #    work.save!
  #    work.destroy
  #  end

  #  it "will destroy all its media" do
  #    media.each{ |medium| Medium.exists?(medium.id).should == false }
  #  end

  #  it "will destroy all its resources" do
  #    resources.each{ |resource| Resource.exists?(resource.id).should == false }
  #  end
  # end
end
