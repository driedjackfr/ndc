# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    post = Post.friendly.find params[:post_id]
    @comment = Comment.new(user: current_admin || current_guest, post: post)
    @comment.assign_attributes comment_params
    respond_to do |format|
      if @comment.save
        format.js
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.json { render json: @comment.errors.as_json(full_messages: true), status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
