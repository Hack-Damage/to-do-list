class DashboardController < ApplicationController
	def update
		@current_person = User.where(id: params[:id]).first
		if @current_person.is_matched == true
			puts "======================"
			puts "#{@current_person} IS ALREADY MATCHED!"
			puts "======================"
		end
		@current_person.is_matched = true
		all_users = User.all
		prng = Random.new
		all_unmatched = all_users.where(is_matched: false || nil)

		# all_users[prng.rand(all_users.count)].id #need to have where is_match is not equal to true.
		rando_user = all_unmatched[prng.rand(all_unmatched.count)]
		if @current_person.id != rando_user.id
			@current_person.matchee = rando_user.id
			rando_user.matchee = @current_person.id
			if (@current_person.save && rando_user.save)
				redirect_to tasks_path
			else
				raise params.inspect
			end
		else
			raise params.inspect
		end 
	end
	# This only goes one way. I need to go two ways, having matchee being the inverse of matcher. 
	# SO: y is the other person to whom youre being matched. 
	# change y.matchee so that their id is equal to current_person. 
	# TODO: Fix:
	# Current user can be matched to themselves. 
	# User can ONLY be matched up to a user where rando_user.is_matched == nil || false.
	# Need a loop that will run the number of times of all_users.count to check for unmatched users. if I run through everyone randomly it won't necessarily hit everyone since some people could be hit twice. 
	# unmatched_users = Select all users where is_matchd == false || nil. 
	# make loop run for unmatched_users.count number of times. 

	#all unmatched users:
	#a random unmatched user:


end
