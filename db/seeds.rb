# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

membercreate=Member.create(name: 'Gusta')
p '######Membro criado com sucesso######'

ProjectType.create(
  name: 'Site',
  load: 20
)

ProjectType.create(
  name: 'WooCommerce',
  load: 25
)

ProjectType.create(
  name: 'Consulting',
  load: 25
)

ProjectType.create(
  name: 'System',
  load: 30
)

User.create(
  email: 'oitaloeh@lindo',
  password: 'soarestbm'
)


projectcreate=Project.create(
                name: 'Alocação GTi',
                complexity: 2,
                internal: true,
                state: 1,
                project_type_id: 4
              )

MemberProject.create(
  project_id: projectcreate.id,
  member_id: membercreate.id
)

p '######Projeto criado com sucesso######'

Position.create(name:'Diretor')

p '######Cargo criado com sucesso######'
