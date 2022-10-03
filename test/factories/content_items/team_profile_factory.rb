require 'faker'

FactoryBot.define do
  factory :team_profile do

    title { Faker::Lorem.word }
    subtype { 'academic_team' }
  end
end
