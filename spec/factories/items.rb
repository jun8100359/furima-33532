FactoryBot.define do
  factory :item do
    association :user

    item_name      { Faker::Coffee.blend_name }
    explanation    { Faker::Space.planet }
    category_id    { 2 }
    state_id       { 2 }
    burden_id      { 2 }
    prefecture_id { 2 }
    day_id        { 2 }
    price          { 500 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
