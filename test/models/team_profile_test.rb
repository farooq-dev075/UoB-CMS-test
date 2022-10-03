require 'test_helper'

class TeamProfileTest < ActiveSupport::TestCase
  def setup
    @team = FactoryBot.create(:team_profile)
  end

  def test_valid
    assert @team.valid?
  end

  def test_tilte_presence
    @team.update(title: '')
    refute @team.valid?, 'Title should have failed validation'
    assert @team.errors.added?(:title, :blank)
  end

  def test_subtype_presence
    @team.update(subtype: '')
    refute @team.valid?, 'Subtype should have failed validation'
    assert @team.errors.added?(:subtype, :blank), 'team should be invalid due to blank subtype'
    assert @team.errors.added?(:subtype, :inclusion, value: @team.subtype), 'team should be invalid due to unknown subtype'
  end

  def test_team_with_unknown_subtype_invalid
    @team.subtype = Faker::String.random(length: 8)
    refute @team.valid?, 'Expected Team Profile with unknown subtype to be invalid'
    assert @team.errors.added?(:subtype, :inclusion, value: @team.subtype), 'team should be invalid due to unknown subtype'
  end

  def test_title_uniquness
    @team2 = FactoryBot.create(:team_profile)
    @team2.update(title: @team.title)
    refute @team2.valid?
    assert @team2.errors.added?(:title, :taken, value: @team.title), 'title should be unique among teams'
  end
end
