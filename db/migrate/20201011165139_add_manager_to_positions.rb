class AddManagerToPositions < ActiveRecord::Migration[6.0]
  def change
    add_column :positions, :manager, :boolean, dafault: false
  end
end
