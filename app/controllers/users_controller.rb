class UsersController < ApplicationController

  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def update
  	u = User.where(id: params[:id]).first
  	u.update(params.require(:user).permit(:id, :tasks_attributes => [:id, :is_complete]))
  	redirect_to tasks_path
  end

end
