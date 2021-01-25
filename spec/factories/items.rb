FactoryBot.define do
  factory :item do
    item_name      { Faker::Coffee.blend_name }
    explanation    { Faker::Space.planet }
    category_id    { '2' }
    state_id       { '2' }
    burden_id      { '2' }
    prefectures_id { '2' }
    days_id        { '2' }
    price          { '500' }
    user_id        { '1' }


  end
end
