class AddExperienceToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_reference :profiles, :profile, null: false, foreign_key: true
  end
end