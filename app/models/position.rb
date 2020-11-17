class Position < ApplicationRecord
  after_save :update_members_loads

  belongs_to :enterprise

  has_many :member_positions, dependent: :destroy
  has_many :members, through: :member_positions

  enum load: { no_load: 0, low: 10, medium_low: 15, medium: 20, medium_high: 25, high:30 }

  def update_members_loads
    members.each(&:calc_member_load)
  end
end
