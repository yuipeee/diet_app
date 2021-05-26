FactoryBot.define do
  factory :comment do
    comment_text   {'test'}
    association    :user
    association    :post
  end
end