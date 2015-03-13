class TasksController < ApplicationController
  def index
    @tasks = Task.all
    #assign an instance variable to the current user tasks so we can list these
    #on the tasks page for the user that is signed in
    @current_user_tasks = Task.where(user_id:current_user)
    # @current_user_tasks.each do |task|
    #   if task.is_complete == false
    #     task.name
    #   end
    # end

    # @partner_tasks = Task.where(user_id:current_user.matchee)
    @current_partner = User.where(id:current_user.matchee).first
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
