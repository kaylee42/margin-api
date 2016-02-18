class Api::V1::TagsController < ApplicationController
  def index
    render json: Tag.all
  end

  def show
    render json: Tag.find(params[:id])
  end

  def create
    tag = Tag.new(tag_params)
    tag.save
    render json: tag
  end

  def update
    tag = Tag.find(params[:id])
    tag.update(tag_params)
    render json: tag
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    render nothing: true
  end


  private

  def tag_params
    params.require(:tag).permit(:title)
  end
end
