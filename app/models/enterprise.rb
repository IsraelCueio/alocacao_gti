class Enterprise < ApplicationRecord
  belongs_to :user

  has_many :projects, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :positions, dependent: :destroy
  has_many :project_types, dependent: :destroy
end
