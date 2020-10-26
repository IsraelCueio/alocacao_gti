class Project < ApplicationRecord
  after_save :update_developers_loads, :update_managers_loads

  enum type_project: %i[Site Woocommerce Consulting System]
  enum complexity: %i[Beginner Intermediate Experient]
  enum state: %i[Stoped Starting Middle Finishing Support]

  ransacker :state, formatter: proc { |v| states[v] }
  ransacker :complexity, formatter: proc { |v| complexities[v] }
  ransacker :type_project, formatter: proc { |v| type_projects[v] }

  has_many :member_projects, dependent: :destroy
  has_many :developers, through: :member_projects, source: :member

  has_many :manager_projects, dependent: :destroy
  has_many :managers, through: :manager_projects, source: :member

  accepts_nested_attributes_for :member_projects, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :manager_projects, reject_if: :all_blank, allow_destroy: true

  def update_developers_loads
    developers.each(&:calc_member_load)
  end

  def update_managers_loads
    managers.each(&:calc_member_load)
  end
end
