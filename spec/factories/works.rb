FactoryGirl.define do 
  factory :work do
    # collection
    title "Lorem ipsum dolor sit amet"
    date  -450
    place "Chicago"
    circa false
    trait :tagged do
      after(:create) { |work| work.update_attributes(creator_list: 'Plato', mode_list:"Philosophy", reference_list: "Bertrand") }
    end
  end
end
