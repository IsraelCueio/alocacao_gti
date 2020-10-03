class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :descriptions
      t.integer :type_project
      t.integer :complexity
      t.boolean :internal
      t.integer :state

      t.timestamps
    end
  end
end
