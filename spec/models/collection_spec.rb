require 'rails_helper'

describe Collection do
  let(:collection) { FactoryGirl.build(:collection) }

  it "doesn't have a title that's too long" do
    collection.title = "a" * 51
    expect(subject).to_not be_valid
  end

  describe "#destroy" do
    let(:n) { 2 }
    let!(:works) { Array.new(n){ FactoryGirl.create(:work, collection: collection)} }

    before :each do
      collection.save!
      collection.destroy
    end

    it "will destroy all its works" do
      works.each{ |work| expect(Work.exists?(work.id)).to be false }
    end
  end
end
