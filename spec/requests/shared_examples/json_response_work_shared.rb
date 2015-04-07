require 'rspec/its'
# Needs
# - json
# - work
shared_examples "a Work JSON object" do
  its("'id'") { expect( json["id"]).to eql work.id }
  its("'title'") { expect(json["title"]).to eql work.title }
  its("'date'") { expect(json["date"]).to eql work.date }
  its("'circa'") { expect(json["circa"]).to eql work.circa }
  its("'place'") { expect(json["place"]).to eql work.place }
end
