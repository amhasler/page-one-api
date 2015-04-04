FactoryGirl.define do 
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Number.number(10) }
    password_confirmation { password }
  end
end