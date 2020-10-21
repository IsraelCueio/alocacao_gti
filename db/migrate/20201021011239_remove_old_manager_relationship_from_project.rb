class RemoveOldManagerRelationshipFromProject < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :manager_id
  end
end