class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :omniauthable
  belongs_to :role, default: -> { Role.find_by(name: "developer") }
  has_many :user_projects
  has_many :projects, through: :user_projects

  validates :email, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |u|
      u.provider = auth.provider
      u.name = auth.info.name
      u.uid = auth.uid
      u.email = auth.info.email
      u.password = Devise.friendly_token[0, 20]
    end
  end
end
