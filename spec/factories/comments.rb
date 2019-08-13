FactoryBot.define do
  factory :comment do
    commenter { "MyString" }
    body { "MyText" }
    guest { nil }
  end
end
