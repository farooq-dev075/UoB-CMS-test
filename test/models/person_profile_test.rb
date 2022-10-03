require 'test_helper'

class PersonProfileTest < ActiveSupport::TestCase
  def setup
    @person = FactoryBot.build(:person_profile)
  end

  def test_valid
    assert @person.valid?
  end

  def test_invalid_role_holder
    @person.role_holder_name = Faker::String.random(length: 66)
    refute @person.valid?, 'Role holder name should have failed validation'
  end

  def test_invalid_career_achievements_too_long
    @person.career_achievements = Faker::String.random(length: 2001)
    refute @person.valid?, 'career_achievements should be forced to 2,000 chars or fewer'
    assert @person.errors.added?(:career_achievements, :too_long, count: 2_000), 'person should be invalid due to career length'
  end

  def test_person_with_unknown_subtype_invalid
    @person.subtype = Faker::String.random(length: 8)
    refute @person.valid?, 'Expected Person Profile with unknown subtype to be invalid'
    assert @person.errors.added?(:subtype, :inclusion, value: @person.subtype), 'person should be invalid due to unknown subtype'
  end

  def test_attached_image_invalid
    @person.image.attach(io: File.open("#{Rails.root.to_s}/test/fixtures/files/test.txt"), filename:'test.txt')
    refute @person.valid?
    assert @person.errors.added?(:image, 'Valid Image types are image/gif, image/png, image/jpg, image/jpeg')
  end

  def test_attached_image_valid
    @person.image.attach(io: File.open("#{Rails.root.to_s}/test/fixtures/files/test.png"), filename:'test.png')
    assert @person.valid?
    assert @person.image.attached?
  end
end
