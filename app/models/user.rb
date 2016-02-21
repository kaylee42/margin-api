class User < ActiveRecord::Base
  has_many :notebook_users
  has_many :notebooks, through: :notebook_users
  has_many :todo_lists
  has_many :todos, through: :todo_lists
  before_save :ensure_authentication_token
  has_secure_password
  validates_presence_of :name, :email, :password_confirmation
  validates :password, length: {minimum: 8}
  validates_uniqueness_of :email

  def self.authenticate(info)
    user = self.find_by(email: info[:email])
    user if user && user.authenticate(info[:password])
  end

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private

    def generate_authentication_token
      loop do
        token = SecureRandom.urlsafe_base64(15)
        break token unless User.where(authentication_token: token).any?
      end
    end
end
