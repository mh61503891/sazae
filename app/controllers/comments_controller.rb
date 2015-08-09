class CommentsController < ApplicationController
  before_action :set_house
  before_action :set_comment, only: [:like]

  def create
    @comment = @house.comments.create(comment_params)
    render json: { comment: @comment }
  end

  def like
    @comment.like!
    render json: { comment: @comment }
  end

  private

  def set_house
    @house = House.find(params[:house_id])
  end

  def set_comment
    @comment = @house.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
