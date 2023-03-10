class PersonProfile < ApplicationRecord
  VALID_IMAGE_FORMATS = %w(image/gif image/png image/jpg image/jpeg)

  # Person Profile Image using Active Storage
  has_one_attached :image

  # Person Profile having many team profiles
  has_and_belongs_to_many :team_profiles

  # Validate presence
  validates :subtype, :role_holder_name, presence: true
  validates :supervisor_availability, presence: true, unless: -> { subtype == 'academic_profile' }
  validates :pure_portal_url, presence: true, if: -> { subtype == 'academic_profile' }

  # Validate length
  validates :role_holder_name, :role_holder_title,
            length: { maximum: 65 }
  validates :honours_post_nominal_letters, :person_finder_link, :pure_portal_url,
            length: { maximum: 140 }
  validates :all_publications_url,
            length: { maximum: 255 }
  validates :achievements_in_role, :education, :research_interests, :current_research_projects,
            :role_related_posts_held, :courses_taught_undergrad, :courses_taught_postgrad,
            length: { maximum: 1_000 }
  validates :career_achievements,
            length: { maximum: 2_000 }
  validates :contact_name, :contact_email, :contact_phone, length: { maximum: 255 }

  # Validate subtype is in our accepted list
  validates :subtype, inclusion: { in: :valid_subtypes }

  # Validate as url if present
  validates :person_finder_link, :all_publications_url, :pure_portal_url, length: { maximum: 1_000 }, allow_blank: true
  validates :pure_portal_url, format: { with: %r{https?://researchportal\.bath\.ac\.uk.*}, allow_blank: true }

  # Validate image type
  validate :image_content_type

  enum supervisor_availability: { available: 0,
                                  unavailable: 1,
                                  proposals: 2,
                                  not_applicable: 3 }

  private

  def valid_subtypes
    %w(academic_profile staff_profile leadership_profile)
  end

  def image_content_type
    return unless image.attached?

    if VALID_IMAGE_FORMATS.exclude?(image.content_type)
      errors.add(:image, "Valid Image types are #{VALID_IMAGE_FORMATS.join(', ')}")
    end
  end
end
