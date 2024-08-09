FactoryBot.define do
  factory :note do
    title { FFaker::Lorem.sentence }
    content { FFaker::Lorem.characters(10) }
  end
end
