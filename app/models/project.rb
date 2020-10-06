class Project < ApplicationRecord
  enum type_project: [ :Site, :Woocommerce, :System ]
  enum complexity: [ :Beginner, :Intermediate, :Experient]
  enum state: [ :Starting, :Middle, :Finishing, :Support]

  has_many :member_projects
  has_many :members, through: :member_projects

  accepts_nested_attributes_for :member_projects, reject_if: :all_blank, allow_destroy: true
end
