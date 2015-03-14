class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    # method to redirect a signed in user to the task index 
  def after_sign_in_path_for(user)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      super
    else
      stored_location_for(user) || request.referer || tasks_path
    end
  end

    def index
    @tasks = Task.all
    #assign an instance variable to the current user tasks so we can list these
    #on the tasks page for the user that is signed in
    @current_user_tasks = Task.where(user_id:current_user)
    @current_user_incomplete = @current_user_tasks.where(is_complete: false)
    @current_user_comments = Comment.where(user_id:current_user)
   

    if current_user
      @current_partner = User.where(id:current_user.matchee).first

      @incomplete_partner_tasks = Task.where(user_id:@current_partner.id, is_complete: false)
      @current_user_comments_recieved = Comment.where(user_id:current_user.matchee)
      @comments = @current_user_comments + @current_user_comments_recieved
      @partner_tasks = Task.where(user_id:@current_partner.id, is_complete: false)

      puts "======================"
      puts current_user.id
      puts current_user.matchee

      puts @current_partner.matchee
      puts @partner_tasks
      puts "======================"
    
    # @current_user_comments_recieved = Comment.where(user_id:current_user.matchee) 
   # dan is messing aroun8d below this line
   # partner_tasks is what we need to iterate through on the partner page.
   # while we're at it, i'll iterate through current user tasks on our task page. 
     # me = User.where(id: current_user).first
     # @partner = User.where(id: me.matchee).first
# update to only show is not complete. 
    

    #if your tasks are nil it throws up. Here's the fix:
      if @partner_tasks == nil
        @partner_tasks_incomplete = "You don't have any tasks!"
      else
        @partner_tasks_incomplete = @partner_tasks.where(is_complete: false)
      end
    end
  end
end
