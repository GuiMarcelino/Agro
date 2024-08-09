FactoryBot.define do
  factory :note do
    title { FFaker::NameBR.name }
    content { FFaker::Lorem.word }
  end
end
