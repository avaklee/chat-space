FactoryGirl.define do

  factory :message do
    body {Faker::Lorem.sentence}
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'files', 'test.jpg'))}
    group_id 1
    user_id 2
  end
end
