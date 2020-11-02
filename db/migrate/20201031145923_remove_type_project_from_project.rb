class RemoveTypeProjectFromProject < ActiveRecord::Migration[6.0]
  def change
    ProjectType.create(
      name: 'Site',
      load: '20'
    )
    
    ProjectType.create(
      name: 'Woocommerce',
      load: '25'
    )
    
    ProjectType.create(
      name: 'Consulting',
      load: '25'
    )
    
    ProjectType.create(
      name: 'System',
      load: '30'
    )
    Project.all.each do |project|
      type = ProjectType.find_by(name: project.type_project)
      project.update_columns(project_type_id: type.id)
    end
    remove_column :projects, :type_project

    Member.all.each(&:calc_member_load)
  end
end
