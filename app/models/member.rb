class Member < ApplicationRecord
  has_many :member_positions, dependent: :destroy
  has_many :positions, through: :member_positions

  has_many :member_projects, dependent: :destroy
  has_many :developed_projects, through: :member_projects, source: :project

  has_many :managing_projects, class_name: :Project, foreign_key: :manager_id, dependent: :destroy

  has_many :manager_projects, dependent: :destroy
  has_many :managed_projects, through: :manager_projects, source: :project

  accepts_nested_attributes_for :member_positions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :member_projects, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :manager_projects, reject_if: :all_blank, allow_destroy: true

  def calc_member_load
    update(load: calc_development_load + calc_managing_load + calc_position_load)
  end

  def calc_position_load
    positions.sum(:load)
  end

  def calc_development_load
    projects_load = 0
    developed_projects.each do |project|
      projects_load += calc_project_development_load(project)
    end
    projects_load
  end

  def calc_managing_load
    projects_load = 0
    managed_projects.each do |project|
      projects_load += calc_project_managing_load(project)
    end
    projects_load
  end

  def calc_project_development_load(project)
    project_type_load(project) * complexity_factor(project) * state_factor(project)
  end

  def calc_project_managing_load(project)
    project_type_load(project) * complexity_factor(project) * manager_state_factor(project)
  end

  def project_type_load(project)
    case project.type_project
    when 'Site' then 20
    when 'Woocommerce' then 25
    when 'Consulting' then 25
    when 'System' then 30
    else 1
    end
  end

  def complexity_factor(project)
    case project.complexity
    when 'Beginner' then 1.0
    when 'Intermediate' then 1.5
    when 'Experient' then 2.0
    else 1
    end
  end

  def state_factor(project)
    case project.state
    when 'Stoped' then 0.1
    when 'Starting' then 1
    when 'Middle' then 1
    when 'Finishing' then 1
    when 'Support' then 0.3
    else 1
    end
  end

  def manager_state_factor(project)
    case project.state
    when 'Stoped' then 0.1
    when 'Starting' then 1.0
    when 'Middle' then 0.5
    when 'Finishing' then 1.0
    when 'Support' then 0.1
    else 1
    end
  end
end
