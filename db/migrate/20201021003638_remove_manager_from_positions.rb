class RemoveManagerFromPositions < ActiveRecord::Migration[6.0]
  def change
    remove_column :positions, :manager
  end
end
