# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Task.destroy_all
Group.destroy_all

purchases = Group.create(name: 'Purchases')
build = Group.create(name: 'Build A Plane')


task_one = Task.create(name: "Go to the bank", group_id: purchases.id)
task_one = Task.create(name: "Buy snack", group_id: purchases.id)
task_two = Task.create(name: "Buy hammer", group_id: purchases.id)
task_three = Task.create(name: "Buy wood", group_id: purchases.id)
task_four = Task.create(name: "Buy nails", group_id: purchases.id)
task_five = Task.create(name: "Buy paint", group_id: purchases.id) 
task_six = Task.create(name: "Hammer nails into wood", group_id: build.id)
task_seven = Task.create(name: "Paint wings", group_id: build.id)
task_eight = Task.create(name: "Have a snack", group_id: build.id)

# [
#   {
#     id: 1,
#     group: "Purchases",
#     task: "Go to the bank",
#     dependencyIds: [],
#     completedAt: null,
#   },
#   {
#     id: 2,
#     group: "Purchases",
#     task: "Buy hammer",
#     dependencyIds: [1],
#     completedAt: null,
#   },
#   {
#     id: 3,
#     group: "Purchases",
#     task: "Buy wood",
#     dependencyIds: [1],
#     completedAt: null,
#   },
#   {
#     id: 4,
#     group: "Purchases",
#     task: "Buy nails",
#     dependencyIds: [1],
#     completedAt: null,
#   },
#   {
#     id: 5,
#     group: "Purchases",
#     task: "Buy paint",
#     dependencyIds: [1],
#     completedAt: null,
#   },
#   {
#     id: 6,
#     group: "Build Airplane",
#     task: "Hammer nails into wood",
#     dependencyIds: [2, 3, 4],
#     completedAt: null,
#   },
#   {
#     id: 7,
#     group: "Build Airplane",
#     task: "Paint wings",
#     dependencyIds: [5, 6],
#     completedAt: null,
#   },
#   {
#     id: 8,
#     group: "Build Airplane",
#     task: "Have a snack",
#     dependencyIds: [11],
#     completedAt: null,
#   }
# ]