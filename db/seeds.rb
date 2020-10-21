require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
    users = User.create! name: Faker::Name.unique.name, email: Faker::Internet.unique.email, username: Faker::Name.unique.name, password: '123456', password_confirmation: '123456'
end

10.times do
    hospitals = Hospital.create! name: Faker::Team.name
end

doctor = Doctor.create! hospital_id: 1, name: "dr.saman", time_start: '07:30'.in_time_zone, time_end: '10:00'.in_time_zone

doctor = Doctor.create! hospital_id: 2, name: "dr.budiman", time_start: '08:00'.in_time_zone, time_end: '15:00'.in_time_zone
