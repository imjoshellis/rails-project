class User < ApplicationRecord
  belongs_to :role
  has_many :projects, through: :user_projects
  has_secure_password
end
