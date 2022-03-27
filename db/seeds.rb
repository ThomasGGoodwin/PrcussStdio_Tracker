# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create(role_description: 'Admin')
Role.create(role_description: 'Member')

User.create(first_name: 'Luke', last_name: 'Yocum', email: 'yocuml19@tamu.edu', role_id: 1)
User.create(first_name: 'Thomas', last_name: 'Goodwin', email: 'thomasgoodwin@tamu.edu', role_id: 1)
User.create(first_name: 'Steven', last_name: 'Grimshaw', email: 'stevengrimshaw@tamu.edu', role_id: 1)
User.create(first_name: 'Nassef', last_name: 'Ameen', email: 'nameen1@tamu.edu', role_id: 1)
User.create(first_name: 'Cristian', last_name: 'Avalos', email: 'avalos672918@tamu.edu', role_id: 1)
User.create(first_name: 'Wyatt', last_name: 'Smith', email: 'wyattsmith@tamu.edu', role_id: 1)

EventType.create(description: 'Gig')