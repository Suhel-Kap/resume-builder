class AddExperienceIdToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :experience_id, :integer
    add_reference :experiences, :experience, null: true, foreign_key: true
  end
end
