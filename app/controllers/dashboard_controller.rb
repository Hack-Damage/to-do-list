class DashboardController < ApplicationController
	def update
		@current_person = User.where(id: params[:id]).first
		all_users = User.all
		prng = Random.new

		# all_users[prng.rand(all_users.count)].id #need to have where is_match is not equal to true.
		rando_user = all_users[prng.rand(all_users.count)]
		if rando_user.is_matched == nil
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
end
