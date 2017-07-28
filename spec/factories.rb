FactoryGirl.define do
  factory :link do
    sequence :url do |n|
      "https://link#{n}.com"
    end
    reads 1
  end
end