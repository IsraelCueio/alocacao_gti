class ProjectType < ApplicationRecord
  after_save :update_members_loads

  belongs_to :enterprise

  has_many :projects

  def update_members_loads
    projects.each do |project|
      project.developers.each(&:calc_member_load)
    end
  end
end
