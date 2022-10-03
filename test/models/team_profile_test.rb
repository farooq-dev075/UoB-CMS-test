require 'test_helper'

class TeamProfileTest < ActiveSupport::TestCase
  def setup
    @team_1 = FactoryBot.create(:team_profile)
    @team_2 = FactoryBot.create(:team_profile)
    @person_1 = FactoryBot.build(:person_profile)
    @person_2 = FactoryBot.build(:person_profile)
  end

  def test_valid
    assert @team_1.valid?
  end

  def test_tilte_presence
    @team_1.update(title: '')
    refute @team_1.valid?, 'Title should have failed validation'
    assert @team_1.errors.added?(:title, :blank)
  end

  def test_subtype_presence
    @team_1.update(subtype: '')
    refute @team_1.valid?, 'Subtype should have failed validation'
    assert @team_1.errors.added?(:subtype, :blank), 'team should be invalid due to blank subtype'
    assert @team_1.errors.added?(:subtype, :inclusion, value: @team_1.subtype), 'team should be invalid due to unknown subtype'
  end

  def test_team_with_unknown_subtype_invalid
    @team_1.subtype = Faker::String.random(length: 8)
    refute @team_1.valid?, 'Expected Team Profile with unknown subtype to be invalid'
    assert @team_1.errors.added?(:subtype, :inclusion, value: @team_1.subtype), 'team should be invalid due to unknown subtype'
  end

  def test_title_uniquness
    @team_2.update(title: @team_1.title)
    refute @team_2.valid?
    assert @team_2.errors.added?(:title, :taken, value: @team_1.title), 'title should be unique among teams'
  end

  def test_has_many_person_profiles
    @team_1.person_profiles << [@person_1, @person_2]
    @team_2.person_profiles << [@person_1]
    assert @team_1.person_profiles.count, 2
    assert @team_2.person_profiles.count, 1
    assert @person_1.team_profiles.count, 2
    assert @person_2.team_profiles.count, 1
  end
end
