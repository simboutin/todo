# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database'
puts 'Destroying all tasks'
Task.destroy_all
puts 'Destroying all users'
User.destroy_all

puts 'Creating John Doe user'
john = User.create!(email: 'johndoe@domain.com')
puts "User with #{john.email} email has been successfully created"

puts 'Creating tasks'
tasks = [
  { title: 'Build a todo app', description: 'For Peers & Peers customer, create an todo app to replace stickys and pen', due_date: Date.new(2021, 11, 29) },
  { title: 'Aller faire les courses' },
  { title: 'Acheter les cadeaux Noël', due_date: Date.new(2021, 12, 24) }
]

tasks.each do |task|
  new_task = Task.create!(
    title: task[:title],
    description: task[:description],
    due_date: task[:due_date],
    user: john
  )
  puts "#{new_task.title} has been created in the database"
end

puts 'All clear 👌'

