class SessionsController < ApplicationController
  skip_before_action :authenticate!

  def create
    user = User.authenticate(user_params)
    if user
      data = {
        token: user.authentication_token,
        email: user.email
      }
      render json: data, status: 201
    else
      render json: {errors: {"login" => "could not be validated"}}, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
