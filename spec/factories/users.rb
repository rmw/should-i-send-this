# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do

    name { 'Test Name'}
    email { 'email@test.com' }
    password { 'test1234' }
    password { 'test1234' }

  end
end
