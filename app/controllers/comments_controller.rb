class CommentsController < ApplicationController
  def create
  	@comment = current_user.comments.new(comment_params)
    # @task.user_id = current_user.user_id if current_user
  	if @comment.save
  		redirect_to tasks_path
    else
       render "new"  
  	end
  end

  end

  def destroy
  end



 private
  def comment_params
      params.require(:comment).permit(
        :title, :username)
  end

