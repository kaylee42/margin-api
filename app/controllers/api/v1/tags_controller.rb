class Api::V1::TagsController < ApplicationController
  def index
    render json: current_user.tags
  end

  def show
    tag = Tag.find(params[:id])
    if current_user.tags.include? tag
      render json: tag
    else
      render nothing: true
    end
  end

  def create
    tag = Tag.new(tag_params)
    if tag.save
      render json: tag
    else
      render json: {errors: tag.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    tag = Tag.find(params[:id])
    if current_user.tags.include? tag
      if tag.update(tag_params)
        render json: tag
      else
        render json: {errors: tag.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render nothing: true
    end
  end

  def destroy
    tag = Tag.find(params[:id])
    if current_user.tags.include? tag
      tag.destroy
    end
    render nothing: true
  end



  private

  def tag_params
    params.require(:tag).permit(:title)
  end
end
