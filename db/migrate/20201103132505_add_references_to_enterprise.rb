class AddReferencesToEnterprise < ActiveRecord::Migration[6.0]
  def change
    add_reference :projects, :enterprise, foreign_key: true
    add_reference :members, :enterprise, foreign_key: true
    add_reference :positions, :enterprise, foreign_key: true
    add_reference :project_types, :enterprise, foreign_key: true

    admin = Admin.find_by(email: "gtiengenhariajr@gmail.com")

    User.create(
      email: admin.try(:email),
      password: "aclogoali2020"
    )

    ProjectType.all.each do |type|
      type.update(enterprise_id: Enterprise.last.id)
    end
    Member.all.each do |member|
      member.update(enterprise_id: Enterprise.last.id)
    end
    Project.all.each do |project|
      project.update(enterprise_id: Enterprise.last.id)
    end
    Position.all.each do |position|
      position.update(enterprise_id: Enterprise.last.id)
    end
  end
end
