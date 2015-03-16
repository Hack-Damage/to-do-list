# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
200.times do 
	Task.create([
	                {name: Random.rand(1000).to_s, is_complete: true, user_id: 13, updated_at: Date.new(2015,Random.rand(12)+1,Random.rand(28)+1) },
	                {name: Random.rand(1000).to_s, is_complete: true, user_id: 13, updated_at:Date.new(2015,Random.rand(12)+1,Random.rand(28)+1)},
	                {name: Random.rand(1000).to_s, is_complete: true, user_id: 13, updated_at:Date.new(2015,Random.rand(12)+1,Random.rand(28)+1)},
	                {name: Random.rand(1000).to_s, is_complete: true, user_id: 13, updated_at:Date.new(2015,Random.rand(12)+1,Random.rand(28)+1)},
	                {name: Random.rand(1000).to_s, is_complete: true, user_id: 13, updated_at:Date.new(2015,Random.rand(12)+1,Random.rand(28)+1)},
	                {name: Random.rand(1000).to_s, is_complete: true, user_id: 13, updated_at:Date.new(2015,Random.rand(12)+1,Random.rand(28)+1)},
	                {name: Random.rand(1000).to_s, is_complete: true, user_id: 13, updated_at:Date.new(2015,Random.rand(12)+1,Random.rand(28)+1)}
	            ])

end