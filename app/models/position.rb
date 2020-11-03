class Position < ApplicationRecord
  after_save :update_members_loads

  belongs_to :enterprise
  
  has_many :member_positions, dependent: :destroy
  has_many :members, through: :member_positions, dependent: :destroy

  def update_members_loads
    members.each(&:calc_member_load)
  end
end
