class ApplicationController < ActionController::API
  include ActionController::Serialization
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate!

 private
   def authenticate!
     authenticate_with_http_token do |token, options|
       User.find_by(authentication_token: token)
     end

   end

   def authenticate_token
     result = authenticate_with_http_token do |token, options|
        User.find_by(authentication_token: token)
      end
      render_unauthorized if !result
   end

   def render_unauthorized
     render json: {
       errors: ['Bad credentials']
     }, status: 401
   end
end
