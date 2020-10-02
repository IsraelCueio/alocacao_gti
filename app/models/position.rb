class Position < ApplicationRecord
  has_many :member_positions
  has_many :members, through: :member_positions
end
