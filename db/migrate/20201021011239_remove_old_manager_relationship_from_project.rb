class RemoveOldManagerRelationshipFromProject < ActiveRecord::Migration[6.0]
  def change
    Project.all.each do |project|
      unless project.manager.id.nil?
        manager_project = ManagerProject.new(member_id: project.manager.id, project_id: project.id)
        manager_project.save if manager_project.valid?
      end
    end

    remove_column :projects, :manager_id
  end
end