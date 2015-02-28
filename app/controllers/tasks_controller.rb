class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def edit
  end

  def new
    @task = Task.new
  end
end
