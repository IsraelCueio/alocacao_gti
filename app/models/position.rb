class Position < ApplicationRecord
  has_many :member_positions, dependent: :destroy
  has_many :members, through: :member_positions, dependent: :destroy
end
