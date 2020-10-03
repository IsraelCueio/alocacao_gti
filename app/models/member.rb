class Member < ApplicationRecord
  has_many :member_positions
  has_many :positions, through: :member_positions

  has_many :member_projects
  has_many :projects, through: :member_projects

  accepts_nested_attributes_for :member_positions, reject_if: :all_blank, allow_destroy: true

  def calcload
    member_load = 0
    positions.each { |position| member_load += position.load }
    projects.each do |project|
      project_load = 10
      next if project.type_project == 1 || project.type_project == 2

      project_load *= project.complexity

      member_load += project_load
    end
    member_load
  end
end
