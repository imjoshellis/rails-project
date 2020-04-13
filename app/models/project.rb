class Project < ApplicationRecord
  has_many :users, through => :user_projects
  has_many :goals
  has_many :sprints, through => :goals
  has_many :stories, through => :sprints
end
