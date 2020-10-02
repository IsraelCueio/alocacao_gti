class CreateMemberPositions < ActiveRecord::Migration[6.0]
  def change
    create_table :member_positions do |t|
      t.references :member, null: false, foreign_key: true
      t.references :position, null: false, foreign_key: true

      t.timestamps
    end
  end
end
