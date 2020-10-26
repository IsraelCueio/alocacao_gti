class CreateProjectTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :project_types do |t|
      t.string :name
      t.integer :load
    end

    add_reference :projects, :project_type, foreign_key: true
    remove_column :projects, :type_project
  end
end
