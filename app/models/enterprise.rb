class Enterprise < ApplicationRecord
  belongs_to :user

  has_many :projects
  has_many :members
  has_many :positions
  has_many :project_types
end
