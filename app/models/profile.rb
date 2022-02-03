class Profile < ApplicationRecord
    has_many(:educations, dependent: :destroy)
    accepts_nested_attributes_for(:educations , reject_if: :reject_education_create, allow_destroy: true)

    has_many(:experiences, dependent: :destroy)
    accepts_nested_attributes_for(:experiences , reject_if: :reject_experience_create, allow_destroy: true)

    has_one_attached :avatar

    before_save :set_profile

    belongs_to :user, optional: true

    def reject_education_create(education)
        education[:degree].blank? or education[:school].blank? or education[:start].blank? or education[:end].blank?
    end

    def reject_experience_create(experience)
        experience[:company].blank? or experience[:position].blank?
    end

    private
    def set_profile
        profile.id = '1' if profile.id.nil?
    end
end