class AddMaxLoadToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :max_load, :integer
  end
end
