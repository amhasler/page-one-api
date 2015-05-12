class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  before_save :ensure_authentication_token

  # has_many :collections, dependent: :destroy

  # ==== VALIDATIONS ====
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 200 }
  validates :email, presence: true, length: { maximum: 200 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum:8 }

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private

    def generate_authentication_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(authentication_token: token).first
      end
    end
end
