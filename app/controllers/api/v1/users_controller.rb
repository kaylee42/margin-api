class Api::V1::UsersController < ApplicationController
  def index

    render json: User.all
  end

  def show

    render json: User.find(params[:id])
  end

  def create


    user = User.new(user_params)
    user.save
    render json: user
  end

  def update

    user = User.find(params[:id])
    user.update(user_params)
    render json: user
  end

  def destroy

    user = User.find(params[:id])
    user.destroy
    render nothing: true
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
