class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :goals
  has_many :sprints
  has_many :stories, through: :sprints

  validates :name, presence: true, length: {in: 6..40}
  validates :description, length: {maximum: 600}
end
