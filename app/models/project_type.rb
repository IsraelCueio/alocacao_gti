class ProjectType < ApplicationRecord
  after_save :update_members_loads

  belongs_to :enterprise
  has_many :projects, dependent: :destroy

  enum load: { 'no load': 0, 'low': 10, 'medium-low': 15, 'medium': 20, 'medium-high': 25, 'high':30 }

  def update_members_loads
    projects.each do |project|
      project.developers.each(&:calc_member_load)
    end
  end
end
