FactoryBot.define do
  factory :post do
    text           {'test'}
    weight         {'50'}
    association    :user
  end
end