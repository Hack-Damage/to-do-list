# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Task.create([
                {name: "Let's make a task", is_complete: false, user_id: 2, },
                {name: "Clean kitchen", is_complete: false, user_id: 2, },
                {name: "Walk Grandpa", is_complete: false, user_id: 2, },
                {name: "Stretch", is_complete: false, user_id: 2, },
                {name: "Go to the gym", is_complete: true, user_id: 2, },
                {name: "Get groceries", is_complete: true, user_id: 2, },
                {name: "Call mom", is_complete: true, user_id: 2, },
            ])