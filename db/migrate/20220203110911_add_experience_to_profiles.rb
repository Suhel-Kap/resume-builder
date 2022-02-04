class AddExperienceToProfiles < ActiveRecord::Migration[6.1]
    add_reference :profiles, :profile, null: true, foreign_key: true
end
