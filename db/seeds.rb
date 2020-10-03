# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Member.create(name: 'Gusta')
p '######Membro criado com sucesso######'
Project.create(
                name: 'Alocação GTi',
                descriptions:'Projeto para ajudar na alocação dos membros',
                complexity: 2,
                internal: true,
                state: 1
              )

p '######Projeto criado com sucesso######'

Position.create(name:'Diretor')

p '######Cargo criado com sucesso######'
