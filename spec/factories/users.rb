FactoryGirl.define do

  factory :user do
    name                  {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              "passwords"
    password_confirmation "passwords"
  end
end
