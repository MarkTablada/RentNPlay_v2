# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Account.create(username: "admin", password: "admin", password_confirmation: "admin", full_name: "admin", user_type: "0", email: "admin@1.1", mobile_number: "09111111111")