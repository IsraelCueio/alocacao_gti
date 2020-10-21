class RemoveLoadFromProject < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :load
  end
end
