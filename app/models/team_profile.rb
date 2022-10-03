class TeamProfile < ApplicationRecord
  has_and_belongs_to_many :person_profiles

  # Validate presence
  validates :title, :subtype, presence: true

  # Validate length
  validates :title, :contact_name, :contact_email, :contact_phone, length: { maximum: 255 }

  # Validate uniqueness of title
  validates_uniqueness_of :title

  # Validate subtype is in our accepted list
  validates :subtype, inclusion: { in: :valid_subtypes }

  private

  def valid_subtypes
    %w(academic_team committee leadership_team professional_service_team statutory_body working_group)
  end
end
