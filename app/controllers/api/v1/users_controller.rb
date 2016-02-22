class Api::V1::UsersController < ApplicationController
  # def index
  #   render json: User.all
  # end

  def show
    user = User.find(params[:id])
    if user == current_user
      render json: user
    else
      render nothing: true
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    if user == current_user
      if user.update(user_params)
        render json: user
      else
        render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render nothing: true
    end
  end

  def destroy
    user = User.find(params[:id])
    if user == current_user
      user.destroy
    end
    render nothing: true
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
