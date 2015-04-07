require 'rails_helper'
require 'requests/shared_examples/json_response_work_shared'

describe API do
  describe "GET /api/v1/works/" do
    it "returns an array of works" do
      get "/api/v1/works"
      expect(response.status).to eq(200)
    end

    describe "response" do
      let(:body) { JSON.parse(response.body) }
      before :each do
        get "/api/v1/works"
      end
    
      it("includes a root 'works'") { expect(body).to have_key("works") }
      it("includes an array") { expect(body["works"]).to be_a(Array) }

    end
  end

  describe "GET /api/v1/works/work_id" do
    let(:collection) { FactoryGirl.create(:collection) }
    let!(:work) { FactoryGirl.create(:work, collection: collection) }
    let(:user) { FactoryGirl.create(:user) }


    it "returns a single work" do
      get "/api/v1/works/#{work.id}"
      expect(response.status).to eq(200)
    end

    describe "response" do
      let(:body) { JSON.parse(response.body) }

      before :each do
        get "/api/v1/works/#{work.id}"
      end

      it("includes a root 'work'") { body.should have_key("work") }
      it_behaves_like "a Work JSON object" do
        let(:json) { body["work"] }
      end
    end
  end

  describe "POST /api/v1/works/" do
    let(:user) { FactoryGirl.create(:user) }
    let(:collection) { FactoryGirl.create(:collection, user: user)}

    let(:work_data) do
      {
        collection: collection.id,
        title: "Lorem ipsum dolor sit amet",
        date: 1492,
        place: "Chicago",
        circa: false,
        creators: ["Plato","Aristotle","Socrates"],
        modes: ["Philosophy","Rhetoric"],
        references: ["Bertrand Russel","Leo Strauss"]
      }
    end

    let(:old_work_count) { Work.count }
    let(:new_work) { Work.last }

    before :each do
      old_work_count
      post "/api/v1/works/", work_data
    end

    it "returns success" do
      expect(response).to be_success
    end

    it "creates a new Work" do
      expect(Work.count).to eql(old_work_count + 1)
    end

    it "sets the right attributes on the work" do
      expect(new_work.title).to eql(work_data[:title])
      expect(new_work.date).to eql(work_data[:date])
      expect(new_work.place).to eql(work_data[:place])
      expect(new_work.circa).to eql(work_data[:circa])
    end
  end

  describe "PUT /api/v1/works/work_id" do
    let(:user) { FactoryGirl.create(:user) }
    let(:collection) { FactoryGirl.create(:collection, user: user) }
    let(:work) { FactoryGirl.create(:work, collection: collection) }
    let(:work_data) do
      {
        collection: collection.id,
        title: "Lorem ipsum dolor sit amet",
        date: 1492,
        place: "Chicago",
        circa: false,
        creators: ["Plato","Aristotle","Socrates"],
        modes: ["Philosophy","Rhetoric"],
        references: ["Bertrand Russell","Leo Strauss"]
      }
    end

    describe "Modify title" do     
      let(:work_title) { "gfd" }

      before :each do
        work_data[:title] = work_title
        # put "/api/v1/works/#{work.id}", work_data
        work.reload
      end

      it "returns success" do
        expect(response).to be_success
      end

      it "updates the title of the work" do
        expect(work.title).to eql(work_title)
      end
    end
  end

  describe "DESTROY /api/v1/works/work_id" do
    let(:user) { FactoryGirl.create(:user) }
    let(:collection) { FactoryGirl.create(:collection, user: user) }
    let(:work) { FactoryGirl.create(:work, collection: collection) }

    before :each do
      delete "/api/v1/works/", id: work.id
    end

    it "returns success" do
      expect(response).to be_success
    end

    it "deletes the work" do
      expect(Work.exists?(work.id)).to be false
    end
  end
end