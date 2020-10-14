class AddManagerToProjects < ActiveRecord::Migration[6.0]
  def change
    add_reference :projects, :manager, foreign_key: { to_table: :members }
  end
end
