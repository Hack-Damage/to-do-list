class TasksController < ApplicationController
  def index
    @tasks = Task.all
    #assign an instance variable to the current user tasks so we can list these
    #on the tasks page for the user that is signed in
    @current_user_tasks = Task.where(user_id:current_user)
    @current_user_incomplete = @current_user_tasks.where(is_complete: false)
    @current_user_comments = Comment.where(user_id:current_user)
    if current_user
      @current_partner = User.where(id:current_user.matchee).first
      @current_user_comments_recieved = Comment.where(user_id:current_user.matchee)
      @comments = @current_user_comments + @current_user_comments_recieved
      @partner_tasks = Task.where(user_id:current_user.matchee)
    
    # @current_user_comments_recieved = Comment.where(user_id:current_user.matchee) 
   # dan is messing aroun8d below this line
   # partner_tasks is what we need to iterate through on the partner page.
   # while we're at it, i'll iterate through current user tasks on our task page. 
     # me = User.where(id: current_user).first
     # @partner = User.where(id: me.matchee).first
# update to only show is not complete. 
    
    partner_tasks_incomplete = @partner_tasks.where(is_complete: false)

    #if your tasks are nil it throws up. Here's the fix:
      if @partner_tasks == nil
        @partner_tasks_incomplete = "You don't have any tasks!"
      else
        @partner_tasks_incomplete = @partner_tasks.where(is_complete: false)
      end
    end
  end

  def edit
  end

  def new
    @task = Task.new
  end

  def create
  	@task = current_user.tasks.new(task_params)
    #@task.user_id = current_user.user_id if current_user
  	if @task.save
  		redirect_to tasks_path
    else
       render "new"  
  	end
  end

  def update
    task_update = Task.where(id: params[:id]).first
    task_update.is_complete = true
    if task_update.save
      redirect_to tasks_path
    else
      raise params.inspect
    end
    # puts "========================"
    # puts task_update.is_complete
    # puts "========================"
    # redirect_to tasks_path
  end

private
  def task_params
      params.require(:task).permit(
        :name, :user_id, :is_complete)
  end
end
