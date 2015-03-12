class DashboardController < ApplicationController
	def update
		@current_person = User.where(id: params[:id]).first
		if @current_person.is_matched == true
			puts "======================"
			puts "#{@current_person} IS ALREADY MATCHED!!!"
			puts "======================"
		end
		@current_person.is_matched = true
		all_users = User.all
		prng = Random.new

		# all_users[prng.rand(all_users.count)].id #need to have where is_match is not equal to true.
		rando_user = all_users[prng.rand(all_users.count)]
		if ((rando_user.is_matched == nil) || (rando_user.is_matched == false)) && (@current_person.id != rando_user.id)
			@current_person.matchee = rando_user.id
			rando_user.matchee = @current_person.id
			if (@current_person.save && rando_user.save)
				redirect_to tasks_path
			else
				raise params.inspect
			end
		else
			redirect_to tasks_path	
		end
	end
	# This only goes one way. I need to go two ways, having matchee being the inverse of matcher. 
	# SO: y is the other person to whom youre being matched. 
	# change y.matchee so that their id is equal to current_person. 
	# TODO: Fix:
	# Current user can be matched to themselves. 
end
