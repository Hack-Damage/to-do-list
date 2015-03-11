class UsersController < ApplicationController
  
  def index
  end

def show
  @user = User.find(params[:id])
end

def edit
end

def new
    @user = User.new
end

def create
    user = User.new(user_params)
    user.is_admin = false
    if @user.save
       @partnership = Partnership.new
    end
end
  
  def update
  	u = User.where(id: params[:id]).first
  	u.update(params.require(:user).permit(:id, :tasks_attributes => [:id, :is_complete]))
  	redirect_to tasks_path
  end

private

def user_params
   params.require(:user.permit(:username,:email,:is_matched,:password,:password_confirmation))  
  
end

end
  
