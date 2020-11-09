class Position < ApplicationRecord
  after_save :update_members_loads

  belongs_to :enterprise

  has_many :member_positions, dependent: :destroy
  has_many :members, through: :member_positions

  enum load: { 'low': 10, 'medium-low': 15, 'medium': 20, 'medium-high': 25, 'high':30 }

  def update_members_loads
    members.each(&:calc_member_load)
  end
end
