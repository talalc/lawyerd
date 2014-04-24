# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create(email: 'user@user.com', name: 'User', email: 'user@user.com', password: 'password', password_confirmation: 'password')
p = Partner.create(name: 'Partner', user_id: u.id)
c = Client.create(name: 'Client', partner_id: p.id)
t1 = AssignmentType.create(name: 'Draft', user_id: u.id)
t2 = AssignmentType.create(name: 'Letter', user_id: u.id)
a1 = Assignment.create(assigned_date: Time.now, due_date: '2018-04-24', client_id: c.id, assignment_type_id: t1.id)