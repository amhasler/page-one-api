# Needs
# - medium
shared_examples "a Medium" do
  subject { medium }
  it("belongs to a work") { should belong_to(:work) }

  it("has a caption") { should validate_presence_of(:caption) }

  describe ".new_medium_of_type" do
    it("returns a ImageMedium on a 'image' parameter") { expect(Medium.new_medium_of_type('image')).to be_a(ImageMedium) }
    it("returns a VideoMedium on a 'video' parameter") { expect(Medium.new_medium_of_type('video')).to be_a(VideoMedium) }
    it("returns an AudioMedium on a 'audio' parameter") { expect(Medium.new_medium_of_type('audio')).to be_a(AudioMedium) }
  end
end
