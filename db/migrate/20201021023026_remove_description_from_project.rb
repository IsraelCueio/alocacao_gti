class RemoveDescriptionFromProject < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :descriptions
  end
end
