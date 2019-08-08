# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    post = Post.friendly.find params[:post_id]
    comment = Comment.new(user: current_admin || current_guest, post: post)
    comment.assign_attributes comment_params
    if comment.save
      render json: comment, status: 200
    else
      render json: comment.errors.as_json(full_messages: true), status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
