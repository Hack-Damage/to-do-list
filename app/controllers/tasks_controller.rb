class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def edit
  end

  def new
    @task = Task.new
  end

  def create
  	task = Task.create(params.require(:name))
  	if task.save
  		redirect_to tasks_path
  	end
  end
end
