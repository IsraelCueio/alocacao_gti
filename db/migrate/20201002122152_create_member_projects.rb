class CreateMemberProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :member_projects do |t|
      t.references :member, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
