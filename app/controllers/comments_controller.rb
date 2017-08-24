class CommentsController < ApplicationController
  respond_to :html, :js

  def create
    @comment = Comment.new

    @comment.body = params[:body]
    @comment.user_id = params[:user_id]
    @comment.post_id = params[:post_id]

    @comment.save

    respond_to do |f|
      f.js { render('comments/addComment.js.erb') }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy
    
    respond_to do |f|
      f.js { render('comments/deleteComment.js.erb') }
    end
  end
end
