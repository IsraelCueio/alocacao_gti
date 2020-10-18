class Project < ApplicationRecord
  after_save :update_members_loads

  enum type_project: %i[Site Woocommerce Consulting System]
  enum complexity: %i[Beginner Intermediate Experient]
  enum state: %i[Stoped Starting Middle Finishing Support]

  has_many :member_projects, dependent: :destroy
  has_many :members, through: :member_projects

  belongs_to :manager, class_name: :Member, optional: true

  accepts_nested_attributes_for :member_projects, reject_if: :all_blank, allow_destroy: true

  def update_members_loads
    members.each(&:calc_member_load)
  end

end
