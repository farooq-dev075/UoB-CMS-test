require 'faker'

FactoryBot.define do
  factory :person_profile do

    pure_portal_url { 'https://researchportal.bath.ac.uk/en/persons' }
    role_holder_name { Faker::Lorem.word }
    subtype { 'academic_profile' }
  end
end
