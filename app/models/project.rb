class Project < ApplicationRecord
  before_save :calc_project_load
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

  def calc_project_load
    self.load = project_type_load * complexity_factor * state_factor
  end

  def project_type_load
    case type_project
    when 'Site' then 1
    when 'Woocommerce' then 2
    when 'Consulting' then 2
    when 'System' then 4
    else 1
    end
  end

  def complexity_factor
    case complexity
    when 'Beginner' then 1
    when 'Intermediate' then 2
    when 'Experient' then 3
    else 1
    end
  end

  def state_factor
    case state
    when 'Stoped' then 0.2
    when 'Starting' then 1
    when 'Middle' then 1
    when 'Finishing' then 1
    when 'Support' then 0.5
    else 1
    end
  end
end
