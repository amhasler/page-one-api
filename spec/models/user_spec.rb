require 'rails_helper'

describe User do
  let(:user) { FactoryGirl.build(:user) }

  it("has a name") { user.should validate_presence_of(:name) }
  it("has a password") { user.should validate_presence_of(:password) }

  it("has a password of minimum 8 characters") { user.should validate_length_of(:password).is_at_least(8) }
  it("has an email") { expect(user).to validate_presence_of(:email) }

end
