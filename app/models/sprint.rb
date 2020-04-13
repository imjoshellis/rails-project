class Sprint < ApplicationRecord
  has_many :goals
  has_many :issues
  belongs_to :projects, through: :goals
  has_many :users, through: :projects
end
