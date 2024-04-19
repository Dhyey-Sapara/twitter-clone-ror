class User < ApplicationRecord
  has_secure_token :remember_token
  has_secure_password

  has_many :tweets

  has_many :followed_users, foreign_key: :follower_id, class_name: "Relationship", dependent: :destroy
  has_many :followees, through: :followed_users, dependent: :destroy

  has_many :following_users, foreign_key: :followee_id, class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :following_users, dependent: :destroy

  before_save :email_downcase

  validates :email, :username, uniqueness: true
  validates :password, confirmation: true, presence: true, format: { with: /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[\W]).{8,14}/, message: 'Password should contain atleast one lowercase character, one uppercase character, one number and one special character and it should be between 8 to 14' }

  def secure_remember_token
    SecureRandom.base58(24)
  end

  private

  def email_downcase
    self.email = email.downcase
  end
end
