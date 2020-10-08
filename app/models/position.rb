class Position < ApplicationRecord
  after_save :update_load

  has_many :member_positions, dependent: :destroy
  has_many :members, through: :member_positions, dependent: :destroy

  def update_load
    members.each(&:calcload)
  end
end
